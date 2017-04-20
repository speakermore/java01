package ynjh.company.controller.companyinformation;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.service.CompanyArticleService;
import ynjh.company.service.CompanyCommentArticleService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.User;


@Controller
@RequestMapping(value="/company/artanddis")
public class CompanyArticleController {
	@Resource
	private CompanyArticleService companyArticleService;
	@Resource
	private CompanyCommentArticleService ccArticleService;
	
	@RequestMapping(value={"/index","/"},method=RequestMethod.GET)
	public String index(){
		return "company/artanddis/company_index";
	}
	
	@RequestMapping(value="/article/add_companyarticle",method=RequestMethod.GET)
	public String addArticle(){
		return "company/artanddis/add_companyarticle";
	}
	
	@RequestMapping(value="/article/add_companyarticle",method=RequestMethod.POST)
	public ModelAndView addArticle(Article article,HttpSession session){
		Company company=(Company)session.getAttribute("company");
		article.setUsersId(company.getId());
		article.setArticleTime(new Timestamp(System.currentTimeMillis()));
		article.setArticleUsersType(2);
		int result=companyArticleService.addArticle(article);
		ModelAndView mView=new ModelAndView();
		if (result>0) {
			mView.setViewName("company/info");
			mView.addObject("operatorInfo", "文章添加成功！");
			mView.addObject("toPage","company/artanddis/article/find/1");
		}else {
			mView.addObject("operatorInfo", "文章添加失败！");
			mView.setViewName("redirect:company/artanddis/add_companyarticle");
		}
		return mView;
	}
	
	@RequestMapping("/article/find/{page}")
	public ModelAndView find(@PathVariable Integer page){
		List<Article> articles=companyArticleService.findAll(page);
		int maxPage=companyArticleService.findMaxPage();
		List<Integer> pageNo=new ArrayList<Integer>();
		for(int i=1;i<=maxPage;i++){
			pageNo.add(i);
		}
		ModelAndView mView=new ModelAndView("company/artanddis/company_index");
		mView.addObject("articles", articles);
		mView.addObject("curPage2", page);
		mView.addObject("maxPage2", maxPage);
		mView.addObject("pageNo2", pageNo);
		return mView;
	}
	
	@RequestMapping("/article/findid")
	public ModelAndView findId(Integer id,String toPage,HttpSession session,HttpServletRequest request){
		String addr=request.getLocalAddr();
		String readAddr=(String) session.getAttribute("readAddr");
		if(!addr.equals(readAddr)){
			companyArticleService.updateRead(id);
			session.setAttribute("readAddr",addr);
		}
		Article article=companyArticleService.findById(id);
		session.setAttribute("article", article);
		List<CommentArticle> commentArticles=ccArticleService.findAll(article.getId());
		ModelAndView mView=new ModelAndView();
		mView.addObject("art", article);
		mView.addObject("comments", commentArticles);
		mView.setViewName(toPage);
		return mView;
	}
	
	@RequestMapping("/article/delete")
	public ModelAndView delete(Integer id,Integer articleStatus){
		int result=companyArticleService.updateStatus(id,4);
		ModelAndView mView=new ModelAndView("company/info");
		if (result>0) {
			mView.addObject("operatorInfo","删除成功！");
			mView.addObject("toPage", "company/artanddis/article/find/1");
		}else {
			mView.addObject("operatorInfo", "删除失败！");
			mView.addObject("toPage", "company/artanddis/index");
		}
		
		return mView;
	}

	@RequestMapping(value="/article/edit",method=RequestMethod.POST)
	public ModelAndView edit(Integer id,String articleContent){
		int result=companyArticleService.updateArtContent(id,articleContent);
		ModelAndView mView=new ModelAndView("company/info");
		if(result>0){
			mView.addObject("operatorInfo", "修改文章内容成功");
			mView.addObject("toPage", "company/artanddis/article/find/1");
		}else {
			mView.addObject("operatorInfo", "修改文章内容失败！");
			mView.addObject("toPage", "../../companyart_edit");
		}
		return mView;
	}
	
	@RequestMapping("/article/like/{id}")
	public ModelAndView like(@PathVariable Integer id){
		companyArticleService.updateLike(id);
		Article article=companyArticleService.findById(id);
		ModelAndView mView=new ModelAndView();
		mView.addObject("art",article);
		mView.setViewName("redirect:../../article/findid?id="+id+"&toPage=company/artanddis/companyart_detail");
		return mView;
	}
	
	@RequestMapping("/article/upload")	
	public static void upload(MultipartFile upload,HttpSession session,HttpServletRequest request,HttpServletResponse response){
		try {
		//重命名文件名
		String path=session.getServletContext().getRealPath("WEB-INF/resources/company/img");
		String oldFileName=upload.getOriginalFilename();
		String suffix="."+FilenameUtils.getExtension(oldFileName);
		String newFileName=System.currentTimeMillis()+RandomUtils.nextInt(1000)+suffix;
		String uploadContentType=upload.getContentType(); // 文件类型
		String callback = request.getParameter("CKEditorFuncNum");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		if (uploadContentType.equals("image/pjpeg")
				|| uploadContentType.equals("image/jpeg")) {
			// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
			oldFileName = ".jpg";
		} else if (uploadContentType.equals("image/png")
				|| uploadContentType.equals("image/x-png")) {
			// IE6上传的png图片的headimageContentType是"image/x-png"
			oldFileName = ".png";
		} else if (uploadContentType.equals("image/gif")) {
			oldFileName = ".gif";
		} else if (uploadContentType.equals("image/bmp")) {
			oldFileName = ".bmp";
		} else {
			out.println("<script type=\"text/javascript\">");  
			out.println("window.parent.CKEDITOR.tools.callFunction("  
			+ oldFileName + ",'',"  
			+ "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");  
			out.println("</script>"); 
			
		}
		if (upload.getSize() > 1024 * 1024 * 2) {  
			out.println("<script type=\"text/javascript\">");  
			out.println("window.parent.CKEDITOR.tools.callFunction("  
			+ callback + ",''," + "'文件大小不得大于2M');");  
			out.println("</script>");  
			
		}
		//创建File,并且服务器上创建实际存在的文件
		File newupload=new File(path+"/"+newFileName);
		if(!newupload.exists()){
			System.out.println(newupload.mkdirs());
		}
		
		//将imgpath写到磁盘上
		upload.transferTo(newupload);
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
				+ ",'"+request.getContextPath()+"/company/img/" + newFileName + "','')");
		out.println("</script>");
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
}
