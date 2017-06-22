package ynjh.admin.controller.news;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.entity.News;
import ynjh.admin.service.news.NewsService;

@Controller
@RequestMapping("/admin/news")
public class NewsController {
	@Resource
	NewsService newsService;
	
	/**
	 * 添加新闻资讯
	 * @param news 新闻资讯实体类
	 * @return 成功跳转新闻资讯列表，失败跳转新闻添加页面
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView addNews(News news){
		ModelAndView mv=new ModelAndView("redirect:/findAll");
		int result=newsService.addNews(news);
		if(result>0){
			
		}else{
			//向页面传递新闻资讯对象，以便表单回显数据
			mv.addObject("news",news);
			//添加失败，返回到添加页面
			mv.setViewName("admin/news/add");
		}
		return mv;
	}
	
	/**
	 * 更新新闻资讯的标题，内容，状态（1.正常，2.禁用，10.重置）
	 * @param news 需要修改的数据
	 * @return 成功跳转新闻资讯列表，失败跳转修改页面
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ModelAndView updateNews(News news){
		ModelAndView mv=new ModelAndView("redirect:/findAll");
		int result=newsService.updateNews(news);
		
		if(result>0){
			
		}else{
			mv.addObject("news",news);
			mv.setViewName("admin/news/update");
		}
		return mv;
	}
	
	
	/**********************页面中转****************************/
	/**
	 * 添加新闻资讯页面的跳转
	 * @return 添加新闻资讯页面路径
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "admin/news/add_news";
	}
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(){
		return "admin/news/update_news";
	}
	
	
}
