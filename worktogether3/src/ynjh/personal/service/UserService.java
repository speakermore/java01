package ynjh.personal.service;

import java.util.List;
import java.util.Map;

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

	// 
	/**
	 * 完善用户信息
	 * 性别、email、出生日期、昵称
	 * @param user 包含需要修改的信息的实体对象
	 * @return 大于0表示修改成功，否则表示失败
	 */
	public Integer updateUserOther(User user);

	// 实名认证
	public Integer updateUserIDCord(User user);

	// 修改用户信息
	public Integer updateUser(User user);
	/**
	 * 牟勇：修改用户状态
	 * 1.未认证，2.已认证，3.认证未通过，4.禁用
	 * @param id 用户的主键
	 * @param userStatus 用户的状态值，整数
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer updateUserStatus(Integer id,Integer userStatus);

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
	/**
	 * 牟勇：根据用户的文章总数与点赞总数降序排序，获得前10名用户的<br />
	 * id，昵称（userName），文章总数（articleNumber），点赞总数（likeNum），被关注总数（byFollowNumber）
	 * @return 排名前10的用户Map对象集合，一个用户的信息由一个Map组成
	 */
	public List<Map<String, Object>> recommendUsers();
	/**
	 * 牟勇：推荐用户的基本信息<br />
	 * 包括：工作时间(resumeWorks)，性别(userGender)，生日(userBirthday),主键(id),登录帐号（userLoginId）,头像（userHeadImgPath）,昵称(userName),心情(moodContent)<br />
	 * @param userId 用户主键
	 * @return 唯一指定的一个用户Map
	 */
	public Map<String, Object> recommentPersonalDetail(Integer userId);
}
