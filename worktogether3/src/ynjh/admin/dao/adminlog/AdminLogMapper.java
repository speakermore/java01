package ynjh.admin.dao.adminlog;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.AdminLog;

public interface AdminLogMapper {
	public Integer addAdminLog(AdminLog adl);//增添管理员访问日志
	public Integer findAdminLog();
	public Integer findAdminLog(@Param("beginTime")Date beginTime,@Param("endTime")Date endTime);
	public Integer findAdminLog(@Param("userLoginId")Integer userLoginId,@Param("beginTime")Date beginTime,@Param("endTime")Date endTime);
	public Integer findAdminLog(@Param("userLoginId")Integer userLoginId,@Param("adminDo")Integer adminDo);
	public Integer findAdminLog(@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("adminDo")Integer adminDo);
	public Integer findAdminLog(@Param("adminDo")Integer adminDo,@Param("userLoginId")Integer userLoginId,@Param("beginTime")Date beginTime,@Param("endTime")Date endTime);

	
	
	
}

	
	

