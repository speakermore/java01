package ynjh.company.dao.company;

import ynjh.company.entity.CompanyIntroduction;

public interface CompanyIntroductionMapper {
	public Integer updateCompanyInt(CompanyIntroduction companyInt);
	public Integer addCompanyInt(CompanyIntroduction companyInt);
	public CompanyIntroduction findById(Integer id);
}
 