package ynjh.company.dao.company;

import org.apache.ibatis.annotations.Param;
import ynjh.company.entity.Company;

public interface CompanyMapper {
	public Integer addCompany(Company company);
	public Integer addCompanyDetailImg(@Param("companyId")Integer companyId,@Param("companyDetailImg")String companyDetailImg,@Param("companyDetailDisc")String companyDetailDisc);
	public Integer updateCompanyById(Company company);
	public Company findByloginIdAndPassword(@Param("companyLoginId")String companyLoginId,@Param("companyPassword")String companyPassword);
	public Company findById(Integer id);
	
}
