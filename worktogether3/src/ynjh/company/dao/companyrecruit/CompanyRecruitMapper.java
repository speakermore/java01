package ynjh.company.dao.companyrecruit;


import java.util.List;

import org.apache.ibatis.annotations.Param;


import ynjh.company.entity.CompanyRecruit;


public interface CompanyRecruitMapper {
	//添加招聘信息
	public int addCompanyRecruit(CompanyRecruit companyRecruit);
	//查询所有招聘信息
	public List<CompanyRecruit> findAll(@Param("page")Integer page,@Param("companyId")Integer companyId);
	//根据id修改招聘信息状态
	public Integer updateCmpRecStatus(@Param("cmpRecStatus")Integer cmpRecStatus,@Param("id")Integer id);
	//根据id修改招聘信息
	public Integer updateCmpRecruit(CompanyRecruit companyRecruit );
	//根据id查询到招聘信息
	public CompanyRecruit findById(Integer id);
	//得到最大页码数
	public int getMaxRecordCount();
	//得到未阅读简历个数
	public int getResumeCount(Integer companyId);
}
