package ynjh.personal.controller.commentarticle;

import java.sql.Timestamp;
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
//	写文章评论
	@RequestMapping(value="addcommentarticle",method=RequestMethod.POST)
	public ModelAndView writeUserCommentArticle(String commentArticleContent,HttpSession session){
		Article article=(Article) session.getAttribute("article");
		User user=(User) session.getAttribute("user");
		Integer userId=user.getId();
		Integer articleId=article.getId();
		ModelAndView mv=new ModelAndView("info");
		CommentArticle commentArticle=new CommentArticle();
		commentArticle.setCommentArticleTime(new Timestamp(System.currentTimeMillis()));
		commentArticle.setArticleId(articleId);
		commentArticle.setCommentArticleContent(commentArticleContent);
		commentArticle.setUsersId(userId);
		int result=commentArticleService.writeUserCommentArticle(commentArticle);
		mv.addObject("operatorInfo", "评论已提交，请等待审核！");
		mv.addObject("toPage","personal_commentArticle");
		return mv;
		
	}
//	查看评论
	@RequestMapping(value="lookcommentArticle")
	public ModelAndView findAllArticle(Integer id){
		List<CommentArticle> articles=commentArticleService.findUserCommentArticle(id);
		ModelAndView mv=new ModelAndView("personal_index");
		mv.addObject("articles", articles);
		return mv;
	}

//	删除评论
	@RequestMapping(value="personal_index")
	public ModelAndView deleteUserCommentArticle(Integer id){
		int result=commentArticleService.deleteUserCommentArticle(id);
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
