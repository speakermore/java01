package ynjh.admin.controller.usermag;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.service.AdminService;
import ynjh.company.entity.Company;
import ynjh.personal.entity.User;

/**
 * 用户管理控制器
 * @author 朱吉
 *
 */
@Controller
@RequestMapping("/admin")
public class userManage {
	@Resource
	AdminService adminService;
	@RequestMapping(value="/userMag",method=RequestMethod.GET)
	public ModelAndView findAllUser(){
		List<User> users=adminService.findDisabledUser();
		List<Company> companys=adminService.findDisabledCompany();
		ModelAndView mv=new ModelAndView();
		mv.addObject("companys",companys);
		mv.addObject("users",users);
		mv.setViewName("admin/managment/userManage");
		return mv;
	}
}
