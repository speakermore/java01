package ynjh.admin.controller.usermag;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.entity.SysMessageWithAuthor;
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
public class userManageController {
	@Resource
	AdminService adminService;
	
	/**
	 * 进入用户管理页面查找，所有用户数据
	 * @author 朱吉
	 * @return
	 */
	@RequestMapping("/userMag")
	public ModelAndView findAllUser(){
		List<User> users=adminService.findDisabledUser();
		//List<Company> companys=adminService.findDisabledCompany();只查找个人用户发表的文章，暂时注释了企业文章
		ModelAndView mv=new ModelAndView();
		//mv.addObject("companys",companys);
		mv.addObject("users",users);
		mv.setViewName("admin/managment/userManage");
		return mv;
	}
	
	/**
	 *通过企业账号查找企业用户
	 *@author 朱吉 
	 * @param companyLoginId
	 * @return
	 */
	@RequestMapping(value="/findCompanyByLoginId",method=RequestMethod.POST)
	public ModelAndView findCompanyByLoginId(String companyLoginId){
		Company company=adminService.findCompanyByLoginId(companyLoginId);
		ModelAndView mv=new ModelAndView("admin/managment/userManage");
		if(company!=null){
			List<Company> companys=new ArrayList<Company>();
			companys.add(company);
			mv.addObject("companys", companys);
		}else{
			mv.addObject("resultInfo", "未能找到该企业，请确认输入账号！");
			mv.addObject("companys", company);
		}
		return mv;
	}
	
	/**
	 * 通过个人用户LoginId查找用户
	 * @author 朱吉
	 * @param userLoginId 用户登录名
	 */
	@RequestMapping(value="/findUserByLoginId",method=RequestMethod.POST)
	public ModelAndView findUserByLoginId(String userLoginId){
		User user=adminService.findUserByLoginId(userLoginId);
		ModelAndView mv=new ModelAndView("admin/managment/userManage");
		if(user!=null){
			List<User> users=new ArrayList<User>();
			users.add(user);
			mv.addObject("users", users);
		}else{
			mv.addObject("resultInfo", "未能找到该用户，请确认输入账号!!!");
		}
		return mv;
	}

	/**
	 * 提交禁用的用户
	 * @author 朱吉
	 * @param 
	 */
	@RequestMapping(value="/personalMag",method=RequestMethod.POST)
	@ResponseBody
	public String personalMag(Integer[] id,Integer userStatus){
		Integer result=adminService.personalMag(id,userStatus);
		if(result!=null){
			if(result>0){
				return "true";
			}else if(result==0){
				return "false";
			}else{
				return "false";
			}
		}else{
			return "false";
		}
	}
	
	/**
	 * 查找已经发送的系统消息
	 * @author 朱吉
	 * @return
	 */
	@RequestMapping("/findSysMessages")
	public ModelAndView findSysMessages(){
		List<SysMessageWithAuthor> list=adminService.findSysMsgWithAuth();
		ModelAndView mv=new ModelAndView();
		mv.addObject("sysMessages", list);
		mv.setViewName("admin/adminAddMessage");
		return mv;
	}
}
