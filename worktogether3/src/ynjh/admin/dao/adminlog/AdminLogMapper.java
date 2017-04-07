package ynjh.admin.dao.adminlog;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.AdminLog;

public interface AdminLogMapper {
	public Integer addAdminLog(AdminLog adl);//增添管理员访问日志
	public Integer findAdminLogAll();
	public Integer findAdminLogByTime(@Param("beginTime")Date beginTime,@Param("endTime")Date endTime);
	public Integer findAdminLogByTimeAndId(@Param("userLoginId")Integer userLoginId,@Param("beginTime")Date beginTime,@Param("endTime")Date endTime);
	public Integer findAdminLogByIdAndDo(@Param("userLoginId")Integer userLoginId,@Param("adminDo")Integer adminDo);
	public Integer findAdminLogByTimeAndDo(@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("adminDo")Integer adminDo);
	public Integer findAdminLogByTimeAndDoAndId(@Param("adminDo")Integer adminDo,@Param("userLoginId")Integer userLoginId,@Param("beginTime")Date beginTime,@Param("endTime")Date endTime);

	
	
	
}

	
	

