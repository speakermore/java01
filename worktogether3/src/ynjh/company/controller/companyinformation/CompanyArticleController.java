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
import ynjh.company.service.CompanyArticleService;
import ynjh.company.service.CompanyCommentArticleService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;


@Controller
@RequestMapping(value="/company")
public class CompanyArticleController {
	@Resource
	private CompanyArticleService companyArticleService;
	@Resource
	private CompanyCommentArticleService ccArticleService;
	
	@RequestMapping(value={"/index","/"},method=RequestMethod.GET)
	public String index(){
		return "company/company_index";
	}
	
	@RequestMapping(value="/article/add_companyarticle",method=RequestMethod.GET)
	public String addArticle(){
		return "company/add_companyarticle";
	}
	
	@RequestMapping(value="/article/add_companyarticle",method=RequestMethod.POST)
	public ModelAndView addArticle(Article article,HttpSession session){
		Company company=(Company)session.getAttribute("company");
		article.setUsersId(7);
		article.setArticleTime(new Timestamp(System.currentTimeMillis()));
		article.setArticleUsersType(2);
		int result=companyArticleService.addArticle(article);
		ModelAndView mView=new ModelAndView();
		if (result>0) {
			mView.setViewName("company/info");
			mView.addObject("operatorInfo", "文章添加成功！");
			mView.addObject("toPage","company/article/find/1");
		}else {
			mView.addObject("operatorInfo", "文章添加失败！");
			mView.setViewName("redirect:company/add_companyarticle");
		}
		return mView;
	}
	
	@RequestMapping(value="/article/find/{page}",method=RequestMethod.POST)
	public ModelAndView find(@PathVariable Integer page){
		List<Article> articles=companyArticleService.findAll(page);
		int maxPage=companyArticleService.findMaxPage();
		List<Integer> pageNo=new ArrayList<Integer>();
		for(int i=1;i<=maxPage;i++){
			pageNo.add(i);
		}
		ModelAndView mView=new ModelAndView("company/company_index");
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
			mView.addObject("toPage", "company/article/find/1");
		}else {
			mView.addObject("operatorInfo", "删除失败！");
			mView.addObject("toPage", "index");
		}
		
		return mView;
	}

	@RequestMapping(value="/article/edit",method=RequestMethod.POST)
	public ModelAndView edit(Integer id,String articleContent){
		int result=companyArticleService.updateArtContent(id,articleContent);
		ModelAndView mView=new ModelAndView("company/info");
		if(result>0){
			mView.addObject("operatorInfo", "修改文章内容成功");
			mView.addObject("toPage", "company/article/find/1");
		}else {
			mView.addObject("operatorInfo", "修改文章内容失败！");
			mView.addObject("toPage", "company/companyart_edit");
		}
		return mView;
	}
	
	@RequestMapping("/article/like/{id}")
	public ModelAndView like(@PathVariable Integer id){
		companyArticleService.updateLike(id);
		Article article=companyArticleService.findById(id);
		ModelAndView mView=new ModelAndView();
		mView.addObject("art",article);
		mView.setViewName("redirect:../../article/findid?id="+id+"&toPage=company/companyart_detail");
		return mView;
	}
}
