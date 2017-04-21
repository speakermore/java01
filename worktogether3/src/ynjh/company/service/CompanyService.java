package ynjh.company.service;

import ynjh.company.entity.Company;

public interface CompanyService {
	//注册
	public int addCompany(Company company);
	//修改企业资料
	public int updateCompany(Company company);
	//登录
	public Company login(String companyLoginId,String companyPassword);
	//根据id查询
	public Company findCompany(Integer id);
	
	
}
