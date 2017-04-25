package ynjh.personal.controller.user;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.util.MD5Util;
import ynjh.personal.entity.User;
import ynjh.personal.entity.UserCharge;
import ynjh.personal.entity.Validate;
import ynjh.personal.service.UserService;
/**
 * 
 * @author dage
 * 用户信息的控制器
 */
@Controller
@RequestMapping("/personal/user")
public class UserController {
	@Resource
	private UserService uService;
	/**
	 * 登录（检测验证码、加密密码） 跳转主页 
	 * @param userLoginId 用户名
	 * @param userPassword 用户密码
	 * @param validateCode 验证码
	 * @param session 会话
	 * @return 
	 * ModelAndView
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(String userLoginId, String userPassword,@RequestParam String validateCode, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MD5Util md5=new MD5Util();
		String pass=null;
		try {
			pass=md5.md5Encode(userPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		User user = uService.login(userLoginId, pass);
		
		//判断
		Validate validate = (Validate) session.getAttribute("codeValidate");
		String value = validate.getvCodeString().toString();
		Date date=new Date();
		Date generateDate=validate.getGenerateTime();
		if((date.getTime()-generateDate.getTime())>450000){
			mv.setViewName("personal/user/personal_login");//450000毫秒超时
			mv.addObject("operatorInfo", "验证码超时！");
			return mv;
		}
		if (!(validateCode.equalsIgnoreCase(value))) {
			mv.setViewName("personal/user/personal_login");
			mv.addObject("operatorInfo", "请输入正确的验证码或者密码！");
		}else{
			//验证成功
		}
		
		if (user == null) {
			mv.addObject("errorInfo", "用户名或密码不正确");
			mv.setViewName("personal/user/personal_login");
		} else {
			session.setAttribute("user", user);
			mv.addObject("user", user);
			/*mv.setViewName("personal/user/personal_index");*/
			mv.setViewName("redirect:../article/lookArticleList?toPage=1&userId="+user.getId());
		}
		return mv;
	}

	/**
	 * 退出 跳转登录 取消会话信息
	 * @param session 
	 * @return 
	 * 
	 * String
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "personal/user/personal_login";
	}
	/**
	 * 跳转登录
	 * @return
	 * 
	 * String
	 */
	@RequestMapping("/login")
	public String login() {
		return "personal/user/personal_login";
	}

	/**
	 * 跳转主页
	 * @return
	 * 
	 * String
	 */
	@RequestMapping(value = "/gotoIndex", method = RequestMethod.GET)
	public String gotoIndex() {
		return "personal/user/personal_index";
	}

	/**
	 * 创建注册用户 跳转登录
	 * @param user 用户信息对象
	 * @return
	 * 
	 * ModelAndView
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
	 * @return
	 * 
	 * String
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUser() {
		return "personal/user/personal_register";
	}
	/**
	 * 跳转完善信息页面
	 * @return
	 * 
	 * String
	 */
	@RequestMapping(value = "/addUserOther", method = RequestMethod.GET)
	public String gotoAddUserOther(){
		return "personal/user/personal_register_other";
	}
	/**
	 * 跳转实名认证信息页面
	 * @return
	 * 
	 * String
	 */
	@RequestMapping(value = "/addUserReal", method = RequestMethod.GET)
	public String gotoAddUserReal(){
		return "personal/user/personal_register_real";
	}

	/**
	 * 处理完善用户信息 跳转主页
	 * @param user 用户信息对象
	 * @return
	 * 
	 * ModelAndView
	 */
	@RequestMapping(value = "/addUserOther", method = RequestMethod.POST)
	public ModelAndView addUserOther(User user) {
		ModelAndView mv = new ModelAndView();
		int result = uService.updateUserOther(user);
		if (result > 0) {
			mv.addObject("user", user);
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
	 * @param user 用户信息对象
	 * @return
	 * 
	 * ModelAndView
	 */
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
			mv.setViewName("personal/user/personal_register_real");
		}
		return mv;
	}

	/**
	 * 根据用户id跳转用户修改页面
	 * @param id 用户id
	 * @return
	 * 
	 * ModelAndView
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
	 * @param user 用户修改对象
	 * @return
	 * 
	 * ModelAndView
	 */
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

	/**
	 * 跳转到充值界面
	 * @param id 用户id
	 * @return
	 * 
	 * ModelAndView
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
	 * @param userMoney 充值的金额
	 * @param id 用户id 
	 * @return
	 * 
	 * ModelAndView
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

	/**
	 * 跳转测试页面
	 * @return
	 * 
	 * String
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "personal/user/test";
	}
	
	
	/**
	 * 获取验证码
	 * @author 朱吉
	 * @param time 验证码生成时间
	 * @param request 验证码请求
	 * @param response 验证码响应
	 */
	 //验证码字典
	public static final String CHARs = "qqqq";
	private static Random random = new Random();
	private int width = 90;
	private int height = 40;
	private int codeCount = 4;
	private int lineCount = 7;
	
	@RequestMapping("/codeValidate")
	public void getCode(String time, HttpServletRequest request, HttpServletResponse response) {
		// 储存验证码的类
		StringBuilder buiderCode = new StringBuilder();
		// 定义画布
		BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// 得到画笔
		Graphics g = buffImg.getGraphics();
		// 设置颜色,,画边框
		g.setColor(Color.black);
		g.drawRect(0, 0, width, height);
		// 设置颜色，内部填充
		g.setColor(Color.white);
		g.fillRect(1, 1, width - 2, height - 2);
		// 设置干扰线
		for (int i = 0; i < lineCount; i++) {
			g.setColor(Color.getHSBColor(random.nextFloat(), random.nextFloat(), random.nextFloat()));
			g.drawOval(random.nextInt(width), random.nextInt(height), random.nextInt(50), random.nextInt(50));

			g.drawLine(random.nextInt(width), random.nextInt(height), random.nextInt(width), random.nextInt(height));
		}
		// 设置验证码
		Font font = new Font("Times New Roman", Font.PLAIN, 22);
		g.setColor(Color.blue);
		for (int i = 0; i < codeCount; i++) {
			char c = CHARs.charAt(random.nextInt(CHARs.length() - 1));
			buiderCode.append(c);
			g.setFont(font);
			g.drawString(c + "", 15 + (i * 17), random.nextInt(30) % (30 - 20 + 1) + 20);
		}

		// 禁止图像缓存
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-che");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/png");

		//验证码生成时间设置
		Validate validate=new Validate();
		Date date=new Date();
		try{
			long l=Long.parseLong(time);
			date.setTime(l);
			validate.setvCodeString(buiderCode);
			validate.setGenerateTime(date);
		}catch(Exception e){
			validate.setvCodeString(buiderCode);
			validate.setGenerateTime(date);
		}
		
		//将validate保存到session中
		HttpSession session = request.getSession();
		session.setAttribute("codeValidate", validate);
										
		// 输出到屏幕
		ServletOutputStream sos = null;
		try {
			sos = response.getOutputStream();
			ImageIO.write(buffImg, "png", sos);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 关闭输出流
		try {
			sos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
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
