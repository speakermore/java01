package ynjh.common.controller.article;

import java.sql.Timestamp;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.entity.ArticleType;
import ynjh.common.entity.MyUser;
import ynjh.common.service.ArticleTypeService;
import ynjh.company.service.LikeNumService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.service.ArticleService;
import ynjh.personal.service.CommentArticleService;

/**
 * @author 胡林飞 文章控制器
 */
@Controller
@RequestMapping("/common/article")
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
	 * @return 成功跳转/common/initIndex 失败跳转common/article/common_add_article_index
	 */
	@RequestMapping(value = "/add_article", method = RequestMethod.POST)
	public ModelAndView addArticle(Article article, HttpSession session) {
		MyUser user = (MyUser) session.getAttribute("user");
		article.setUsersId(user.getId());
		article.setArticleTime(new Timestamp(System.currentTimeMillis()));
		article.setArticleStatus(1);
		//判断用户的类型1是企业，2是个人
		article.setArticleUsersType(user.getId()>=1234567890?2:1);
		int result = articleService.addArticle(article);
		ModelAndView mv = null;
		if(user.getId()>=1234567890){
			String toPage="personal/common/initIndex?userId="+user.getId();
			mv=setInfo("文章添加成功！", "文章添加失败!请稍后再试或联系管理员",toPage , result);
		}else{
			String toPage="company/company/findById/"+user.getId();
			mv=setInfo("文章添加成功！", "文章添加失败!请稍后再试或联系管理员",toPage , result);
		}
		return mv;
	}
	/**
	 * 根据文章id查找指定文章，并跳转到显示页面<br />
	 * 牟勇：对点击数据进行了计数，<br />
	 * 对点赞也进行了判断,isLike如果为-1则表示用户没有登录，0表示用户没点赞，1表示用户点过赞
	 * @param id 文章ID         
	 * @return 跳转文章内容显示页面common/article/common_detail_article_index
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
		mv.setViewName("common/article/common_detail_article_index");
		return mv;
	}

	/**
	 * 删除文章
	 * 
	 * @param id 文章ID
	 * @return 删除成功，跳转common/article/common_index_article，删除失败，也是common/article/common_index_article
	 */
	@RequestMapping("/deleteAricle/{articleId}")
	public ModelAndView deleteUserCommentArticle(@PathVariable Integer articleId,HttpSession session) {
		ModelAndView mv=new ModelAndView("redirect:/ajax?page=common/article/common_index_article");
		articleService.deleteUserArticle(articleId);
		return mv;
	}

	/**
	 * 跳转修改页
	 * 牟勇：添加根据用户类型查询不同的文章类型的代码
	 * @param id 文章ID
	 * @return 跳转修改页面
	 */
	@RequestMapping(value = "/gotoUpdateArticle", method = RequestMethod.GET)
	public ModelAndView gotoUpdateArticle(Integer id,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MyUser user=(MyUser)session.getAttribute("user");
		List<ArticleType> articleTypes=findArticleType(user);
		//根据用户类型选择不同的文章类型
		Article article = articleService.findArticleById(id);
		mv.addObject("article", article);
		mv.addObject("articleTypes",articleTypes);
		mv.setViewName("common/article/common_edit_article_index");
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
		MyUser user=(MyUser) session.getAttribute("user");
		ModelAndView mv = null;
		if(user.getId()>=1234567890){
			String toPage="personal/common/initIndex?userId="+user.getId();
			mv=setInfo("文章修改成功！","文章修改失败，请稍后再试或联系管理员",toPage,result);
		}else{
			String toPage="company/company/findById/"+user.getId();
			mv=setInfo("文章修改成功！","文章修改失败，请稍后再试或联系管理员",toPage,result);
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
	@RequestMapping("/renewArticle/{articleId}")
	public ModelAndView renewArticle(@PathVariable Integer articleId,HttpSession session) {
		ModelAndView mv=new ModelAndView("redirect:/ajax?page=common/article/common_index_article");
		articleService.renewArticle(articleId);
		return mv;
	}
	/**
	 * 牟勇：根据用户的id判断用户是个人还是企业，然后返回不同的文章分类
	 * @param user 已登录的用户实体类型，使用User和Company的共同父类
	 * @return 符合条件的文章类型实体集合
	 */
	private List<ArticleType> findArticleType(MyUser user){
		List<ArticleType> articleTypes=null;
		if(user.getId()>=1234567890){
			//个人用户
			articleTypes=articleTypeService.findArticleTypeForPersonal();
		}else{
			//企业用户
			articleTypes=articleTypeService.findArticleTypeForCompany();
		}
		return articleTypes;
	}
	/**
	 * 牟勇：为跳转信息弹出框而统一设置的方法
	 * @param successInfo 要在信息正文显示的成功内容
	 * @param failInfo 要在信息正文显示的失败内容
	 * @param toPage 在点击信息框的确定按钮之后要跳转的页面
	 * @param result 判断操作是否成功，大于0表示成功，否则表示失败
	 * @return 方法跳转的ModelAndView，统一指定到common/info
	 */
	private ModelAndView setInfo(String successInfo,String failInfo,String toPage,Integer result){
		ModelAndView mv=new ModelAndView("common/info");
		if (result > 0) {
			mv.addObject("operatorInfo", successInfo);
		} else {
			mv.addObject("operatorInfo", failInfo);
		}
		mv.addObject("toPage", toPage);
		return mv;
	}
}
