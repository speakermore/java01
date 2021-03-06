package ynjh.admin.controller.superadmin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.entity.Admin;
import ynjh.admin.service.AdminService;
import ynjh.admin.service.SuperAdminService;
import ynjh.common.util.MD5Util;

@Controller
@RequestMapping("/superAdmin")
public class SuperAdminController {
	@Resource
	private SuperAdminService superAdminService;
	@Resource
	private AdminService adminService;
	
	/*
	 * 显示所有管理员页面
	 * 作者：zfq
	 * 参数：无
	 * */
	@RequestMapping("/findAllAdmin/{page}")
	public ModelAndView findAllAdmin(@PathVariable Integer page){
		List<Admin> list=superAdminService.findAllAdmin(page);
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("page", page);
		mv.setViewName("admin/superadmin/findAll");//页面未写
		return mv;
	}
	
	/*
	 * 禁用管理员/解除管理员禁用
	 * 作者：zfq
	 * 参数：管理员Id（id）
	 * 	         管理员状态（adminStatus）
	 * */
	@RequestMapping("/disableAdmin")//禁用管理员/解除管理员禁用
	public ModelAndView disableAdmin(Integer id,Integer adminStatus){
		int result=superAdminService.disableAdmin(id, adminStatus);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("resultInfoSuccess","操作成功");
			mv.setViewName("admin/superadmin/findAll");//页面未写
		}else{
			mv.addObject("resultInfoFalse","操作失败");
			mv.setViewName("admin/superadmin/findAll");//页面未写
		}
		return mv;
	}
	
	/*
	 * 添加管理员
	 * 作者：zfq
	 * 参数：登录Id（adminLoginId）
	 * 	         登录密码（adminStatus）
	 * 	         电话（adminTel）
	 * 	         邮件（adminEmail）
	 * 	         名字（adminName）
	 * */
	@RequestMapping("/addAdmin")//添加管理员
	public ModelAndView addAdmin(String adminLoginId,String adminPassword,String adminTel
			,String adminEmail,String adminName){
		String pass=null;
		try {
			pass=MD5Util.md5Encode(adminPassword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int result=superAdminService.addAdmin(adminLoginId, pass, adminTel, adminEmail, adminName);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("resultInfoSuccess","添加管理员成功!");
			mv.setViewName("admin/superadmin/findAll");
		}else{
			mv.addObject("resultInfoFalse","操作失败");
			mv.setViewName("admin/superadmin/findAll");//页面未写
		}
		return mv;
	}

	
	/**
	 * 
	   * @Name: superAdminAddUser
	   * @Description: @return 页面跳转
	   * @Author: 曾瑞（作者）
	   * @Version: V1.00 （版本号）
	   * @Create Date: 2017年4月25日下午5:02:51
	   * @Parameters: SuperAdminController
	   * @Return: String
	 */
	@RequestMapping(value="/superAdminAddUser",method=RequestMethod.GET)
	public String superAdminAddUser(){
		return "admin/superadmin/superAdminAddUser";
	}
	
	@RequestMapping("/testAdminLoginId")
	@ResponseBody
	public String testAdminLoginId(String adminLoginId){
		Integer result=adminService.findAdminByAdminLoginId(adminLoginId);
		if(result==1){
			return "true";
		}else{
			return "false";
		}
	}
}
