package ynjh.company.controller.companyinformation;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyDetailImg;
import ynjh.company.entity.LikeNum;
import ynjh.company.service.CompanyArticleService;
import ynjh.company.service.CompanyCommentArticleService;
import ynjh.company.service.CompanyService;
import ynjh.company.service.LikeNumService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.User;

/**
 * 
 * @author 黄冰雁
 *
 */
@Controller
@RequestMapping(value="/company/artanddis")
public class CompanyArticleController {
	@Resource
	private CompanyArticleService companyArticleService;
	@Resource
	private CompanyCommentArticleService ccArticleService;
	@Resource
	private CompanyService companyService;
	@Resource
	private LikeNumService likeService;
	/**
	 * 
	 * @author 黄冰雁
	 * 返回企业首页
	 */
	@RequestMapping(value={"/index","/"},method=RequestMethod.GET)
	public String index(){
		return "company/artanddis/company_index";
	}
	
	/**
	 * 
	 * @author 黄冰雁
	 * 跳转添加企业每日动态页面
	 */
	@RequestMapping(value="/add_companyarticle",method=RequestMethod.GET)
	public String addArticle(){
		return "company/artanddis/add_companyarticle";
	}
	
	/**
	 * 
	 * @author 黄冰雁
	 * 页面添加文章数据完成添加每日动态
	 */
	@RequestMapping(value="/add_companyarticle",method=RequestMethod.POST)
	public ModelAndView addArticle(Article article,HttpSession session){
		Company company=(Company)session.getAttribute("user");
		article.setUsersId(company.getId());
		article.setArticleTime(new Timestamp(System.currentTimeMillis()));
		article.setArticleUsersType(1);
		article.setArticleStatus(1);
		companyArticleService.addArticle(article);
		
		ModelAndView mView=new ModelAndView("company/artanddis/add_companyarticle");
		return mView;
	}
	
	/**
	 * 
	 * @author 黄冰雁
	 * 参数page：实现分页效果
	 * 根据企业用户id查询所以企业
	 */
	@RequestMapping("/article/find/{page}")
	public ModelAndView find(@PathVariable Integer page,HttpSession session){
		Company company=(Company) session.getAttribute("user");
		List<Article> articles=companyArticleService.findAll(page,company.getId());
		List<CompanyDetailImg> detailImgs = companyService.findDetailImg(company.getId());
		int maxPage=companyArticleService.findMaxPage();
		List<Integer> pageNo=new ArrayList<Integer>();
		if (maxPage <=5 ) {
			for(int i= 1;i <=maxPage;i++){
				pageNo.add(i);
			}
        }else if (maxPage >5) {
        	if (page<3) {
        		for(int i= 1;i <=5;i++){
    				pageNo.add(i);
    			}
			}
        	if (page>=3) {
        		for (int i = page; i < page+5; i++) {
            		if (page>=maxPage) {
						pageNo.add(i-4);
					} else if (page>maxPage-2&&page<=maxPage-1) {
						pageNo.add(i-3);
					} else {
						pageNo.add(i-2);
					}
    			}
			}
		}
		ModelAndView mView=new ModelAndView("company/artanddis/company_index");
		mView.addObject("articles", articles);
		mView.addObject("curPage2", page);
		mView.addObject("maxPage2", maxPage);
		mView.addObject("pageNo2", pageNo);
		session.setAttribute("detailImgs", detailImgs);
		return mView;
	}
	
	/**
	 * 
	 * @author 黄冰雁
	 * 参数id：根据id查询文章和该文章的所有评论
	 */
	@RequestMapping("/article/findid")
	public ModelAndView findId(Integer id,String toPage,HttpSession session,HttpServletRequest request){
		String addr=request.getLocalAddr();
		String readAddr=(String) session.getAttribute("readAddr");
		if(!addr.equals(readAddr)){
			companyArticleService.updateRead(id);
			session.setAttribute("readAddr",addr);
		}
		Article article=companyArticleService.findById(id);
		session.setAttribute("art", article);
		List<CommentArticle> commentArticles=ccArticleService.findAll(article.getId());
		ModelAndView mView=new ModelAndView();
		mView.addObject("comments", commentArticles);
		mView.setViewName(toPage);
		return mView;
	}
	
	/**
	 * 
	 * @author 黄冰雁
	 * 参数id:根据id查询删除文章
	 */
	@RequestMapping("/article/delete")
	public ModelAndView delete(Integer id){
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

	/**
	 * 
	 * @author 黄冰雁
	 * 参数id:根据id查询文章并修改文章
	 */
	/*@RequestMapping(value="/article/edit",method=RequestMethod.POST)
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
	}*/
	
	/**
	 * 
	 * @author 黄冰雁
	 * 参数id:根据id查询文章，递增点赞数
	 */
	@RequestMapping("/article/like")
	public ModelAndView like(Integer id,HttpSession session,LikeNum likeNum){
		companyArticleService.updateLike(id);
		Article article=companyArticleService.findById(id);
		Object user=session.getAttribute("user");
		if(user instanceof Company){
			likeNum.setArticleId(article.getId());
			likeNum.setUsersId(((Company) user).getId());
			likeService.addLike(likeNum);
		} else if (user instanceof User) {
			likeNum.setArticleId(article.getId());
			likeNum.setUsersId(((User) user).getId());
			likeService.addLike(likeNum);
		}
		ModelAndView mView=new ModelAndView();
		mView.addObject("art",article);
		mView.setViewName("redirect:../article/findid?id="+id+"&toPage=company/artanddis/companyart_detail");

		
		return mView;
	}
	
//	@RequestMapping("/article/upload")	
//	public static void upload(MultipartFile upload,HttpSession session,HttpServletRequest request,HttpServletResponse response){
//		try {
//		//重命名文件名
//		Company company=(Company)session.getAttribute("company");
//		String path=session.getServletContext().getRealPath("WEB-INF/resources/company/img"+company.getId());
//		String oldFileName=upload.getOriginalFilename();
//		String suffix="."+FilenameUtils.getExtension(oldFileName);
//		String newFileName=System.currentTimeMillis()+RandomUtils.nextInt(1000)+suffix;
//		String uploadContentType=upload.getContentType(); // 文件类型
//		String callback = request.getParameter("CKEditorFuncNum");
//		response.setCharacterEncoding("UTF-8");
//		PrintWriter out=response.getWriter();
//		
//		if (uploadContentType.equals("image/pjpeg")
//				|| uploadContentType.equals("image/jpeg")) {
//			// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
//			oldFileName = ".jpg";
//		} else if (uploadContentType.equals("image/png")
//				|| uploadContentType.equals("image/x-png")) {
//			// IE6上传的png图片的headimageContentType是"image/x-png"
//			oldFileName = ".png";
//		} else if (uploadContentType.equals("image/gif")) {
//			oldFileName = ".gif";
//		} else if (uploadContentType.equals("image/bmp")) {
//			oldFileName = ".bmp";
//		} else {
//			out.println("<script type=\"text/javascript\">");  
//			out.println("window.parent.CKEDITOR.tools.callFunction("  
//			+ oldFileName + ",'',"  
//			+ "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");  
//			out.println("</script>"); 
//			
//		}
//		if (upload.getSize() > 1024 * 1024 * 2) {  
//			out.println("<script type=\"text/javascript\">");  
//			out.println("window.parent.CKEDITOR.tools.callFunction("  
//			+ callback + ",''," + "'文件大小不得大于2M');");  
//			out.println("</script>");  
//			
//		}
//		//创建File,并且服务器上创建实际存在的文件
//		File newupload=new File(path+"/"+newFileName);
//		if(!newupload.exists()){
//			System.out.println(newupload.mkdirs());
//		}
//		
//		//将imgpath写到磁盘上
//		upload.transferTo(newupload);
//		out.println("<script type=\"text/javascript\">");
//		out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
//				+ ",'"+request.getContextPath()+"/company/img/" + newFileName + "','')");
//		out.println("</script>");
//	} catch (Exception e) {
//		e.printStackTrace();
//	}
//	}
	
	/**
	 * 牟勇：跳转到公司首页
	 * @return
	 */
	@RequestMapping("/company_index")
	public String companyIndex(){
		return "company/artanddis/company_index";
	}
}
