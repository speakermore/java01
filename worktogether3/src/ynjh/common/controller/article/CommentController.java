package ynjh.common.controller.article;

import java.sql.Timestamp;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.entity.MyUser;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.service.CommentArticleService;
/**
 * @author 胡林飞
 *评论文章功能
 */
@Controller
@RequestMapping("/common/article/comment")
public class CommentController {
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
		List<CommentArticle> commentArticles = commentArticleService.findCommentByArticleId(articleId);
		mv.addObject("commentArticles", commentArticles);
		mv.setViewName("personal/article/personal_articledetail");
		return mv;
	}

	/**
	 * 添加文章评论
	 * @param commentArticle 评论文章对象
	 * @param session
	 * @return 评论已提交，提示请等待审核，评论提交失败，跳转personal_articledetail页面
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView addComment(CommentArticle commentArticle, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/common/article/findArticleById/"+commentArticle.getArticleId());
		MyUser user = (MyUser) session.getAttribute("user");
		commentArticle.setCommentArticleTime(new Timestamp(System.currentTimeMillis()));
		commentArticle.setUsersId(user.getId());
		//判断用户的类型1是企业，2是个人
		commentArticle.setCommentArticleUsersType(user.getId()>=1234567890?2:1);
		commentArticle.setCommentArticleStatus(1);
		commentArticleService.addComment(commentArticle);
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
