package ynjh.admin.dao.adminlog;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.AdminLog;

public interface AdminLogMapper {
	public Integer addAdminLog(AdminLog adl);//增添管理员访问日志
	public List<AdminLog> findAdminLogAll(Integer page);
	public List<AdminLog> findAdminLogByTime(@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("page")Integer page);
	public List<AdminLog> findAdminLogByTimeAndId(@Param("adminLoginId")Integer userLoginId,@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("page")Integer page);
	public List<AdminLog> findAdminLogByIdAndDo(@Param("adminLoginId")Integer userLoginId,@Param("adminDo")Integer adminDo,@Param("page")Integer page);
	public List<AdminLog> findAdminLogByTimeAndDo(@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("adminDo")Integer adminDo,@Param("page")Integer page);
	public List<AdminLog> findAdminLogByTimeAndDoAndId(@Param("adminDo")Integer adminDo,@Param("adminLoginId")Integer userLoginId,@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("page")Integer page);

	
	
	
}

	
	

