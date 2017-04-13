package ynjh.personal.controller.article;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.personal.entity.Article;
import ynjh.personal.entity.User;
import ynjh.personal.service.ArticleService;

@Controller
@RequestMapping("/personal/article")
public class ArticleController {
	@Resource
	private ArticleService articleService;

	// 跳转
	@RequestMapping(value = "/add_article", method = RequestMethod.GET)
	public String addArticle() {
		return "personal/article/personal_addarticle";
	}

	// 添加文章
	@RequestMapping(value = "/add_article", method = RequestMethod.POST)
	public ModelAndView addArticle(Article article, HttpSession session) {
		User user = (User) session.getAttribute("user");
		article.setUsersId(user.getId());
		article.setArticleTime(new Timestamp(System.currentTimeMillis()));
		article.setArticleUsersType(2);
		int result = articleService.writeUserArticle(article);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "文章添加成功！");
			mv.setViewName("personal/user/personal_index");

		} else {
			mv.addObject("operatorInfo", "文章添加失败!");
			mv.setViewName("personal/article/personal_addarticle");
		}
		return mv;
	}

	// 查看文章(所有)
	@RequestMapping("/lookArticleList")
	public ModelAndView findAllArticle(Integer usersId) {
		List<Article> articles = articleService.findUserArticle(usersId);
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		mv.addObject("articles", articles);
		return mv;
	}

	// 查看文章（详细）
	@RequestMapping(value = "/lookArticleById", method = RequestMethod.GET)
	public ModelAndView findArticleById(Integer id) {
		ModelAndView mv = new ModelAndView();
		Article article = articleService.findArticleById(id);
		mv.addObject("article", article);
		mv.setViewName("personal/article/personal_articledetail");
		return mv;
	}

	// 删除文章
	@RequestMapping("/deleteUserAricle")
	public ModelAndView deleteUserCommentArticle(Integer id) {
		int result = articleService.deleteUserArticle(id);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复文章成功！");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "恢复文章失败！");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}

	// 跳转修改页
	@RequestMapping(value = "/gotoUpdateArticle", method = RequestMethod.GET)
	public ModelAndView gotoUpdateArticle(Integer id) {
		ModelAndView mv = new ModelAndView();
		Article article = articleService.findArticleById(id);
		if (article != null) {
			mv.addObject("article", article);
			mv.setViewName("personal/article/personal_articleedit");
		}
		return mv;
	}

	// 修改文章内容
	@RequestMapping("/updateArticle")
	public ModelAndView uptateArticleContent(Article article) {
		int result = articleService.updateArticleContent(article);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "修改文章内容成功！");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "修改文章内容失败，请联系管理员");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}

	// 点赞数
	@RequestMapping("/updateLike")
	public ModelAndView updateLike(Integer id) {
		articleService.updateLikeNum(id);
		Article article = (Article) articleService.findUserArticle(id);
		ModelAndView mv = new ModelAndView("personal_articledetail");
		mv.addObject("article", article);
		return mv;
	}

	// 恢复被删文章
	@RequestMapping("/renewArticle")
	public ModelAndView renewArticle(Integer id) {
		ModelAndView mv = new ModelAndView();
		int result = articleService.renewArticle(id);
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复文章成功！");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "恢复文章失败！");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}

	// 查询被删文章
	@RequestMapping("/findArticleByDelete")
	public ModelAndView findByDelete(Integer usersId) {
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		List<Article> articleBD = articleService.selectArticleByDelete(usersId);
		mv.addObject("articleBD", articleBD);
		return mv;
	}

}