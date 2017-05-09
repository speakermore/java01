package ynjh.personal.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Company;
import ynjh.personal.entity.CompanyList;
import ynjh.personal.entity.User;
import ynjh.personal.entity.UserAndResume;
import ynjh.personal.entity.UserCharge;

public interface UserMapper {
	/**
	 * 登录
	 */
	public User findByUserIdAndUserPassword(@Param("userLoginId") String userLoginId,
			@Param("userPassword") String userPassword);

	/**
	 * 添加用户（注册）
	 */
	public Integer addUser(User user);

	/**
	 * 完善用户信息
	 */
	public Integer updateUserOther(User user);

	/**
	 * 实名认证
	 */
	public Integer updateUserIDCord(User user);

	/**
	 * 修改用户信息
	 */
	public Integer updateUser(User user);

	/**
	 * 修改用户密码
	 */
	public Integer updateUserById(Integer userLoginId);

	/**
	 * 根据id查询用户（显示用户信息）
	 */
	public User selectUserById(Integer id);

	/**
	 * 充值
	 */
	public Integer updateMoney(@Param("userMoney") Double money, @Param("id") Integer id);

	/**
	 * 充值记录
	 */
	public Integer addUserCharge(UserCharge userCharge);

	/**
	 * 软件人才列表
	 */
	public List<UserAndResume> findUserList(@Param("page") Integer page, @Param("userLoginId") String userLoginId);

	/**
	 * 软件人才列表总数据
	 */
	public Integer getMaxUserList();

	/**
	 * 企业列表
	 */
	public List<CompanyList> findCompanyList(@Param("page") Integer page);

	/**
	 * 企业列表总数据
	 */
	public Integer getMaxCompanyList();
	/**
	 * 企业详细
	 */
	public CompanyList findCompanyById(Integer id);
	

	/**
	 * 搜索
	 */
	public List<String> Search(String str);
}
