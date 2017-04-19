package ynjh.company.controller.companyinformation;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.service.CompanyCommentArticleService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;

@Controller
@RequestMapping("/company")
public class CompanyCommentArticleController {
	
	@Resource
	private CompanyCommentArticleService ccArticleService;
	
	@RequestMapping(value="/comment/add_companycomment",method=RequestMethod.POST)
	public ModelAndView addCommentArticle(CommentArticle commentArticle,HttpSession session){
		Article article=(Article)session.getAttribute("article");
		Company company=(Company)session.getAttribute("company");
		commentArticle.setUsersId(company.getId());
		commentArticle.setArticleId(article.getId());
		commentArticle.setCommentArticleTime(new Timestamp(System.currentTimeMillis()));
		commentArticle.setCommentArticleUsersType(2);
		int result=ccArticleService.addArticle(commentArticle);
		ModelAndView mView=new ModelAndView("company/info");
		if (result>0) {
			mView.addObject("operatorInfo", "评论发表成功！");
			mView.addObject("toPage", "redirect:company/article/findid");
		}else {
			mView.addObject("operatorInfo", "评论发表失败，请联系管理员或重新评论！");
			mView.addObject("toPage", "redirect:company/article/findid");
		}
		return mView;
	}
	
	@RequestMapping("/comment/findcomment")
	public ModelAndView findcomment(Integer articleId,HttpSession session){
		Article article=(Article)session.getAttribute("article");
		List<CommentArticle> commentArticles=ccArticleService.findAll(article.getId());
		ModelAndView mView=new ModelAndView("redirect:company/article/findid");
		mView.addObject("comments", commentArticles);
		return mView;
	}
	
	@RequestMapping("/comment/deletecomment/{id}")
	public ModelAndView deletecomment(@PathVariable Integer id,HttpSession session){
		Article article=(Article)session.getAttribute("article");
		int result=ccArticleService.updateStatus(id,4);
		ModelAndView mView=new ModelAndView("company/info");
		if (result>0) {
			mView.addObject("operatorInfo", "删除成功！");
			mView.addObject("toPage", "company/article/findid?id="+article.getId()+"&toPage=company/companyart_detail");
		} else {
			mView.addObject("operatorInfo", "删除失败，请联系管理员或重新操作！");
			mView.addObject("toPage", "company/article/findid?id="+article.getId()+"&toPage=company/companyart_detail");
		}
		return mView;
	}
	
	@RequestMapping("/comment/likecomment/{id}")
	public ModelAndView likecomment(@PathVariable Integer id,HttpSession session){
		ccArticleService.updateLike(id);
		CommentArticle commentArticle=ccArticleService.findById(id);
		ModelAndView mView=new ModelAndView();
		mView.addObject("comment", commentArticle);
		Article article=(Article)session.getAttribute("article");
//		article.setArticleReadNum(article.getArticleReadNum()-1);
//		mView.addObject("art", article);
		mView.setViewName("redirect:../../article/findid?id="+article.getId()+"&toPage=company/companyart_detail");
		return mView;
	}
}
