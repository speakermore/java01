package ynjh.admin.controller.index;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.service.AdminService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.Resume;
/**
 * 管理员首页导航
 * @author 朱吉
 *
 */
@Controller

public class NavigationController {
	
	@Resource
	private AdminService adminService;
	/**
	 * 首页显示5条待审核简历信息
	 * @author 朱吉
	 * @return
	 */
	@RequestMapping("/indexResume")
	public ModelAndView indexResume(){
		List<Resume> resumeList5=adminService.find5Resumes();
		ModelAndView mv=new ModelAndView("admin/index");
		mv.addObject("resumeList5",resumeList5);
		return mv;
	}
	/**
	 * 首页显示5条待审核文章信息
	 */
	@RequestMapping("/indexArticle")
	public ModelAndView indexArticle(){
		List<Article> articleList5=adminService.find5Articles();
		ModelAndView mv=new ModelAndView("admin/index");
		mv.addObject("articleList5", articleList5);
		return mv;
	}
	/**
	 * 首页显示5条待审核个人与企业评论信息
	 */
	@RequestMapping("/indexDiscuss")
	public ModelAndView indexDiscuss(){
		List<Discuss> discussList5=adminService.find5Discuss();
		ModelAndView mv= new ModelAndView("admin/index");
		mv.addObject("discussList5",discussList5);
		return mv;
	}
	/**
	 * 跳转首页
	 */
	@RequestMapping(value="/admin/index",method=RequestMethod.GET)
	public ModelAndView index(){
		ModelAndView mv= new ModelAndView("admin/index");
		return mv;
	}
}
