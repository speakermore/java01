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
	/**
	 * 根据id查询企业信息
	 * @param companyId 企业主键
	 * @return Company对象
	 */
	public Company findCompanyById(Integer companyId);
	
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
	/**
	 * 牟勇：查询所有的企业信息，为后台企业管理做准备
	 * @return 所有的企业信息
	 */
	public List<Company> findAllCompany();
	/**
	 * 牟勇：根据企业用户id查询余额
	 * @param companyId 企业用户的主键
	 * @return 余额
	 */
	public Integer findCompanyMoneyById(Integer companyId);
	/**
	 * 牟勇：充值。根据企业主键完成对企业的充值计算，并进行记录<br />
	 * <strong>注意：本方法中完成了余额的累加计算，只需要传入实际充入的金额即可</strong>
	 * 
	 * @param money 充值金额
	 * @param companyId 企业用户主键
	 * @param adminId 做此操作的管理员id
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer updateAdminCharging(Integer money,Integer companyId,Integer adminId);
	/**
	 * 牟勇：推荐企业
	 * 根据文章总数降序，点赞数求和降序进行排列
	 * 限制返回前5个企业
	 * @return 返回Company实体集合。
	 */
	public List<Company> findRecommentCompany();
}
