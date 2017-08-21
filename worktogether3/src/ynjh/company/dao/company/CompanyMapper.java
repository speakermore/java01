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
	/**
	 * 根据企业主键查询企业信息
	 * @param id 企业主键
	 * @return 企业实体类对象
	 */
	public Company findById(Integer id);
	//查询公司环境图片
	public List<CompanyDetailImg> findDetailImg(Integer companyId);
	//修改公司环境图片
	public Integer updateImg(@Param("id")Integer id,@Param("companyDetailImg") String companyDetailImg);
	//增加公司联系电话
	public Integer addCompanyConnection(@Param("companyId")Integer companyId,@Param("cmpConnectionName")String cmpConnectionName,@Param("cmpConnection")String cmpConnection);
	//修改公司联系电话
	public Integer updateCompanyConnection(@Param("id")Integer id,@Param("companyId")Integer companyId,@Param("cmpConnectionName")String cmpConnectionName,@Param("cmpConnection")String cmpConnection);
	//查询公司联系电话
	public List<CompanyConnection> findCompanyConnection(Integer companyId);
	//删除公司联系电话
	public Integer deleteCompanyConnection(Integer id);
	//匹配用户名是否重复
	public Company verificationCompanyLoginId(String companyLoginId);
	/**
	 * 牟勇：删除公司环境图片
	 * @param id 环境图片id
	 * @return 受影响的行数
	 */
	public Integer deleteCompanyEnvirmentImg(Integer id);
	/**
	 * 牟勇：根据环境图片id查询这张图片是否存在
	 * 
	 * @param id 环境图片id
	 * @return 如果返回0则表示没有查到图片，如果是大于0的数字则表示查到了一张图片
	 */
	public Integer findByEnvirmentImgId(Integer id);
	/**
	 * 牟勇：查询所有的企业信息，为后台企业信息管理准备数据
	 * @return 全部的企业信息
	 */
	public List<Company> findCompanyForCharge();
	/**
	 * 牟勇：根据企业id修改企业的某个列值
	 * @param column 列名
	 * @param value 列值，以字符串形式传入
	 * @param companyId 企业Id，主键
	 * @return 影响的行数，通常大于0表示成功，否则表示失败
	 */
	public Integer updateCompanyProperty(@Param("column")String column,@Param("value")String value,@Param("companyId")Integer companyId);
	/**
	 * 牟勇：根据企业主键查询企业余额
	 * @param companyId 企业用户主键
	 * @return 企业用户的余额
	 */
	public Integer findCompanyMoneyById(@Param("companyId")Integer companyId);
	/**
	 * 牟勇：根据文章数与点赞数排序
	 * @return
	 */
	public List<Company> find5CompanyAndRecruitGroupByArticleNumberAndLikeNumber();
}
