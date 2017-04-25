package ynjh.admin.dao.superadmin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.Admin;


public interface SuperAdminMapper {
	/*
	 * 作者：zfq
	 * 功能：添加管理员
	 * 需要参数：登录ID，登录密码，电话，邮箱，管理员姓名。
	 * adminLoginId：登录ID
	 * adminPassword：登录密码
	 * adminTel：电话
	 * adminEmail：邮箱
	 * adminName：管理员姓名
	 * */
	public Integer addAdmin(@Param("adminLoginId")String adminLoginId,@Param("adminPassword")String adminPassword,@Param("adminTel")String adminTel
			,@Param("adminEmail")String adminEmail,@Param("adminName")String adminName);
	
	/*
	 * 作者：zfq
	 * 功能：禁用管理员/解除管理员禁用
	 * 需要参数：管理员ID，管理员状态。
	 * id:管理员Id
	 * adminStatus：管理员状态
	 * */
	public Integer disableAdmin(@Param("id")Integer id,@Param("adminStatus")Integer adminStatus);
	
	/*
	 * 作者：zfq
	 * 功能：查询所有管理员
	 * 需要参数：无
	 * */
	public List<Admin> findAllAdmin(@Param("page") Integer page);
	
	
}
