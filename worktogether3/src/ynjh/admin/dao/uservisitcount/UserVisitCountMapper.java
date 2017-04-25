package ynjh.admin.dao.uservisitcount;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.UserVisitCount;
/**
 * 个人用户访问量统计数据访问层
 * @author 朱吉
 *
 */
public interface UserVisitCountMapper {
	/**
	 * 增加个人用户访问统计数
	 * @author 朱吉
	 * @param userVisitCount 用户访问量统计
	 * @return
	 */
		public Integer addUserVisitCount(UserVisitCount userVisitCount);
		//查找最大信息条数
		public Integer findMaxPage(Integer page);
		/**
		 * 增加用户访问记录
		 * @author 朱吉
		 * @param userVisitCount 用户访问记录
		 * @return
		 */
		public Integer updateUserVisitCount(UserVisitCount userVisitCount);
		/**
		 * 查找所有个人用户访问统计
		 * @param page 偏移量
		 * @return
		 */
		public List<UserVisitCount> findAll(@Param("page")Integer page);
		/**
		 * 按条件查找个人用户访问量统计记录
		 * @author 朱吉
		 * @param page 偏移量
		 * @param userYear 年
		 * @param userMonth 月
		 * @param userDay 日
		 * @param userId 个人用户id
		 * @return
		 */
		public List<UserVisitCount> findCount(@Param("page")Integer page,@Param("userYear")Integer userYear,@Param("userMonth")Integer userMonth,@Param("userDay")Integer userDay,@Param("userId")Integer userId);
}
