package ynjh.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.admin.dao.superadmin.SuperAdminMapper;
import ynjh.admin.entity.Admin;
import ynjh.admin.service.SuperAdminService;
@Service
public  class SuperAdminImpl implements SuperAdminService {
	@Resource
	private SuperAdminMapper SuperAdminMapper;

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
	public Integer addAdmin(String adminLoginId, String adminPassword,
			String adminTel, String adminEmail, String adminName) {
		// TODO Auto-generated method stub
		return SuperAdminMapper.addAdmin(adminLoginId, adminPassword, adminTel, adminEmail, adminName);
	}

	/*
	 * 作者：zfq
	 * 功能：禁用管理员/解除管理员禁用
	 * id:管理员Id
	 * adminStatus：管理员状态
	 * */
	public Integer disableAdmin(Integer id, Integer adminStatus) {
		// TODO Auto-generated method stub
		return SuperAdminMapper.disableAdmin(id, adminStatus);
	}

	/*
	 * 作者：zfq
	 * 功能：查询所有管理员
	 * 需要参数：无
	 * */
	public List<Admin> findAllAdmin(Integer page) {
		// TODO Auto-generated method stub
		return SuperAdminMapper.findAllAdmin((page-1)*10);
	}

}
