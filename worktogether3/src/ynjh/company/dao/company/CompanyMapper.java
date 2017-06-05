package ynjh.company.dao.company;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyConnection;
import ynjh.company.entity.CompanyDetailImg;

public interface CompanyMapper {
	//注册公司
	public Integer addCompany(Company company);
	//添加公司环境图片
	public Integer addCompanyDetailImg(@Param("companyId")Integer companyId,@Param("companyDetailImg")String companyDetailImg,@Param("companyDetailDisc")String companyDetailDisc);
	//更新公司信息
	public Integer updateCompanyById(Company company);
	//修改密码
	public Integer updatePassword(@Param("id")Integer id,@Param("newPassword")String newPassword);
	//登录
	public Company findByloginIdAndPassword(@Param("companyLoginId")String companyLoginId,@Param("companyPassword")String companyPassword);
	//查询公司信息
	public Company findById(Integer id);
	//查询公司环境图片
	public List<CompanyDetailImg> findDetailImg(Integer companyId);
	//修改公司环境图片
	public Integer updateImg(@Param("id")Integer id,@Param("companyDetailImg") String companyDetailImg,@Param("companyDetailDisc")String companyDetailDisc);
	//增加公司联系电话
	public Integer addCompanyConnection(CompanyConnection companyConnection);
	//修改公司联系电话
	public Integer updateCompanyConnection(CompanyConnection companyConnection);
	//查询公司联系电话
	public List<CompanyConnection> findCompanyConnection(Integer companyId);
}
