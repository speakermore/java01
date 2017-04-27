package ynjh.personal.controller.commentarticle;

import java.sql.Timestamp;
/**
 * @author 胡林飞
 *评论文章功能
 */
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.personal.dao.commentarticle.CommentArticleMapper;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.User;
import ynjh.personal.service.CommentArticleService;

@Controller
@RequestMapping("/personal/commentarticle")
public class CommentArticleController {
	@Resource
	private CommentArticleService commentArticleService;
	/**
	 *  查看评论
	 * @param articleId 文章ID
	 * @return 跳转文章详情页
	 */
	@RequestMapping("/findcommentarticle")
	public ModelAndView findCommentArticle(Integer articleId) {
		ModelAndView mv = new ModelAndView();
		List<CommentArticle> commentArticles = commentArticleService.findUserCommentArticle(articleId);
		mv.addObject("commentArticles", commentArticles);
		mv.setViewName("personal/article/personal_articledetail");
		return mv;
	}
//	/**
//	 * 跳转评论页面
//	 * @return 跳转评论页面
//	 */
//	@RequestMapping(value = "/addcommentarticle", method = RequestMethod.GET)
//	public String gotoCreateCommentArticle(){
//		return "personal/commentarticle/personal_createcomment";
//	}
	/**
	 * 写文章评论
	 * @param commentArticle 评论文章对象
	 * @param session
	 * @return 评论已提交，提示请等待审核，评论提交失败，跳转personal_articledetail页面
	 */
	@RequestMapping("/addcommentarticle")
	public ModelAndView writeUserCommentArticle(CommentArticle commentArticle, HttpSession session) {
		ModelAndView mv = new ModelAndView("personal/info");
		User user = (User) session.getAttribute("user");
		Integer userId = user.getId();
		commentArticle.setCommentArticleTime(new Timestamp(System.currentTimeMillis()));
		commentArticle.setUsersId(userId);
		commentArticle.setCommentArticleUsersType(2);
		int result = commentArticleService.writeUserCommentArticle(commentArticle);
		if (result>0) {
			mv.addObject("operatorInfo", "评论已提交，请等待审核！");
			mv.addObject("toPage", "personal/article/lookArticleById?id="+commentArticle.getArticleId());
		}else {
			mv.addObject("operatorInfo", "评论提交失败！");
			mv.addObject("toPage", "personal/article/personal_articledetail");
		}
		return mv;

	}
	/**
	 * 删除评论
	 * @param id 评论ID
	 * @return 提示删除成功或失败
	 */
	@RequestMapping(value = "/personal_index")
	public ModelAndView deleteUserCommentArticle(Integer id) {
		int result = commentArticleService.deleteUserCommentArticle(id);
		ModelAndView mv = new ModelAndView("info");
		if (result > 0) {
			mv.addObject("operatorInfo", "删除成功");
			mv.addObject("toPage", "index");
		} else {
			mv.addObject("operatorInfo", "删除失败");
			mv.addObject("toPage", "index");
		}
		return mv;
	}

}
