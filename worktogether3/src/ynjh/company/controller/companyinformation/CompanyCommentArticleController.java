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

import ynjh.company.service.CompanyCommentArticleService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.User;

@Controller
@RequestMapping("/company/artanddis")
public class CompanyCommentArticleController {
	
	@Resource
	private CompanyCommentArticleService ccArticleService;
	
	@RequestMapping(value="/comment/add_companycomment",method=RequestMethod.POST)
	public ModelAndView addCommentArticle(CommentArticle commentArticle,HttpSession session){
		Article article=(Article)session.getAttribute("article");
		User user=(User)session.getAttribute("user");
		commentArticle.setUsersId(user.getId());
		commentArticle.setArticleId(article.getId());
		commentArticle.setCommentArticleTime(new Timestamp(System.currentTimeMillis()));
		commentArticle.setCommentArticleUsersType(2);
		int result=ccArticleService.addArticle(commentArticle);
		ModelAndView mView=new ModelAndView("company/info");
		if (result>0) {
			mView.addObject("operatorInfo", "评论发表成功！");
			mView.addObject("toPage", "../article/findid?id="+article.getId()+"&toPage=company/artanddis/companyart_detail");
		}else {
			mView.addObject("operatorInfo", "评论发表失败，请联系管理员或重新评论！");
			mView.addObject("toPage", "../article/findid?id="+article.getId()+"&toPage=company/artanddis/companyart_detail");
		}
		return mView;
	}
	
	@RequestMapping("/comment/findcomment")
	public ModelAndView findcomment(Integer articleId,HttpSession session){
		Article article=(Article)session.getAttribute("article");
		List<CommentArticle> commentArticles=ccArticleService.findAll(article.getId());
		CommentArticle commentArticle=(CommentArticle)session.getAttribute("commentArticle");
		session.setAttribute("usersId", commentArticle.getUsersId());
		ModelAndView mView=new ModelAndView("redirect:company/artanddis/article/findid");
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
			mView.addObject("toPage", "../../article/findid?id="+article.getId()+"&toPage=company/artanddis/companyart_detail");
		} else {
			mView.addObject("operatorInfo", "删除失败，请联系管理员或重新操作！");
			mView.addObject("toPage", "company/artanddis/article/findid?id="+article.getId()+"&toPage=company/artanddis/companyart_detail");
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
		mView.setViewName("redirect:../../article/findid?id="+article.getId()+"&toPage=company/artanddis/companyart_detail");
		return mView;
	}
}
