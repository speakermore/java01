package ynjh.company.dao.company;

import org.apache.ibatis.annotations.Param;

import ynjh.company.enity.Company;

public interface CompanyMapper {
	public Integer addCompany(Company company);
	public Integer updateCompanyById(Integer companyId);
	public Company findByloginIdAndPassword(@Param("companyLoginId")String companyLoginId,@Param("companyPassword")String companyPassword);
	public Company findById(Integer id);
	
}
