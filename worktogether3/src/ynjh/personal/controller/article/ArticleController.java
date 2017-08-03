package ynjh.personal.controller.article;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.entity.MyUser;
import ynjh.common.service.ArticleTypeService;
import ynjh.company.service.LikeNumService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.User;
import ynjh.personal.service.ArticleService;
import ynjh.personal.service.CommentArticleService;

/**
 * @author 胡林飞 文章控制器
 */
@Controller
@RequestMapping("/personal/article")
public class ArticleController {
	@Resource
	private ArticleService articleService;
	@Resource
	private ArticleTypeService articleTypeService;
	
	//牟勇：添加访问文章评论的service
	@Resource
	private CommentArticleService commentArticleService;
	//牟勇：访问是否赞过的service
	@Resource
	private LikeNumService likeNumService;
	/**
	 * 跳转页面
	 * 
	 * @return 跳转到personal_addarticle页面
	 */
	@RequestMapping(value = "/add_article", method = RequestMethod.GET)
	public String addArticle(HttpSession session) {
		return "personal/article/personal_addarticle";
	}

	/**
	 * 添加文章
	 * 
	 * @param article 文章对象
	 * @param session
	 * @return 成功跳转index 失败跳转addarticle
	 */
	@RequestMapping(value = "/add_article", method = RequestMethod.POST)
	public ModelAndView addArticle(Article article, HttpSession session) {
		User user = (User) session.getAttribute("user");
		article.setUsersId(user.getId());
		article.setArticleTime(new Timestamp(System.currentTimeMillis()));
		article.setArticleUsersType(2);
		article.setArticleStatus(1);
		int result = articleService.writeUserArticle(article);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "文章添加成功！");
			mv.setViewName("redirect:../common/initIndex?userId=" + user.getId());

		} else {
			mv.addObject("operatorInfo", "文章添加失败!");
			mv.setViewName("personal/article/personal_addarticle_index");
		}
		return mv;
	}

	/**
	 * 查看文章(所有)ajax
	 * 
	 * @param toPage 跳转页面
	 * @param userId 用户ID
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
		sb.append("---" + toPage + "---" + maxPage);
		return sb.toString();
	}
	/**
	 * 根据文章id查找指定文章，并跳转到显示页面<br />
	 * 牟勇：对点击数据进行了计数，<br />
	 * 对点赞也进行了判断,isLike如果为-1则表示用户没有登录，0表示用户没点赞，1表示用户点过赞
	 * @param id 文章ID         
	 * @return 返回文章详情查看页
	 */
	@RequestMapping(value = "/findArticleById/{articleId}", method = RequestMethod.GET)
	public ModelAndView findArticleById(@PathVariable Integer articleId,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//牟勇：增加点击计数
		articleService.updateReadNum(articleId);
		//牟勇：查询文章
		Article article = articleService.findArticleById(articleId);
		//查询用户是否点过赞
		MyUser user=(MyUser)session.getAttribute("user");
		//牟勇：用户要登录，才能知道他有没有点过赞
		if(user!=null){
			Integer isLike=likeNumService.islikeNum(articleId, user.getId());
			mv.addObject("isLike",isLike);
		}else{
			//牟勇：-1表示用户未登录
			mv.addObject("isLike",-1);
		}
		//牟勇：查询文章评论集合
		List<CommentArticle> commentArticles = commentArticleService.findCommentByArticleId(articleId);
		mv.addObject("article", article);
		mv.addObject("commentArticles", commentArticles);
		mv.setViewName("personal/article/personal_articledetail_index");
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
	 * @param id 文章ID
	 * @return 跳转修改页面
	 */
	@RequestMapping(value = "/gotoUpdateArticle", method = RequestMethod.GET)
	public ModelAndView gotoUpdateArticle(Integer id) {
		ModelAndView mv = new ModelAndView();
		Article article = articleService.findArticleById(id);
		mv.addObject("article", article);
		mv.setViewName("personal/article/personal_articleedit_index");
		
		return mv;
	}

	/**
	 * 修改文章内容
	 * 
	 * @param article 文章对象
	 * @return 修改文章内容成功，跳转index，失败也是index
	 */
	@RequestMapping("/updateArticle")
	public ModelAndView uptateArticleContent(Article article,HttpSession session) {
		int result = articleService.updateArticleContent(article);
		User oldUser=(User) session.getAttribute("user");
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "修改文章内容成功！");
			mv.setViewName("redirect:../common/initIndex?userId="+oldUser.getId());
		} else {
			mv.addObject("operatorInfo", "修改文章内容失败，请联系管理员");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}
	/**
	 * 更新点赞数，加1
	 * @param articleId 文章主键
	 * @param userId 用户主键
	 * @return 点赞成功，返回点赞数
	 */
	@RequestMapping("/updateLike/{articleId}/{userId}")
	@ResponseBody
	public String updateLike(@PathVariable Integer articleId,@PathVariable Integer userId) {
		articleService.updateLikeNum(articleId,userId);
		//查询点赞数
		Integer likeNum=articleService.findLikeNumByArticleId(articleId);
		return ""+likeNum;
	}
	/**
	 * 牟勇：取消点赞
	 * @param articleId 文章主键
	 * @param userId 用户主键
	 * @return 返回取消后的点赞数
	 */
	@RequestMapping("/cancelLike/{articleId}/{userId}")
	@ResponseBody
	public String cancelLike(@PathVariable Integer articleId,@PathVariable Integer userId){
		articleService.cancelLikeNum(articleId,userId);
		Integer likeNum=articleService.findLikeNumByArticleId(articleId);
		return ""+likeNum;
	}

	/**
	 * 恢复被删文章
	 * 
	 * @param id 文章ID
	 * @return 恢复成功失败都跳转index
	 */
	@RequestMapping("/renewArticle")
	public ModelAndView renewArticle(Integer id,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = articleService.renewArticle(id);
		User user=(User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复文章成功！");
			mv.setViewName("redirect:../common/initIndex?userId="+user.getId());
		} else {
			mv.addObject("operatorInfo", "恢复文章失败！");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}
}
