package ynjh.admin.dao.uservisitcount;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.UserVisitCount;

public interface UserVisitCountMapper {
	//用户访问日志
		public Integer addUserVisitCount(UserVisitCount userVisitCount);
		//查找最大信息条数
		public Integer findMaxPage(Integer page);
		//
		public Integer updateUserVisitCount(UserVisitCount userVisitCount);
		//查找所有访问记录条数
		public List<UserVisitCount> findAll(@Param("page")Integer page);
		//按年月日和用户id查找
		public List<UserVisitCount> findCount(@Param("page")Integer page,@Param("userYear")Integer userYear,@Param("userMonth")Integer userMonth,@Param("userDay")Integer userDay,@Param("userId")Integer userId);
}
