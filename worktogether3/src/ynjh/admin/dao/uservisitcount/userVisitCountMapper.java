package ynjh.admin.dao.uservisitcount;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.UserVisitCount;

public interface userVisitCountMapper {
	public Integer addUserVisitCount(UserVisitCount userVisitCount);
	public Integer updateUserVisitCount(UserVisitCount userVisitCount);
	public List<UserVisitCount> findAll(@Param("page")Integer page,@Param("pageSize")Integer pageSize);
	public List<UserVisitCount> findCount(@Param("year")Integer year,@Param("month")Integer month,@Param("day")Integer day,@Param("userId")String userId);
}
