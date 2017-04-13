package ynjh.company.service;

import ynjh.company.entity.CompanyIntroduction;

public interface CompanyIntService {

	//修改企业简介
	public Integer updateCompanyInt(CompanyIntroduction companyInt);
	//通过id查询简介
	public CompanyIntroduction findById(Integer id);
	//添加企业简介
	public Integer addCompanyInt(CompanyIntroduction companyInt);
	
}
