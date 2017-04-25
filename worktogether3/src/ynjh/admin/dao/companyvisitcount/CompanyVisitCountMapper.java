package ynjh.admin.dao.companyvisitcount;

import java.time.Year;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.CompanyVisitCount;
/**
 * 企业用户访问量数据访问层
 * 
 *
 */
public interface CompanyVisitCountMapper {
	/**
	 * 企业访问量统计--添加记录
	 * @author 
	 * @param id id
	 * @param companyYear 年
	 * @param companyMoth 月
	 * @param companyDay 日
	 * @param companyResumeCount 发表招聘信息数统计
	 * @param companyInfoCount 发表文章数统计
	 * @param companyId 企业id
	 * @return
	 */
		public Integer addcompanyVisitCount(@Param("id")Integer id,@Param("companyYear")Integer companyYear,@Param("companyMoth")Integer companyMoth
				,@Param("companyDay")Integer companyDay,@Param("companyResumeCount")Integer companyResumeCount,@Param("companyId")Integer companyId
				,@Param("companyInfoCount")Integer companyInfoCount);
		/**
		 * 企业访问量统计--修改访问数
		 * @author 朱吉
		 * @param companyVisitCount 企业访问量统计
		 * @return
		 */
		public Integer updatecompanyVisitCount(CompanyVisitCount companyVisitCount);
		/**
		 *企业访问量统计--显示所有访问数
		 *@author 增瑞 
		 * @param page 偏移量
		 * @return
		 */
		public List<CompanyVisitCount> findAll(@Param("page")Integer page);
		/**
		 * 企业访问量统计--通过企业id查询企业访问量
		 * @author 曾瑞
		 * @param companyId 企业id
		 * @param page
		 * @return
		 */
		public List<CompanyVisitCount> findCompanyId(@Param("companyId")Integer companyId,@Param("page")Integer page);
		/**
		 * 企业访问量统计--查找发表信息的数量和发表简历的数量
		 * @author 曾瑞
		 * @param companyYear 年
		 * @param companyMonth 月
		 * @param companyDay 日
		 * @param companyId 企业id
		 * @param page 偏移量
		 * @return
		 */
		public List<CompanyVisitCount> findcompanyInfoCountAndcompanyResumeCount(
				@Param("companyYear")Integer companyYear,@Param("companyMonth")Integer companyMonth
				,@Param("companyDay")Integer companyDay,@Param("companyId")Integer companyId
				,@Param("page")Integer page);

		/**
		 * 企业访问量统计--获得信息量的最大值
		 * @author 曾瑞
		 * @return
		 */
		public Integer getMaxRecord();
}
