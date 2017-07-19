package ynjh.company.service;

import java.util.List;

import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyConnection;
import ynjh.company.entity.CompanyDetailImg;

public interface CompanyService {
	public static String[] COMPANY_POSITION={"员工","前台","办公区","会议室","休息区","其他"};
	//注册
	public Integer addCompany(Company company);
	//修改企业资料
	public Integer updateCompany(Company company);
	//登录
	public Company login(String companyLoginId,String companyPassword);
	//根据id查询
	public Company findCompany(Integer id);
	
	/**
	 * 牟勇：添加企业环境图片
	 * 首先根据id查询图片是否存在。
	 * 如果不存在，则添加图片，
	 * 如果存在，则修改图片。
	 * index为环境图片的位置下标，对应{"员工","前台","办公区","会议室","休息区","其他"}数组
	 * @param companyId 企业id
	 * @param companyDetailImg 企业环境图片的路径
	 * @param index 环境图片的位置下标
	 * @param id 环境图片的主键
	 * @return 影响到几条记录
	 */
	public Integer addCompanyDetailImg(Integer companyId, String companyDetailImg,Integer index,Integer id);
	//根据企业id查找图片
	public List<CompanyDetailImg> findDetailImg(Integer companyId);
	//修改密码
	public Integer updatePassword(Integer id,String newPassword);
	//修改企业环境图片
	public Integer updateImg(Integer id,String companyDetailImg);
	//添加企业联系方式
	public Integer addCompanyConnection(Integer id,String cmpConnectionName,String cmpConnection);
	//修改企业联系方式
	public Integer updateCompanyConnection(Integer id,Integer companyId,String cmpConnectionName,String cmpConnection);
	//查询企业联系方式
	public List<CompanyConnection> findCompanyConnection(Integer companyId);
	//删除企业联系方式
	public Integer deleteCompanyConnection(Integer id);
	//匹配用户名是否重复
	public Company verificationCompanyLoginId(String companyLoginId);
}
