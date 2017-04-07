package ynjh.admin.dao.companyvisitcount;

import java.time.Year;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.CompanyVisitCount;

public interface CompanyVisitCountMapper {
	//自增记录
	public Integer addcompanyVisitCount(Integer companyVisitCount);
	//修改记录
	public Integer updatecompanyVisitCount(Integer companyVisitCount);
	//分页
	public List<CompanyVisitCount> findAll(@Param("page")Integer page);
	//查找企业id
	public CompanyVisitCount findById(Integer companyId);
	//查找发表信息的数量和发表简历的数量
	public CompanyVisitCount findcompanyInfoCountAndcompanyResumeCount(@Param("year")Integer companyYear,@Param("month")Integer companyMonth,@Param("day")Integer companyDay);
	//获得信息量的最大值。
	public Integer getMaxRecord();
}
