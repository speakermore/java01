package ynjh.company.dao.companyrecruit;


import java.util.List;

import org.apache.ibatis.annotations.Param;


import ynjh.company.entity.CompanyRecruit;


public interface CompanyRecruitMapper {
	public int addCompanyRecruit(CompanyRecruit companyRecruit);
	public List<CompanyRecruit> findAll(@Param("page")Integer page);
	public Integer updateCpmRecTitle(@Param("id")Integer id,@Param("cpmRecTitle")String cpmRecTitle );
	public Integer updateCpmRecWage(@Param("id")Integer id,@Param("cpmRecWage")String CpmRecWage);
	public Integer updateCpmRecEducation(@Param("id")Integer id,@Param("cpmRecEducation")String cpmRecEducation);
	public Integer updateCmpRecExperience(@Param("id")Integer id,@Param("cmpRecExperience")String CmpRecExperience);
	public Integer updateCmpRecPeople(Integer id);
	public Integer updateCmpRecStatus(Integer id);
	public CompanyRecruit findById(Integer id);
	public int hidden(Integer id);
	public int getMaxRecordCount();
}
