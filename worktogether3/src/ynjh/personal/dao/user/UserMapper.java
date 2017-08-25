package ynjh.personal.dao.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
	 * 完善用户信息：性别、email、出生日期、昵称
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
	public Integer updateUserPasswordById(@Param("userPassword") String userPassword, @Param("userId") Integer userId);

	/**
	 * 修改用户头像
	 */
	public Integer updateUserHeadImgPathById(@Param("userHeadImgPath") String userHeadImgPath,
			@Param("userId") Integer userId);

	/**
	 * 根据id查询用户（显示用户信息）
	 */
	public User findUserById(Integer id);

	/**
	 * 牟勇：完成对用户余额的更新<br/>
	 * 这里是直接更新了余额字段，并没有做任何的计算<br />
	 * 余额理论上是大于等于0的，但本方法并未做相应的判断<br />
	 * 如果你要计算余额，可以先调用findUserMoneyByUserId方法获得余额，计算完毕之后再调用此方法，完成用户余额的修改<br />
	 * <strong>注意：余额是必须进行计算后的数额，不能直接把增加或减少的额度传进来</strong>
	 * @param money 用户的实际余额
	 * @param id 用户的主键id
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer updateMoney(@Param("userMoney") Double money, @Param("id") Integer id);

	/**
	 * 充值记录
	 */
	public Integer addUserCharge(UserCharge userCharge);

	/**
	 * 软件人才列表1
	 */
	public List<UserAndResume> findUserList(@Param("page") Integer page, @Param("userLoginId") String userLoginId);

	/**
	 * 软件人才列表总数据1
	 */
	public Integer getMaxUserList(String userLoginId);

	/**
	 * 软件人才列表2
	 */
	public List<UserAndResume> findUserListForOther(@Param("page")Integer page);

	/**
	 * 软件人才列表总数据2
	 */
	public Integer getMaxUserListForOther();

	/**
	 * 企业列表
	 */
	public List<CompanyList> findCompanyList(@Param("page") Integer page);

	/**
	 * 企业列表总数据
	 */
	public Integer getMaxCompanyList();

	/**
	 * 搜索
	 */
	public List<String> Search(String str);
	
	/**
	 * 匹配用户名是否重复
	 */
	public User verificationUserLoginId(String userLoginId);
	/**
	 * 牟勇：根据指定的主键id，修改用户表中某个指定的属性
	 * @param column 字段名
	 * @param value 字段值
	 * @param id 用户的主键id
	 * @return 成功应该返回大于0的整数，否则为失败
	 */
	public Integer updateUserProperty(@Param("column")String column,@Param("value")String value,@Param("id")Integer id);
	/**
	 * 牟勇：根据用户id查询用户的余额<br />
	 * @param id 用户id
	 * @return 用户余额
	 */
	public Integer findUserMoneyById(Integer id);
	/**
	 * 牟勇：根据用户的文章总数与点赞总数降序排序，获得前10名用户的<br />
	 * id，昵称（userName），文章总数（articleNumber），点赞总数（articleLikeNum),关注总数<br />
	 * @return 排名前10的用户Map对象集合，一个用户的信息由一个Map组成
	 */
	public List<Map<String, Object>> findUser10ByArticleCountAndLikeNum();
}
