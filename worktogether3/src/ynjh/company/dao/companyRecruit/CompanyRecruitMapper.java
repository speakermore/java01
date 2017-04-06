package ynjh.company.dao.companyRecruit;


import java.util.List;

import org.apache.ibatis.annotations.Param;


import ynjh.company.enity.CompanyRecruit;


public interface CompanyRecruitMapper {
	public int addCompanyRecruit(CompanyRecruit companyRecruit);//增
	public List<CompanyRecruit> findAll(Integer page);//分页
	public Integer updateCpmRecTitle(@Param("companyId")Integer companyId,@Param("cpmRecTitle")String cpmRecTitle );//修改标题
	public Integer updateCpmRecWage(@Param("companyId")Integer companyId,@Param("cpmRecWage")String CpmRecWage);//修改薪资
	public Integer updateCpmRecEducation(@Param("companyId")Integer companyId,@Param("cpmRecEducation")String cpmRecEducation);//修改学历
	public Integer updateCmpRecExperience(@Param("companyId")Integer companyId,@Param("cmpRecExperience")String CmpRecExperience);//修改内容
	public Integer updateCmpRecPeople(Integer companyId);//修改需求人数
	public Integer updateCmpRecStatus(Integer companyId);//修改招聘信息状态1:待审 2：审核通过 3：审核不通过
	public CompanyRecruit findById(Integer id);
	public int hidden(Integer id);
}
