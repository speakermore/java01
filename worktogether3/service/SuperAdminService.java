package ynjh.admin.service;

	import java.util.List;

	import org.apache.ibatis.annotations.Param;

	import ynjh.admin.entity.Admin;

	public interface SuperAdminService {
		
		/*
		 * 作者：zfq
		 * 功能：添加管理员
		 * 需要参数：登录ID，登录密码，电话，邮箱，管理员姓名。
		 * */
		public Integer addAdmin(String adminLoginId,String adminPassword,String adminTel,String adminEmail,String adminName);
		
		/*
		 * 作者：zfq
		 * 功能：禁用管理员/解除管理员禁用
		 * 需要参数：管理员ID，管理员状态。
		 * */
		public Integer disableAdmin(Integer id,Integer adminStatus);
		
		/*
		 * 作者：zfq
		 * 功能：查询所有管理员
		 * 需要参数：无
		 * */
		public List<Admin> findAllAdmin(Integer page);
		
	}

