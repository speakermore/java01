package ynjh.company.service;

import ynjh.company.entity.CompanyIntrodution;

public interface CompanyIntService {

	//修改企业简介
	public Integer updateCompanyInt(CompanyIntrodution companyInt);
	//通过id查询简介
	public CompanyIntrodution findById(Integer id);
	
}
