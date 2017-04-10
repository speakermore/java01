package ynjh.company.dao.company;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Company;

public interface CompanyMapper {
	public Integer addCompany(Company company);
	public Integer updateCompanyById(Integer id);
	public Company findByloginIdAndPassword(@Param("companyLoginId")String companyLoginId,@Param("companyPassword")String companyPassword);
	public Company findById(Integer id);
	
}
