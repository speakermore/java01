package ynjh.admin.dao.companyvisitcount;

import java.time.Year;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.CompanyVisitCount;

public interface CompanyVisitCountMapper {
	//自增记录
		public Integer addcompanyVisitCount(@Param("id")Integer id,@Param("companyYear")Integer companyYear,@Param("companyMoth")Integer companyMoth
				,@Param("companyDay")Integer companyDay,@Param("companyResumeCount")Integer companyResumeCount,@Param("companyId")Integer companyId
				,@Param("companyInfoCount")Integer companyInfoCount);
		//修改记录
		public Integer updatecompanyVisitCount(CompanyVisitCount companyVisitCount);
		//分页
		public List<CompanyVisitCount> findAll(@Param("page")Integer page);
		//查找企业id
		public List<CompanyVisitCount> findCompanyId(@Param("companyId")Integer companyId,@Param("page")Integer page);
		//查找发表信息的数量和发表简历的数量
		public List<CompanyVisitCount> findcompanyInfoCountAndcompanyResumeCount(
				@Param("companyYear")Integer companyYear,@Param("companyMonth")Integer companyMonth
				,@Param("companyDay")Integer companyDay,@Param("companyId")Integer companyId
				,@Param("page")Integer page);
		//获得信息量的最大值。
		public Integer getMaxRecord();
}
