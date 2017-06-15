package ynjh.company.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyConnection;
import ynjh.company.entity.CompanyDetailImg;

public interface CompanyService {
	//注册
	public Integer addCompany(Company company);
	//修改企业资料
	public Integer updateCompany(Company company);
	//登录
	public Company login(String companyLoginId,String companyPassword);
	//根据id查询
	public Company findCompany(Integer id);
	//添加公司环境图片
	public Integer addCompanyDetailId(Integer id,String companyDetailImg,Integer companyDetailDisc);
	//根据公司id查找图片
	public List<CompanyDetailImg> findDetailImg(Integer companyId);
	//修改密码
	public Integer updatePassword(Integer id,String newPassword);
	//修改公司环境图片
	public Integer updateImg(Integer id,String companyDetailImg,Integer companyDetailDiscInt);
	//添加公司联系方式
	public Integer addCompanyConnection(Integer id,String cmpConnectionName,String cmpConnection);
	//修改公司联系方式
	public Integer updateCompanyConnection(Integer id,Integer companyId,String cmpConnectionName,String cmpConnection);
	//查询公司联系方式
	public List<CompanyConnection> findCompanyConnection(Integer companyId);
	//删除公司联系方式
	public Integer deleteCompanyConnection(Integer id);
	//匹配用户名是否重复
	public Company verificationCompanyLoginId(String companyLoginId);
}
