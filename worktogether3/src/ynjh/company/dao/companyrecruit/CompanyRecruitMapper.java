package ynjh.company.dao.companyrecruit;


import java.util.List;

import org.apache.ibatis.annotations.Param;


import ynjh.company.entity.CompanyRecruit;


public interface CompanyRecruitMapper {
	public int addCompanyRecruit(CompanyRecruit companyRecruit);
	public List<CompanyRecruit> findAll(@Param("page")Integer page);
	public Integer updateCmpRecStatus(@Param("id")Integer id,@Param("cmpRecStatus")Integer cmpRecStatus);
	public Integer updateCmpRecruit(CompanyRecruit companyRecruit );
	public CompanyRecruit findById(Integer id);
	public int getMaxRecordCount();
}
