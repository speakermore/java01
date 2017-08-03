package ynjh.personal.service;

import java.util.List;

import ynjh.personal.entity.CompanyList;
import ynjh.personal.entity.User;
import ynjh.personal.entity.UserAndResume;
import ynjh.personal.entity.UserCharge;

/**
 * 用户Service接口
 * @author 刘志浩 
 */
public interface UserService {
	
	/**
	 * 登录
	 * @param userLoginId 用户登录名，手机
	 * @param userPassword 用户密码，MD5加密
	 * @return User对象，为null是表示用户名或密码没有输入正确
	 */
	public User login(String userLoginId, String userPassword);

	// 添加用户（注册）
	public Integer addUser(User user);

	// 完善用户信息
	public Integer updateUserOther(User user);

	// 实名认证
	public Integer updateUserIDCord(User user);

	// 修改用户信息
	public Integer updateUser(User user);

	/**
	 * 修改用户密码
	 */
	public Integer updateUserPasswordById(String userPassword, Integer userId);

	/**
	 * 修改用户头像
	 */
	public Integer updateUserHeadImgPathById(String userHeadImgPath, Integer userId);

	// 根据id查询用户（显示用户信息）
	
	public User findUserById(Integer id);

	// 充值
	public Integer chargeMoney(Double money, Integer id);

	// 充值记录
	public Integer addUserCharge(UserCharge userCharge);

	// 搜索
	public List<String> Search(String str);

	// 软件人才列表
	public List<UserAndResume> findUserList(Integer page, String userLoginId);

	/**
	 * 软件人才列表总数据1
	 */
	public Integer getMaxUserList(String userLoginId);

	/**
	 * 软件人才列表2
	 */
	public List<UserAndResume> findUserListForOther(Integer page);

	/**
	 * 软件人才列表总数据2
	 */
	public Integer getMaxUserListForOther();

	/**
	 * 企业列表
	 */
	public List<CompanyList> findCompanyList(Integer page);

	/**
	 * 企业列表总数据
	 */
	public Integer getMaxCompanyList();
	
	/**
	 * 匹配用户名是否重复
	 */
	public User verificationUserLoginId(String userLoginId);
}
