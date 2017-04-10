package ynjh.company.dao.company;

import ynjh.company.entity.CompanyIntrodution;

public interface CompanyIntrodutionMapper {
	public Integer updateCompanyInt(Integer id);
	public Integer addCompanInt(CompanyIntrodution companyInt);
	public CompanyIntrodution findById(Integer id);
}
