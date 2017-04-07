package ynjh.admin.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
import ynjh.admin.service.AdminService;
import ynjh.personal.entity.Article;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	
	//登录
		@RequestMapping(value="/findLogin",method=RequestMethod.POST)
		public ModelAndView findLogin(String adminLoginId,String adminPassword,HttpSession session){
			Admin admin = adminService.findLogin(adminLoginId, adminPassword);
			ModelAndView mv=new ModelAndView("login");
			if(admin==null){
				mv.addObject("loginInfo", "登录失败");
			}else{
				mv.addObject("loginInfo", "登录成功");
				mv.addObject("admin", admin);
				session.setAttribute("admin", admin);
			}
			return mv;
		}
		
		@RequestMapping("/exit") // 退出返回登录页面
		public ModelAndView exit(HttpSession session) {
			session.invalidate();// 结束session
			ModelAndView mv = new ModelAndView("login");
			return mv;
		}

		// 访问管理员操作日志
		@RequestMapping("/findAdminLogAll") // 访问管理员日志,无参查询全部
		public ModelAndView findAdminLogAll() {
			List<AdminLog> adminLogs = adminService.findAdminLogAll();
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findAdminLogByTime") // 访问管理员日志,时间段查询
		public ModelAndView findAdminLogByTime(String beginTime, String endTime) {
			List<AdminLog> adminLogs = adminService.findAdminLogByTime(beginTime, endTime);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findAdminLogByTimeAndId") // 访问管理员日志,操作人ID&时间段查询
		public ModelAndView findAdminLogByTimeAndId(Integer userLoginId, String beginTime, String endTime) {
			List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndId(userLoginId, beginTime, endTime);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findAdminLogByIdAndDo") // 访问管理员日志,操作人ID&操作类型查询
		public ModelAndView findAdminLogByIdAndDo(Integer userLoginId, Integer adminDo) {
			List<AdminLog> adminLogs = adminService.findAdminLogByIdAndDo(userLoginId, adminDo);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findAdminLogByTimeAndDo") // 访问管理员日志,操作类型&时间段查询
		public ModelAndView findAdminLogByTimeAndDo(String beginTime, String endTime, Integer adminDo) {
			List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndDo(beginTime, endTime, adminDo);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}
		
		@RequestMapping("/findAdminLogByTimeAndDoAndId") // 访问管理员日志,全部类型查询
		public ModelAndView findAdminLogByTimeAndDoAndId(Integer adminDo, Integer userLoginId, String beginTime, String endTime) {
			List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndDoAndId(adminDo, userLoginId, beginTime, endTime);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findBestArticle") // 热门文章查询
		public ModelAndView findBestArticle() {
			List<Article> findBestArticles = adminService.findBestArticle();
			ModelAndView mv = new ModelAndView("");
			mv.addObject("findBestArticles", findBestArticles);
			return mv;
		}
}
