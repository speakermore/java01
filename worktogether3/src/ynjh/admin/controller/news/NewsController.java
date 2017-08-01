package ynjh.admin.controller.news;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.entity.Admin;
import ynjh.admin.entity.News;
import ynjh.admin.service.news.NewsService;
import ynjh.common.entity.ArticleType;
import ynjh.common.service.ArticleTypeService;

/**
 * 新闻资讯处理的控制器
 * @author 牟勇
 *
 */
@Controller
@RequestMapping("/admin/news")
public class NewsController {
	@Resource
	NewsService newsService;
	@Resource
	ArticleTypeService articleTypeService;
	/**
	 * 添加新闻资讯
	 * @param news 新闻资讯实体类
	 * @return 成功跳转新闻资讯列表，失败跳转新闻添加页面
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView addNews(News news,HttpSession session){
		ModelAndView mv=new ModelAndView("redirect:/admin/news/find_all");
		Admin admin=(Admin)session.getAttribute("admin");
		//传递管理员的id给news
		news.setAdminId(admin.getId());
		int result=newsService.addNews(news);
		if(result>0){
			//这里啥都没做
		}else{
			//向页面传递新闻资讯对象，以便表单回显数据
			mv.addObject("news",news);
			//添加失败，返回到添加页面
			mv.setViewName("admin/news/add");
		}
		return mv;
	}
	
	/**
	 * 更新新闻资讯的标题，内容
	 * @param news 需要修改的数据
	 * @return 成功跳转新闻资讯列表，失败跳转修改页面
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ModelAndView updateNews(News news){
		ModelAndView mv=new ModelAndView("redirect:/admin/news/find_all");
		int result=newsService.updateNews(news);
		
		if(result>0){
			//此处为空
		}else{
			mv.addObject("news",news);
			mv.setViewName("admin/news/update");
		}
		return mv;
	}
    /**
     * 查询所有新闻资讯	
     * @return 跳转到资讯列表页面
     */
	@RequestMapping("/find_all")
	public ModelAndView findAll(){
		ModelAndView mv=new ModelAndView("admin/news/news_list");
		List<News> newses=newsService.findAll();
		mv.addObject("newses",newses);
		return mv;
	}
	/**
	 * 置顶
	 * @param id 指定新闻资讯的主键
	 * @return 新闻资讯列表
	 */
	@RequestMapping(value="/stick/{id}")
	public String stick(@PathVariable Integer id){
		newsService.stick(id,10);
		return "redirect:/admin/news/find_all";
	}
	/**
	 * 取消置顶
	 * @param id 指定新闻资讯的主键
	 * @return 新闻资讯列表
	 */
	@RequestMapping(value="/unstick/{id}")
	public String unstick(@PathVariable Integer id){
		newsService.stick(id,9);
		return "redirect:/admin/news/find_all";
	}
	/**
	 * 禁用
	 * @param id 指定新闻资讯的主键
	 * @return 新闻资讯列表
	 */
	@RequestMapping(value="/stop/{id}")
	public String stop(@PathVariable Integer id){
		newsService.stick(id,2);
		return "redirect:/admin/news/find_all";
	}
	/**
	 * 启用
	 * @param id 指定新闻资讯的主键
	 * @return 新闻资讯列表
	 */
	@RequestMapping(value="/normal/{id}")
	public String normal(@PathVariable Integer id){
		newsService.stick(id,9);
		return "redirect:/admin/news/find_all";
	}
	
	/**
	 * 最新资讯
	 * @return 前10篇最新资讯
	 */
	@RequestMapping(value="/find_news_10")
	public ModelAndView findNewsTop10(){
		ModelAndView mv=new ModelAndView("/index");
		List<News> newses10=newsService.findTop10ByCreateDate();
		mv.addObject("newses10",newses10);
		return mv;
	}
	
	/**
	 * 最新资讯内容查看
	 * @param id 新闻资讯主键
	 * @param model 传递参数给最新资讯页面显示
	 * @return 新闻资讯内容显示页面
	 */
	@RequestMapping(value="/news/{id}")
	public String news(@PathVariable Integer id,Model model){
		News news=newsService.findById(id);
		model.addAttribute("news", news);
		
		return "admin/news/news";
	}
	/**********************页面中转****************************/
	/**
	 * 添加新闻资讯页面的跳转
	 * @return 添加新闻资讯页面路径
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(HttpSession session){
		addSessionVar(session);
		return "admin/news/add_news";
	}
	/**
	 * 根据id查询对应的资讯，交给修改资讯页面处理
	 * 
	 * @return 跳转修改资讯的页面
	 */
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String update(@PathVariable Integer id,Model model,HttpSession session){
		addSessionVar(session);
		News news=newsService.findById(id);
		model.addAttribute("news", news);
		return "admin/news/update_news";
	}
	/**
	 * 检查session中缺少的对象，如果没有就添加。
	 * 目前添加了资讯类型
	 * @param session web中的session对象
	 */
	private void addSessionVar(HttpSession session){
		//添加资讯类型对象
		if(session.getAttribute("newsTypesForAdmin")==null){
			List<ArticleType> newsTypesForAdmin=articleTypeService.findNewsTypeForAdmin();
			session.setAttribute("newsTypesForAdmin", newsTypesForAdmin);
		}
	}
}
