package ynjh.personal.service.impl.user;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ynjh.common.exception.AgeOverFlowException;
import ynjh.common.util.LiuZhiHaoDateTimeUtil;
import ynjh.personal.dao.user.UserMapper;
import ynjh.personal.entity.CompanyList;
import ynjh.personal.entity.User;
import ynjh.personal.entity.UserAndResume;
import ynjh.personal.entity.UserCharge;
import ynjh.personal.service.UserService;
/**
 * 
 * @author 刘志浩
 * 操作用户信息
 */
@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper; 
	/**
	 * 登录
	 * @return User 用户对象
	 * @param userLoginId 用户名
	 * @param userPassword 用户密码
	 */
	@Override
	public User login(String userLoginId, String userPassword) {
		return userMapper.findByUserIdAndUserPassword(userLoginId, userPassword);
	}
	/**
	 * 添加用户
	 * @return Integer 大于0成功 其余失败
	 * @param user 用户对象
	 */
	@Override
	public Integer addUser(User user) {
		return userMapper.addUser(user);
	}
	/**
	 * 完善用户信息
	 * @return Integer 大于0成功 其余失败
	 * @param user 用户对象
	 */
	@Override
	public Integer updateUserOther(User user) {
		return userMapper.updateUserOther(user);
	}
	/**
	 * 实名认证
	 * @return Integer 大于0成功 其余失败
	 * @param user 用户对象
	 */
	@Override
	public Integer updateUserIDCord(User user) {
		return userMapper.updateUserIDCord(user);
	}
	/**
	 * 修改用户信息
	 * @return Integer 大于0成功 其余失败
	 * @param user 用户对象
	 */
	@Override
	public Integer updateUser(User user) {
		return userMapper.updateUser(user);
	}
	
	
	/**
	 * 查询用户详细信息
	 * @return User 用户对象
	 * @param Integer 用户id
	 */
	@Override
	public User findUserById(Integer id) {
		return userMapper.findUserById(id);
	}
	/**
	 * 充值
	 * @return Integer 大于0成功 其余失败
	 * @param money 充值的金额
	 * @param id 用户id
	 */
	@Override
	public Integer chargeMoney(Double money, Integer id) {
		return userMapper.updateMoney(money, id);
	}
	/**
	 * 搜索
	 * @return List<String> 搜索到的信息
	 * @param str 搜索条件
	 */
	@Override
	public List<String> Search(String str) {
		return userMapper.Search(str);
	}
	/**
	 * 充值记录
	 * @return Integer 大于0成功 其余失败
	 * @param userCharge 充值记录对象
	 */
	@Override
	public Integer addUserCharge(UserCharge userCharge) {
		return userMapper.addUserCharge(userCharge);
	}
	/**
	 * 软件人才列表
	 */
	@Override
	public List<UserAndResume> findUserList(Integer page,String userLoginId) {
		
		if(page!=null){
			
			if (page < 1) {
				page = 1;
			}
			int maxPage = getMaxUserList(userLoginId);

			if (page > maxPage) {
				page = maxPage;
			}
			page=(page-1)*20;
		}
		//如果page==null，则不进行分页
		return userMapper.findUserList(page,userLoginId);
	}
	/**
	 * 软件人才列表总数据
	 */
	@Override
	public Integer getMaxUserList(String userLoginId) {
		if (userMapper.getMaxUserList(userLoginId) <= 0) {
			return 1;
		} else {
			return (userMapper.getMaxUserList(userLoginId) + 20 - 1) / 20;
		}
	}
	/**
	 * 获取企业列表
	 */
	@Override
	public List<CompanyList> findCompanyList(Integer page) {
		if (page == null) {
			page = 1;
		}
		if (page < 1) {
			page = 1;
		}
		int maxPage = getMaxCompanyList();

		if (page > maxPage) {
			page = maxPage;
		}
		return userMapper.findCompanyList((page - 1) * 20);
	}
	/**
	 * 企鹅列表分页
	 */
	@Override
	public Integer getMaxCompanyList() {
		if (userMapper.getMaxCompanyList() <= 0) {
			return 1;
		} else {
			return (userMapper.getMaxCompanyList() + 20 - 1) / 20;
		}
	}
	/**
	 * 修改用户密码
	 * @return Integer 大于0成功 其余失败
	 * @param Integer 用户id
	 */
	@Override
	public Integer updateUserPasswordById(String userPassword, Integer userId) {
		return userMapper.updateUserPasswordById(userPassword, userId);
	}
	/**
	 * 修改用户头像
	 * @return Integer 大于0成功 其余失败
	 * @param Integer 用户id
	 */
	@Override
	public Integer updateUserHeadImgPathById(String userHeadImgPath, Integer userId) {
		return userMapper.updateUserHeadImgPathById(userHeadImgPath, userId);
	}
	/**
	 * 软件人才列表1
	 */
	@Override
	public List<UserAndResume> findUserListForOther(Integer page) {
		if (page == null) {
			page = 1;
		}
		if (page < 1) {
			page = 1;
		}
		int maxPage = getMaxUserListForOther();

		if (page > maxPage) {
			page = maxPage;
		}
		return userMapper.findUserListForOther((page - 1) * 20);
	}
	/**
	 * 软件人才中数据2
	 */
	@Override
	public Integer getMaxUserListForOther() {
		if (userMapper.getMaxUserListForOther() <= 0) {
			return 1;
		} else {
			return (userMapper.getMaxUserListForOther() + 20 - 1) / 20;
		}
	}
	/**
	 * 匹配软件人才
	 */
	@Override
	public User verificationUserLoginId(String userLoginId) {
		return userMapper.verificationUserLoginId(userLoginId);
	}
	@Override
	public List<Map<String, Object>> recommendUsers() {
		return userMapper.findUser10ByArticleCountAndLikeNum();
	}
	@Override
	public Integer updateUserStatus(Integer id, Integer userStatus) {
		
		return userMapper.updateUserProperty("userStatus", ""+userStatus, id);
	}
	@Override
	public Map<String, Object> recommentPersonalDetail(Integer userId) {
		Map<String, Object> personalDetail=userMapper.findUserBaseInfoById(userId);
		try {
			personalDetail.put("resumeWorks", LiuZhiHaoDateTimeUtil.getAgeTools((Date)personalDetail.get("resumeWorks")));
		} catch (AgeOverFlowException e) {
			e.printStackTrace();
		}
		return personalDetail;
	}
}
