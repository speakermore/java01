package ynjh.company.service;

import ynjh.company.entity.Company;

public interface CompanyService {
	//注册
	public Integer addCompany(Company company);
	//修改企业资料
	public Integer updateCompany(Company company);
	//登录
	public Company login(String companyLoginId,String companyPassword);
	//根据id查询
	public Company findCompany(Integer id);
	public Integer addCompanyDetailId(Integer id,String companyDetailImg,Integer companyDetailDisc);
	
}
