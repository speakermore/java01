package ynjh.personal.service.impl.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.personal.dao.user.UserMapper;
import ynjh.personal.entity.User;
import ynjh.personal.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper; 
	@Override
	public User login(String userLoginId, String userPassword) {
		return userMapper.loginByUserIdAndUserPassword(userLoginId, userPassword);
	}

	@Override
	public Integer addUser(User user) {
		return userMapper.addUser(user);
	}

	@Override
	public Integer updateUserOther(User user) {
		return userMapper.updateUserOther(user);
	}

	@Override
	public Integer updateUserIDCord(User user) {
		return userMapper.updateUserIDCord(user);
	}

	@Override
	public Integer updateUser(User user) {
		return userMapper.updateUser(user);
	}

	@Override
	public Integer updateUserPassword(Integer userId) {
		return userMapper.updateUserById(userId);
	}

	@Override
	public User selectUserById(Integer id) {
		return userMapper.selectUserById(id);
	}

	@Override
	public Integer chargeMoney(Double money, Integer id) {
		return userMapper.updateMoney(money, id);
	}

	@Override
	public List<String> Search(String str) {
		return userMapper.Search(str);
	}

}
