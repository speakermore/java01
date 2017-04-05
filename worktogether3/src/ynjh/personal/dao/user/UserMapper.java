package ynjh.personal.dao.user;

import java.util.List;

import ynjh.personal.entity.User;

public interface UserMapper {
	/**
	 * 登录
	 */
	public User loginByUserIdAndUserPassword(User user); 
	/**
	 * 添加用户（注册）
	 */
	public Integer addUser(User user);
	/**
	 * 完善用户信息
	 */
	public Integer addUserOther(User user);
	/**
	 * 实名认证
	 */
	public Integer addUserIDCord(User user);
	/**
	 * 修改用户信息
	 */
	public Integer updateUser(User user);
	/**
	 * 修改用户密码
	 */
	public Integer updateUserById(Integer userId,String status);
	/**
	 * 根据id查询用户（显示用户信息）
	 */
	public List<User> selectUserById(Integer id);
	/**
	 * 充值
	 */
	public Integer updateMoney(Integer money,Integer id); 
	/**
	 * 搜索
	 */
	public List<String>	Search(String str);
}
