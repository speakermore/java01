package ynjh.personal.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.User;




public interface UserMapper {
	/**
	 * 登录
	 */
	public User loginByUserIdAndUserPassword(@Param("userLoginId")String userLoginId,@Param("userPassword")String userPassword); 
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
	public Integer updateMoney(@Param("userMoney")Double money,@Param("id")Integer id); 
	/**
	 * 搜索
	 */
	public List<String>	Search(String str);
}
