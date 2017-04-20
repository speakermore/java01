package ynjh.personal.controller.user;

import java.sql.Timestamp;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ynjh.personal.entity.User;
import ynjh.personal.entity.UserCharge;
import ynjh.personal.service.UserService;

@Controller
@RequestMapping("/personal/user")
public class UserController {
	@Resource
	private UserService uService;

	// 登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(String userLoginId, String userPassword, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = uService.login(userLoginId, userPassword);
		if (user == null) {
			mv.addObject("errorInfo", "用户名或密码不正确");
			mv.setViewName("personal/user/personal_login");
		} else {
			session.setAttribute("user", user);
			mv.addObject("user", user);
			mv.setViewName("redirect:../article/lookArticleList?toPage=1&userId="+user.getId());
		}
		return mv;
	}

	// 退出
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "personal/user/personal_login";
	}

	// 跳转
	@RequestMapping("/login")
	public String login() {
		return "personal/user/personal_login";
	}

	// 跳转
	@RequestMapping(value = "/gotoIndex", method = RequestMethod.GET)
	public String gotoIndex() {
		return "personal/user/personal_index";
	}

	// 创建注册用户
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ModelAndView addUser(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		user.setUserCreateDate(new Timestamp(System.currentTimeMillis()));
		user.setUserBirthday(new Timestamp(System.currentTimeMillis()));
		user.setUserEmail("无");
		user.setUserGender(1);
		user.setUserHeadImgPath("无");
		user.setUserIDCard("无");
		user.setUserIDImgCon("无");
		user.setUserIDImgFace("无");
		user.setUserName("无");
		user.setUserRealName("无");
		Integer result = uService.addUser(user);
		if (result > 0) {
			mv.addObject("user", user);
			session.setAttribute("user", user);
			mv.addObject("operatorInfo", "注册成功！");
			mv.setViewName("personal/user/personal_register_two");
		} else {
			mv.addObject("operatorInfo", "注册失败");
			mv.setViewName("personal/user/personal_register");
		}
		return mv;
	}

	// 跳转
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUser() {
		return "personal/user/personal_register";
	}

	/* 完善用户信息 */
	@RequestMapping(value = "/addUserOther", method = RequestMethod.POST)
	public ModelAndView addUserOther(User user) {
		ModelAndView mv = new ModelAndView();
		int result = uService.updateUserOther(user);
		if (result > 0) {
			mv.addObject("user", user);
			mv.addObject("operatorInfo", "完善资料成功！");
			mv.setViewName("personal/user/personal_register_three");
		} else {
			mv.addObject("operatorInfo", "完善资料失败");
			mv.setViewName("personal/user/personal_register_two");
		}
		return mv;
	}

	/* 实名用户信息 */
	@RequestMapping(value = "/addUserReal", method = RequestMethod.POST)
	public ModelAndView addUserReal(User user) {
		ModelAndView mv = new ModelAndView();
		int result = uService.updateUserIDCord(user);
		if (result > 0) {
			mv.addObject("user", user);
			mv.addObject("operatorInfo", "实名认证成功！");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "实名认证失败");
			mv.setViewName("personal/user/personal_register_three");
		}
		return mv;
	}

	/* 跳转用户修改页面 */
	@RequestMapping(value = "/findById", method = RequestMethod.GET)
	public ModelAndView findById(Integer id) {
		ModelAndView mv = new ModelAndView();
		User user = uService.selectUserById(id);
		mv.setViewName("personal/user/personal_update_user");
		mv.addObject("user", user);
		return mv;
	}

	// 修改用户信息
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public ModelAndView updateUser(User user) {
		ModelAndView mv = new ModelAndView();
		user.setUserBirthday(new Timestamp(System.currentTimeMillis()));
		int result = uService.updateUser(user);
		if (result > 0) {
			mv.addObject("operatorInfo", "修改成功！");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "修改失败！");
			mv.setViewName("personal/user/personal_register");
		}
		return mv;
	}

	// 跳转到充值界面
	@RequestMapping(value = "/chargeById", method = RequestMethod.GET)
	public ModelAndView chargeById(Integer id) {
		ModelAndView mv = new ModelAndView();
		User user = uService.selectUserById(id);
		mv.setViewName("personal/user/personal_chargemoney");
		mv.addObject("user", user);
		return mv;
	}

	// 充值
	@RequestMapping(value = "/chargeMoney", method = RequestMethod.POST)
	public ModelAndView chargeMonety(Double userMoney, Integer id) {
		ModelAndView mv = new ModelAndView();
		int result = uService.chargeMoney(userMoney, id);
		User user = uService.selectUserById(id);
		UserCharge userCharge = new UserCharge();
		userCharge.setUserChargeType(1);
		userCharge.setUserId(id);
		userCharge.setUserChargeContent("无");
		userCharge.setUserChargeTime(new Timestamp(System.currentTimeMillis()));
		userCharge.setUserChargeMoney(userMoney);
		int remmeber = uService.addUserCharge(userCharge);
		if (result > 0) {
			if (remmeber>0) {
				mv.addObject("user", user);
				mv.addObject("operatorInfo", "充值成功！");
				mv.setViewName("personal/user/personal_index");
			}
		} else {
			mv.addObject("operatorInfo", "充值失败！");
			mv.setViewName("personal/user/personal_chargemoney");
		}
		return mv;
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "personal/user/test";
	}

//	// 转换时间
//	public Timestamp comment(String time) {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Timestamp timestamp = null;
//		try {
//			Date dateTime = sdf.parse(time);
//			timestamp = new Timestamp(dateTime.getTime());
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		return timestamp;
//	}

}
