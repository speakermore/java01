package ynjh.personal.service;

import java.util.List;
import ynjh.personal.entity.User;

public interface UserService {
	/**
	 * 登录
	 */
	public User login(String userLoginId,String userPassword); 
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
	public Integer updateUserPassword(Integer userId);
	/**
	 * 根据id查询用户（显示用户信息）
	 */
	public User selectUserById(Integer id);
	/**
	 * 充值
	 */
	public Integer chargeMoney(Double money,Integer id); 
	/**
	 * 搜索
	 */
	public List<String>	Search(String str);
}