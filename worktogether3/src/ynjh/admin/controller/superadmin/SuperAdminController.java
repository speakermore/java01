package ynjh.admin.controller.superadmin;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.entity.Admin;
import ynjh.admin.service.SuperAdminService;

@Controller
@RequestMapping("/admin")
public class SuperAdminController {
	@Resource
	private SuperAdminService superAdminService;
	
	/*
	 * 显示所有管理员页面
	 * 作者：zfq
	 * 参数：无
	 * */
	@RequestMapping("/findAllAdmin/{page}")
	public ModelAndView findAllAdmin(@PathVariable Integer page){
		List<Admin> admin=superAdminService.findAllAdmin(page);
		ModelAndView mv=new ModelAndView();
		mv.addObject("admin",admin);
		mv.addObject("page", page);
		mv.setViewName("admin/");//页面未写
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
			mv.addObject("","操作成功");
			mv.setViewName("");//页面未写
		}else{
			mv.addObject("","操作失败");
			mv.setViewName("");//页面未写
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
		int result=superAdminService.addAdmin(adminLoginId, adminPassword,adminTel,adminEmail,adminName);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("","操作成功");
			mv.setViewName("");//页面未写
		}else{
			mv.addObject("","操作失败");
			mv.setViewName("");//页面未写
		}
		return mv;
	}

}
