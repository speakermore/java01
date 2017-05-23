package ynjh.personal.controller.user;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.util.GetAge;
import ynjh.common.util.MD5Util;
import ynjh.common.util.UploadFile;
import ynjh.common.util.ValidateCode;
import ynjh.company.entity.Company;
import ynjh.personal.entity.CompanyList;
import ynjh.personal.entity.Follow;
import ynjh.personal.entity.User;
import ynjh.personal.entity.UserAndResume;
import ynjh.personal.entity.UserCharge;
import ynjh.personal.service.FollowService;
import ynjh.personal.service.UserService;

/**
 * 用户信息的控制器
 * @author 刘志浩 
 */
@Controller
@RequestMapping("/personal/user")
public class UserController {
	@Resource
	private UserService uService;
	@Resource
	private FollowService fService;

	/**
	 * 登录（检测验证码、加密密码） 跳转主页
	 * 
	 * @param userLoginId
	 *            用户名
	 * @param userPassword
	 *            用户密码
	 * @param validateCode
	 *            验证码
	 * @param session
	 *            会话
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(String userLoginId, String userPassword,String re_remember,@RequestParam String validateCode,HttpSession session,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		// 判断
		ValidateCode validate = (ValidateCode) session.getAttribute("codeValidate");
		String value = validate.getvCodeString().toString();
		Date date = new Date();
		Date generateDate = validate.getGenerateTime();
		if ((date.getTime() - generateDate.getTime()) > 450000) {
			mv.setViewName("personal/user/personal_login");// 450000毫秒超时
			mv.addObject("operatorInfo", "验证码超时！");
			return mv;
		}
		if (!(validateCode.equalsIgnoreCase(value))) {
			mv.setViewName("personal/user/personal_login");
			mv.addObject("operatorInfo", "请输入正确的验证码或者密码！");
			System.out.println("验证码输入不正确！！！！！！！！！！！");
		} else {
			String pass = null;
			try {
				pass = MD5Util.md5Encode(userPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}
			User user = uService.login(userLoginId, pass);

			// 验证成功
			if (user == null) {
				mv.addObject("errorInfo", "用户名或密码不正确");
				mv.setViewName("personal/user/personal_login");
			} else {
				// 查看软件人才列表
				List<UserAndResume> userAndResumes = uService.findUserList(1, userLoginId);
				SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");
				for (UserAndResume userAndResume : userAndResumes) {
					Follow follow =fService.findIsFollowByFollowIdAndFollowId(user.getId(), userAndResume.getId());
					if (follow==null) {
						userAndResume.setIsFoucse(false);
					}else {
						userAndResume.setIsFoucse(true);
					}
					try {
						userAndResume.setAge(GetAge.getAgeTools(myFormatter.parse(myFormatter.format(userAndResume.getUserBirthday()))));
						userAndResume.setWorks(GetAge.getAgeTools(myFormatter.parse(myFormatter.format(userAndResume.getResumeWorks()))));
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}
		         if("1".equals(re_remember)){ //"1"表示用户勾选记住密码
		             /*String cookieUserName = Utils.encrypt(name);
		             String cookiePwd = Utils.encrypt(passWord);
		             String loginInfo = cookieUserName+","+cookiePwd;*/
		             String loginInfo = userLoginId+","+userPassword;
		             Cookie userCookie=new Cookie("loginInfo",loginInfo); 

		             userCookie.setMaxAge(30*24*60*60);   //存活期为一个月 30*24*60*60
		             userCookie.setPath("/");
		             response.addCookie(userCookie);
		         }
		         
				session.setAttribute("userAndResumes", userAndResumes);
				session.setAttribute("user", user);
				/* mv.setViewName("personal/user/personal_index"); */
				mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
			}
		}
		return mv;
	}

	/**
	 * 退出 跳转登录 取消会话信息
	 * 
	 * @param session
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "personal/user/personal_login";
	}

	/**
	 * 跳转登录
	 * 
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping("/login")
	public String login() {
		return "personal/user/personal_login";
	}

	/**
	 * 跳转主页
	 * 
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping(value = "/gotoIndex", method = RequestMethod.GET)
	public String gotoIndex(HttpSession session) {
		User user = (User) session.getAttribute("user");
		return "redirect:../common/initIndex?toPage=1&userId=" + user.getId();
	}

	/**
	 * 创建注册用户 跳转登录
	 * 
	 * @param user
	 *            用户信息对象
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ModelAndView addUser(User user) {
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
			mv.addObject("operatorInfo", "注册成功！");
			mv.setViewName("personal/user/personal_login");
		} else {
			mv.addObject("operatorInfo", "注册失败");
			mv.setViewName("personal/user/personal_register");
		}
		return mv;
	}

	/**
	 * 跳转注册
	 * 
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUser() {
		return "personal/user/personal_register";
	}

	/**
	 * 跳转软件人才界面
	 */
	@RequestMapping("/gotoSoft")
	public String gotoSoft() {
		return "personal/user/personal_userlist";
	}

	/**
	 * 跳转名企招聘界面
	 */
	@RequestMapping("/gotoCompany")
	public String gotoCompany(HttpSession session) {
		// 查看企业列表
		User oldUser= (User) session.getAttribute("user");
		List<CompanyList> companyeList = uService.findCompanyList(1);
		for (CompanyList companyList : companyeList) {
			Follow follow =fService.findIsFollowByFollowIdAndFollowId(oldUser.getId(), companyList.getId());
			if (follow==null) {
				companyList.setIsFoucse(false);
			}else {
				companyList.setIsFoucse(true);
			}
		}
		session.setAttribute("companyeList", companyeList);
		return "personal/user/personal_companylist";
	}

	/**
	 * 跳转完善信息页面
	 * 
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping(value = "/addUserOther", method = RequestMethod.GET)
	public String gotoAddUserOther() {
		return "personal/user/personal_register_other";
	}

	/**
	 * 跳转实名认证信息页面
	 * 
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping(value = "/addUserReal", method = RequestMethod.GET)
	public String gotoAddUserReal() {
		return "personal/user/personal_register_real";
	}

	/**
	 * 处理完善用户信息 跳转主页
	 * 
	 * @param user
	 *            用户信息对象
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/addUserOther", method = RequestMethod.POST)
	public ModelAndView addUserOther(User user, MultipartFile files, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User sUser=(User) session.getAttribute("user");
		User oldUser=uService.selectUserById(sUser.getId());
		user.setId(oldUser.getId());
		user.setUserRealName(oldUser.getUserRealName());
		user.setUserHeadImgPath(UploadFile.uploadFile(
				UploadFile.getUserImgPath("/WEB-INF/resources/img/upload/personal", user.getUserLoginId()),
				new MultipartFile[] { files }, session)[0]);
		int result = uService.updateUserOther(user);
		if (result > 0) {
			session.setAttribute("user", user);
			mv.addObject("operatorInfo", "完善资料成功！");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "完善资料失败");
			mv.setViewName("personal/user/personal_register_other");
		}
		return mv;
	}

	/**
	 * 处理实名用户信息 跳转主页
	 * 
	 * @param user
	 *            用户信息对象
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/addUserReal", method = RequestMethod.POST)
	public ModelAndView addUserReal(User user, MultipartFile fileface, MultipartFile filecon, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User sessionUser = (User) session.getAttribute("user");
		User oldUser=uService.selectUserById(sessionUser.getId());
		user.setUserName(oldUser.getUserName());
		user.setId(oldUser.getId());
		user.setUserIDImgFace(UploadFile.uploadFile(
				UploadFile.getUserImgPath("/WEB-INF/resources/img/upload/personal", user.getUserLoginId()),
				new MultipartFile[] { fileface }, session)[0]);
		user.setUserIDImgCon(UploadFile.uploadFile(
				UploadFile.getUserImgPath("/WEB-INF/resources/img/upload/personal", user.getUserLoginId()),
				new MultipartFile[] { filecon }, session)[0]);
		int result = uService.updateUserIDCord(user);
		if (result > 0) {
			session.setAttribute("user", user);
			mv.addObject("operatorInfo", "实名认证成功！");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "实名认证失败");
			mv.setViewName("personal/user/personal_register_real");
		}
		return mv;
	}

	/**
	 * 根据用户id跳转用户修改页面
	 * 
	 * @param id
	 *            用户id
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/findById", method = RequestMethod.GET)
	public ModelAndView findById(Integer id) {
		ModelAndView mv = new ModelAndView();
		User user = uService.selectUserById(id);
		mv.setViewName("personal/user/personal_update_user");
		mv.addObject("user", user);
		return mv;
	}

	/**
	 * 修改用户信息 跳转主页
	 * 
	 * @param user
	 *            用户修改对象
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public ModelAndView updateUser(User user,MultipartFile fileHeadImg, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User oldUser =(User) session.getAttribute("user");
		user.setId(oldUser.getId());
		user.setUserLoginId(oldUser.getUserLoginId());
		user.setUserHeadImgPath(UploadFile.uploadFile(
				UploadFile.getUserImgPath("/WEB-INF/resources/img/upload/personal", oldUser.getUserLoginId()),
				new MultipartFile[] { fileHeadImg }, session)[0]);
		user.setUserRealName(oldUser.getUserRealName());
		int result = uService.updateUser(user);
		if (result > 0) {
			session.setAttribute("user", user);
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "修改失败！");
			mv.setViewName("personal/user/personal_login");
		}
		return mv;
	}

	/**
	 * 跳转到充值界面
	 * 
	 * @param id
	 *            用户id
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/chargeById", method = RequestMethod.GET)
	public ModelAndView chargeById(Integer id) {
		ModelAndView mv = new ModelAndView();
		User user = uService.selectUserById(id);
		mv.setViewName("personal/user/personal_chargemoney");
		mv.addObject("user", user);
		return mv;
	}

	/**
	 * 充值+充值记录 跳蛛主页
	 * 
	 * @param userMoney
	 *            充值的金额
	 * @param id
	 *            用户id
	 * @return
	 * 
	 * 		ModelAndView
	 */
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
			if (remmeber > 0) {
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

	/**
	 * 跳转测试页面
	 * 
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "personal/user/personal_companylist";
	}
	
	@RequestMapping("/ajax")
	@ResponseBody
	public ModelAndView ajax(String page){
		return new ModelAndView(page);
	}

}
