package ynjh.personal.controller.article;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.User;
import ynjh.personal.service.ArticleService;

/**
 * @author 胡林飞 文章功能
 */
@Controller
@RequestMapping("/personal/article")
public class ArticleController {
	@Resource
	private ArticleService articleService;

	/**
	 * 跳转页面
	 * 
	 * @return 跳转到personal_addarticle页面
	 */
	@RequestMapping(value = "/add_article", method = RequestMethod.GET)
	public String addArticle() {
		return "personal/article/personal_addarticle";
	}

	/**
	 * 添加文章
	 * 
	 * @param article
	 *            文章对象
	 * @param session
	 * @return 成功跳转index 失败跳转addarticle
	 */
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
			mv.setViewName("redirect:../article/lookArticleList?toPage=1&userId=" + user.getId());

		} else {
			mv.addObject("operatorInfo", "文章添加失败!");
			mv.setViewName("personal/article/personal_addarticle");
		}
		return mv;
	}

	/**
	 * 查看文章(所有)ajax
	 * 
	 * @param toPage
	 *            跳转页面
	 * @param userId
	 *            用户ID
	 * @param session
	 * @return 页面信息
	 */
	@RequestMapping("/ajaxLookArticleList")
	@ResponseBody
	public Object ajaxFindAllArticle(Integer toPage, Integer userId) {
		List<Article> articles = articleService.findUserArticle(toPage, userId);
		int maxPage = articleService.getMaxArticleById(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		StringBuffer sb = new StringBuffer();
		
		for (Article article : articles) {
			sb.append("<tr>");
			sb.append("<td><a href='personal/article/lookArticleById?id=" + article.getId() + "' >"
					+ article.getArticleTitle() + "</a></td>");
			sb.append("<td>" + sdf.format(article.getArticleTime()) + "</td>");
			if (article.getArticleStatus() == 1) {
				sb.append("<th>待审核</th>");
			} else if (article.getArticleStatus() == 2) {
				sb.append("<th>正常</th>");
			} else if (article.getArticleStatus() == 3) {
				sb.append("<th>审核未通过</th>");
			} else if (article.getArticleStatus() == 4) {
				sb.append("<th>已被删除</th>");
			}
			sb.append("<td>");
			if (article.getArticleStatus() == 4) {
					sb.append("<a href=\"personal/article/gotoUpdateArticle?id=${art.id }\">修改</a>|<a href=\"javascript:if(confirm('你确定真的要恢复这篇文章吗？')){location.href='personal/article/renewArticle?id=${art.id }'}\">恢复</a>");
			}else {
				sb.append("<a href=\"personal/article/gotoUpdateArticle?id=${art.id }\">修改</a>|<a href=\"javascript:if(confirm('你确定真的要删除这篇文章吗？')){location.href='personal/article/deleteUserAricle?id=${art.id }'}\">删除</a>");
			}
				sb.append("</td>");
				sb.append("</tr>");
		
		}
		/*for (Article article : articles) {
			sb.append("<tr>");
			sb.append("<td><a href=\"personal/article/lookArticleById?id=" + article.getId() + "\">"
					+ article.getArticleTitle() + "</a></td>");
			sb.append("<td>" + sdf.format(article.getArticleTime()) + "</td>");
			if (article.getArticleStatus() == 1) {
				sb.append("<th>待审核</th>");
			} else if (article.getArticleStatus() == 2) {
				sb.append("<th>正常</th>");
			} else if (article.getArticleStatus() == 3) {
				sb.append("<th>审核未通过</th>");
			} else if (article.getArticleStatus() == 4) {
				sb.append("<th>已被删除</th>");
			}
			sb.append(
					"<td><a href=\"personal/article/gotoUpdateArticle?id=${art.id }\">修改</a>|<a href=\"javascript:if(confirm('你确定真的要恢复被删的简历吗？')){location.href='personal/article/deleteUserAricle?id=${art.id }'}\">删除</a></td>");
			sb.append("</tr>");
		}*/
		sb.append("---" + toPage + "---" + maxPage);
		return sb.toString();
	}

	/*@RequestMapping("/lookArticleList")
	public ModelAndView findAllArticle(Integer toPage, Integer userId, HttpSession session) {
		List<Article> articles = articleService.findUserArticle(toPage, userId);
		int maxPage = articleService.getMaxArticleById(userId);
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		mv.addObject("curArticlePage", toPage);
		mv.addObject("maxArticlePage", maxPage);
		mv.addObject("articles", articles);
		session.setAttribute("articles", articles);
		// session.setAttribute("curPage", toPage);
		// session.setAttribute("maxPage", maxPage);
		// mv.setViewName("redirect:../resume/findAllResume?toPage=1&userId="+userId);

		return mv;
	}*/

	/**
	 * ( 查看文章（详细）
	 * 
	 * @param id
	 *            文章ID
	 * @return 返回文章详情查看页
	 */
	@RequestMapping(value = "/lookArticleById", method = RequestMethod.GET)
	public ModelAndView findArticleById(Integer id) {
		ModelAndView mv = new ModelAndView();
		Article article = articleService.findArticleById(id);
		mv.addObject("article", article);
		mv.setViewName("personal/article/personal_articledetail");
		return mv;
	}

	/**
	 * 删除文章
	 * 
	 * @param id
	 *            文章ID
	 * @return 删除成功，跳转当前页，删除失败，也是跳转当前页
	 */
	@RequestMapping("/deleteUserAricle")
	public ModelAndView deleteUserCommentArticle(Integer id,HttpSession session) {
		int result = articleService.deleteUserArticle(id);
		ModelAndView mv = new ModelAndView();
		User user =(User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "删除文章成功！");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId="+user.getId());
		} else {
			mv.addObject("operatorInfo", "删除文章失败！");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}

	/**
	 * 跳转修改页
	 * 
	 * @param id
	 *            文章ID
	 * @return 如果不为空，跳转修改页面
	 */
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

	/**
	 * 修改文章内容
	 * 
	 * @param article
	 *            w文章对象
	 * @return 修改文章内容成功，跳转index，失败也是index
	 */
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

	/**
	 * 点赞数
	 * 
	 * @param id
	 *            文章ID
	 * @return 点赞成功，跳转当前页
	 */
	@RequestMapping("/updateLike")
	public ModelAndView updateLike(Integer id) {
		articleService.updateLikeNum(id);
		Article article = (Article) articleService.findArticleById(id);
		ModelAndView mv = new ModelAndView("personal/article/personal_articledetail");
		mv.addObject("article", article);
		return mv;
	}

	/**
	 * 恢复被删文章
	 * 
	 * @param id
	 *            文章ID
	 * @return 恢复成功失败都跳转index
	 */
	@RequestMapping("/renewArticle")
	public ModelAndView renewArticle(Integer id,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = articleService.renewArticle(id);
		User user=(User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复文章成功！");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId="+user.getId());
		} else {
			mv.addObject("operatorInfo", "恢复文章失败！");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}

	
	/**
	 * 测试用
	 * 
	 * @return
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "personal/article/test";
	}
}
