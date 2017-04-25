package ynjh.admin.dao.adminlog;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.AdminLog;
/**
 * 管理员日志的数据访问层
 * @author 张宇
 *
 */
public interface AdminLogMapper {
	public Integer addAdminLog(AdminLog adl);//增添管理员访问日志
	/**
	 * 访问管理员日志,无参查询全部
	 * @author 张宇
	 * @return
	 */
	public List<AdminLog> findAdminLogAll(Integer page);
	/**
	 * 访问管理员日志,时间段查询
	 * @author 张宇
	 * @return
	 */
	public List<AdminLog> findAdminLogByTime(@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("page")Integer page);
	/**
	 * 访问管理员日志,操作人ID&时间段查询
	 * @author 张宇
	 * @param adminLoginId 操作人id
	 * @param beginTime 起始时间
	 * @param endTime 结束时间
	 * @param page 分页条数
	 * @return
	 */
	public List<AdminLog> findAdminLogByTimeAndId(@Param("adminLoginId")Integer userLoginId,@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("page")Integer page);
	/**
	 * 访问管理员日志,操作人ID&操作类型查询
	 * @author 张宇
	 * @param adminLoginId 操作管理员id
	 * @param adminDo 操作类型
	 * @param page 分页条数
	 * @return
	 */
	public List<AdminLog> findAdminLogByIdAndDo(@Param("adminLoginId")Integer userLoginId,@Param("adminDo")Integer adminDo,@Param("page")Integer page);
	/**
	 * 访问管理员日志,操作类型&时间段查询
	 * @author 张宇
	 * @param beginTime 起始时间
	 * @param endTime 结束时间
	 * @param adminDo 操作类型
	 * @param page 分页条数
	 * @return
	 */
	public List<AdminLog> findAdminLogByTimeAndDo(@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("adminDo")Integer adminDo,@Param("page")Integer page);
	/**
	 * 访问管理员日志,全部类型查询
	 * @author 张宇
	 * @param beginTime
	 *            起始时间
	 * @param endTime
	 *            结束时间
	 * @param adminDo
	 *            操作类型
	 * @param userLoginId
	 *            操作管理员id
	 * @param page
	 *            分页条数
	 * @return
	 */
	public List<AdminLog> findAdminLogByTimeAndDoAndId(@Param("adminDo")Integer adminDo,@Param("adminLoginId")Integer userLoginId,@Param("beginTime")Date beginTime,@Param("endTime")Date endTime,@Param("page")Integer page);

	
	
	
}

	
	

