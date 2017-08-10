package ynjh.admin.controller.admin;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
import ynjh.admin.entity.AuditArticle;
import ynjh.admin.entity.AuditComIntro;
import ynjh.admin.entity.AuditOffer;
import ynjh.admin.entity.CompanyVisitCount;
import ynjh.admin.entity.SystemMessage;
import ynjh.admin.entity.UserVisitCount;
import ynjh.admin.service.AdminService;
import ynjh.common.util.MD5Util;
import ynjh.common.util.ValidateCode;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyDetailImg;

import ynjh.company.entity.CompanyRecruit;
import ynjh.company.entity.Offer;

import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Message;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.entity.Work;

/**
 * admin功能Controller
 * 
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	// 验证码字典
	public static final String CHARs = "23456789qwertyupasdfghjkxcvbnm";
	private static Random random = new Random();
	private int width = 90;
	private int height = 40;
	private int codeCount = 4;
	private int lineCount = 7;
	@Resource
	private AdminService adminService;

	/**
	 * 密码重置
	 * 
	 * @author 朱吉
	 * @return
	 */
	@RequestMapping(value = "/forgetpwd", method = RequestMethod.GET)
	public ModelAndView resetPassword() {
		ModelAndView mv = new ModelAndView("admin/resetpwd");
		return mv;
	}

	/**
	 * 密码重置表单提交
	 * 
	 * @author 朱吉
	 * @param adminLoginId
	 *            管理员登录id
	 * @param validateCode
	 *            验证码
	 * @param request
	 *            请求
	 * @return
	 */
	@RequestMapping(value = "/forgetpwd", method = RequestMethod.POST)
	public ModelAndView resetPassword(String adminLoginId, String validateCode, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		ValidateCode validate = (ValidateCode) session.getAttribute("codeValidate");
		String value = null;
		if (validate != null) {
			value = validate.getvCodeString().toString();
		} else {
			mv.setViewName("admin/resetpwd");
			mv.addObject("operatorInfo", "验证码异常！");
			return mv;
		}
		Date date = new Date();
		Date generateDate = validate.getGenerateTime();
		if ((date.getTime() - generateDate.getTime()) > 450000) {
			mv.setViewName("admin/resetpwd");
			mv.addObject("operatorInfo", "验证码超时！");
			return mv;
		}
		if (!(validateCode.equalsIgnoreCase(value))) {
			mv.setViewName("admin/resetpwd");
			mv.addObject("operatorInfo", "请输入正确的验证码或者密码！");
		} else {
			Admin admin = adminService.findLoginByAdminLoginId(adminLoginId);
			if (admin != null) {

			} else {
				mv.setViewName("admin/resetpwd");
			}
		}
		return mv;
	}

	/**
	 * 管理员登录验证
	 * 
	 * @author 曾瑞
	 * @param adminLoginId
	 *            管理员登录
	 * @param adminPassword
	 *            管理员密码
	 * @param validateCode
	 *            验证码
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
	public ModelAndView findLogin(String adminLoginId, String adminPassword, String validateCode, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		ValidateCode validate = (ValidateCode) session.getAttribute("codeValidate");
		String value = null;
		if (validate != null) {
			value = validate.getvCodeString().toString();
		} else {
			mv.setViewName("admin/login");
			mv.addObject("adminLoginId", adminLoginId);
			mv.addObject("operatorInfo", "验证码异常！");
			return mv;
		}
		Date date = new Date();
		Date generateDate = validate.getGenerateTime();
		if ((date.getTime() - generateDate.getTime()) > 45000) {
			mv.setViewName("admin/login");
			mv.addObject("adminLoginId", adminLoginId);
			mv.addObject("operatorInfo", "登录失败,验证码超时！");
			return mv;
		}
		if (!(validateCode.equalsIgnoreCase(value))) {
			mv.setViewName("admin/login");
			mv.addObject("adminLoginId", adminLoginId);
			mv.addObject("operatorInfo", "登录失败,请输入正确的验证码！");
		} else {
			String pass = null;
			try {
				pass = MD5Util.md5Encode(adminPassword);
			} catch (Exception e) {

				e.printStackTrace();
			}
			Admin admin = adminService.findLogin(adminLoginId, pass);
			if (admin != null) {
				if (admin.getAdminStatus() == 0) {
					mv.addObject("adminLoginId", adminLoginId);
					mv.setViewName("admin/login");
					mv.addObject("operatorInfo", "你已被禁用,请联系超级管理员！！！");
					return mv;
				}
				mv.addObject("admin", admin);
				session.setAttribute("admin", admin);
				if (admin.getAdminStatus() == 2) {
					mv.setViewName("admin/superadmin/findAll");
				} else {
					mv.setViewName("admin/index");
				}
			} else {
				mv.addObject("adminLoginId", adminLoginId);
				mv.addObject("operatorInfo", "登录失败，请输入正确的id和密码！");
				mv.setViewName("admin/login");
			}
		}
		return mv;
	}

	/**
	 * 管理员登录请求页面
	 * 
	 * @author 增瑞
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "admin/login";
	}

	/**
	 * 退出系统
	 * 
	 * @author 朱吉
	 * @param session
	 * @return
	 */
	@RequestMapping("/exit") // 退出返回登录页面
	public ModelAndView exit(HttpSession session) {
		session.invalidate();// 结束session
		ModelAndView mv = new ModelAndView("admin/login");
		return mv;
	}

	/**
	 * 查询管理员日志-查询类型选择页面
	 * 
	 * @author 张宇
	 *
	 * @return
	 */
	@RequestMapping("/adminLog")
	public ModelAndView selectAdminLog() {
		ModelAndView mv = new ModelAndView("admin/adminLog");
		return mv;
	}

	/**
	 * 访问管理员日志
	 * 
	 * @author 张宇
	 * @return
	 */
	@RequestMapping(value = "/adminLogAllList", method = RequestMethod.GET) //
	public ModelAndView findAdminLogAll() {
		ModelAndView mv = new ModelAndView("admin/managment/adminLogList");
		return mv;
	}

	/**
	 * 访问管理员日志
	 * 
	 * @author 张宇
	 * @param page
	 *            分页条数
	 * @return
	 */
	@RequestMapping(value = "/adminLogAllList", method = RequestMethod.POST)
	public ModelAndView findAdminLogAll(Integer page) {
		List<AdminLog> adminLogs = adminService.findAdminLogAll(page);
		ModelAndView mv = new ModelAndView("admin/managment/adminLogList");
		mv.addObject("adminLogs", adminLogs);
		return mv;
	}

	@RequestMapping(value = "/adminLog", method = RequestMethod.GET) // 访问管理员日志
	public ModelAndView findAdminLogByTimeAndDoAndId() {
		ModelAndView mv = new ModelAndView("admin/managment/adminLogList");
		return mv;
	}

	@RequestMapping(value = "/adminLog", method = RequestMethod.POST) // 访问管理员日志
	public ModelAndView findAdminLogByTimeAndDoAndId(Integer adminDo, Integer userLoginId, String beginTime,
			String endTime, Integer page) {
		List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndDoAndId(adminDo, userLoginId, beginTime, endTime,
				page);
		ModelAndView mv = new ModelAndView("admin/managment/adminLogList");
		mv.addObject("adminLogs", adminLogs);
		return mv;
	}

	/**
	 * 热门文章查询
	 * 
	 * @author 张宇
	 * @param findBestArticle
	 *            热门文章
	 * @param findCompanyBestArticle
	 *            按企业查询热门文章
	 * @param findPersonBestArticle
	 *            按个人查询热门文章
	 * @param page
	 *            分页条数
	 * @return
	 */
	@RequestMapping(value = "/findBestArticle", method = RequestMethod.GET) // 热门文章查询
	public ModelAndView findBestArticle() {
		// 企业热门文章 List<Article> companyBestArticle =
		// adminService.findCompanyBestArticle();
		List<AuditArticle> personBestArticle = adminService.findPersonBestArticle();// 个人热门文章
		ModelAndView mv = new ModelAndView("admin/managment/findBestArticle");
		// 企业热门文章 mv.addObject("companyBestArticle", companyBestArticle);
		mv.addObject("personBestArticle", personBestArticle);
		return mv;
	}

	/**
	 * 禁用个人用户
	 * 
	 * @author 周富强
	 * @param userId
	 *            个人用户id
	 * @param userStatus
	 *            个人用户状态
	 * @return
	 */
	@RequestMapping("/disableUser")
	public ModelAndView disableUser(Integer userId, Integer userStatus) {
		Integer result = adminService.disableUser(userId, userStatus);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "普通用户禁用成功！");
			mv.addObject("toPage", "findAll");
			mv.setViewName("info");
		} else {
			mv.addObject("operatorInfo", "禁用失败，请联系系统维护人员");
			mv.addObject("toPage", "index");
			mv.setViewName("info");
		}
		return mv;
	}

	/**
	 * 禁用企业用户
	 * 
	 * @author
	 * @param companyId
	 *            企业id
	 * @param companyStatus
	 *            企业用户状态
	 * @return
	 */
	@RequestMapping("/disableCompany")
	public ModelAndView disableCompany(Integer companyId, Integer companyStatus) {
		Integer result = adminService.disableUser(companyId, companyStatus);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "企业用户禁用成功！");
			mv.addObject("toPage", "findAll");
			mv.setViewName("info");
		} else {
			mv.addObject("operatorInfo", "禁用失败，请联系系统维护人员");
			mv.addObject("toPage", "index");
			mv.setViewName("info");
		}
		return mv;
	}

	/**
	 * 禁用个人用户后的（查询）显示效果
	 * 
	 * @author 周富强
	 * @param page
	 *            偏移量
	 * @return
	 */
	@RequestMapping("/findUser/{page}")
	public ModelAndView findUser(@PathVariable Integer page) {
		List<User> findUser = adminService.findUser(page);
		int maxPage = adminService.findMaxPage();
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("findUser", findUser);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		return mv;
	}

	/**
	 * 禁用企业用户后的（查询）显示效果
	 * 
	 * @author 周富强
	 * @param page
	 *            偏移量
	 * @return
	 */
	@RequestMapping("/findCompany/{page}")
	public ModelAndView findCompany(@PathVariable Integer page) {
		List<Company> findCompany = adminService.findCompany(page);
		int maxPage = adminService.findMaxPage();
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("findCompany", findCompany);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		return mv;
	}

	/**
	 * 访问管理员的信息维护界面
	 * 
	 * @author 朱吉
	 * 
	 * @return
	 */
	@RequestMapping(value = "/maIntegerainAdmin", method = RequestMethod.GET)
	public ModelAndView maIntegerainAdmin(HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		ModelAndView mv = new ModelAndView("admin/update/adminUpdate");
		mv.addObject("admin", admin);
		return mv;
	}

	/**
	 * 登录的管理员，自我信息修改
	 * 
	 * @author
	 * @param adminName
	 *            管理员实际姓名
	 * @param adminTel
	 *            管理员电话
	 * @param adminEmail
	 *            管理员电子邮件
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/maIntegerainAdmin", method = RequestMethod.POST)
	public ModelAndView maIntegerainAdmin(String adminName, String adminTel, String adminEmail, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		Admin adminFalse = admin;
		admin.setAdminName(adminName);
		admin.setAdminEmail(adminEmail);
		admin.setAdminTel(adminTel);

		Integer result = adminService.maIntegerainAdmin(admin);
		ModelAndView mv = new ModelAndView();
		if (result >= 1) {
			mv.addObject("operatorInfo", "信息修改成功！");
			mv.setViewName("admin/update/adminUpdate");
			mv.addObject("admin", admin);
		} else {
			mv.addObject("operatorInfo", "修改失败！");
			mv.setViewName("admin/update/adminUpdate");
			mv.addObject("admin", adminFalse);
		}
		return mv;
	}

	/**
	 * 通过用户id查看修改后的内容
	 * 
	 * @author 朱吉
	 * @param id
	 *            用户id
	 * @return
	 */
	@RequestMapping("/findUpdante")
	public ModelAndView findByAdminId(@PathVariable Integer id) {
		List<Admin> findByAdminId = adminService.findByAdminId(id);
		ModelAndView mv = new ModelAndView("update");
		mv.addObject("findByAdminId", findByAdminId);
		return mv;
	}

	/**
	 * 查询审核简历
	 * 
	 * @author 周富强
	 * @param page
	 *            偏移量
	 * @return
	 */
	@RequestMapping("/findAuditResume/{page}")
	public ModelAndView findAuditResume(@PathVariable Integer page) {
		List<Resume> resumes = adminService.findAuditResume(page);
		ModelAndView mv = new ModelAndView();
		mv.addObject("resume", resumes);
		mv.addObject("page", page);
		mv.setViewName("admin/audit/auditResume");
		return mv;
	}

	/**
	 * 
	 * @Name: findAuditArticle // 查询审核文章
	 * @Description: @param page 偏移量
	 * @Description: @return
	 * @Author:曾瑞（作者）
	 * @Version: V1.00 （版本号）
	 * @Create Date: 2017年4月21日上午10:48:30
	 * @Parameters: AdminController
	 * @Return: ModelAndView
	 */
	@RequestMapping("/findAuditArticle/{page}")
	public ModelAndView findAuditArticle(@PathVariable Integer page) {
		List<AuditArticle> articles = adminService.findAuditArticle(null);
		ModelAndView mv = new ModelAndView();
		mv.addObject("article", articles);
		mv.addObject("page", page);
		mv.setViewName("admin/audit/auditArticle");
		return mv;
	}

	/**
	 * 查询审核企业资质 暂时停止该路径的使用
	 * 
	 * @author 周富强
	 * @return
	 */
	/*
	 * @RequestMapping("/findAuditCompany") public ModelAndView
	 * findAuditCompany(Integer page) { List<Company> company =
	 * adminService.findAuditCompany(page); ModelAndView mv = new
	 * ModelAndView("admin/auditCompany"); mv.addObject("company", company);
	 * mv.setViewName("admin/auditCompany"); return mv; }
	 */

	/**
	 * 查询审核个人企业互评论
	 * 
	 * @author 周富强
	 * @return
	 */
	@RequestMapping("/findAuditCommentsCompanyAndPeople/{page}")
	public ModelAndView findAuditCommentsCompanyAndPeople(@PathVariable Integer page) {
		List<Discuss> discuss = adminService.findAuditCommentsCompanyAndPeople(page);
		ModelAndView mv = new ModelAndView("admin/audit/auditDiscuss");
		mv.addObject("discuss", discuss);
		mv.setViewName("admin/audit/auditDiscuss");
		return mv;
	}

	/**
	 * 查询审核新闻
	 * 
	 * @author 周富强
	 * @return
	 */
	@RequestMapping("/auditNews/{page}")
	public ModelAndView findAuditInfo(@PathVariable Integer page) {
		List<AuditArticle> articles = adminService.findAuditComArticle(page);
		ModelAndView mv = new ModelAndView("admin/auditNews");
		mv.addObject("articles", articles);
		mv.setViewName("admin/audit/auditComArticle");
		return mv;
	}

	/**
	 * 查询审核offer
	 * 
	 * @author 周富强
	 * @return
	 */
	@RequestMapping("/findAuditOffer/{page}")
	public ModelAndView findAuditOffer(@PathVariable Integer page) {
		List<AuditOffer> auditOffer = adminService.findAuditOffer(page);
		ModelAndView mv = new ModelAndView("admin/auditOffer");
		mv.addObject("auditOffer", auditOffer);
		mv.setViewName("admin/audit/auditOffer");
		return mv;
	}

	/**
	 * 查询审核招聘信息
	 * 
	 * @author 周富强
	 * @return
	 */
	@RequestMapping("/recruit_find_all/{page}")
	public ModelAndView findAllRecruit(@PathVariable Integer page) {
		List<CompanyRecruit> companyRecruits = adminService.findAllRecruit(null);
		ModelAndView mv = new ModelAndView("admin/audit/recruit_index");
		mv.addObject("companyRecruits", companyRecruits);
		return mv;
	}

	/**
	 * 
	 * @Name: auditResume //审核简历
	 * @Description: @param id 简历ID
	 * @Description: @param resumeStatusThree 简历待审核状态
	 * @Description: @return
	 * @Author: 曾瑞（作者）
	 * @Version: V1.00 （版本号）
	 * @Create Date: 2017年4月21日上午11:34:54
	 * @Parameters: AdminController
	 * @Return: ModelAndView
	 */
	@RequestMapping("/auditResume/{id}/{resumeStatusThree}")
	public ModelAndView auditResume(@PathVariable Integer id, @PathVariable Integer resumeStatusThree) {
		int result = adminService.auditResume(id, resumeStatusThree);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("result", result);
			mv.setViewName("admin/audit/auditResume");
		} else {
			mv.setViewName("admin/audit/auditResume");
		}
		return mv;
	}

	/**
	 * 审核文章
	 * 
	 * @author 周富强
	 * @param articleId
	 *            文章id
	 * @param articleStatus
	 *            信息状态
	 * @return
	 */
	@RequestMapping("/auditArticle/{articleId}/{articleStatus}/{articleUsersType}")
	public ModelAndView auditArticle(@PathVariable Integer articleId, @PathVariable Integer articleStatus,
			@PathVariable Integer articleUsersType) {
		int result = adminService.auditArticle(articleId, articleStatus);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			if(articleUsersType==2){
				mv.setViewName("admin/audit/auditArticle");
			}else if(articleUsersType==1){
				mv.setViewName("admin/audit/auditComArticle");
			} else {
				mv.setViewName("admin/index");
			}
		} else {
			mv.addObject("info", "审核失败,未能找到审核文章");
			mv.setViewName("admin/audit/auditArticle");
		}
		return mv;
	}

	/**
	 * 
	 * 审核文章评论
	 * 
	 * @author 周富强
	 * @param id
	 *            文章评论id
	 * @param commentArticleStatus
	 *            文章评论审核状态
	 * @return
	 */
	@RequestMapping("/auditCommentsArticle")
	@ResponseBody
	public String auditCommentsArticle(Integer[] id, Integer commentArticleStatus) {
		int result = adminService.auditCommentsArticle(id, commentArticleStatus);
		String commentResult = "";
		if (result > 0) {
			commentResult = "true";
		} else {
			commentResult = "false";
		}
		return commentResult;
	}

	/**
	 * 审核企业资质
	 * 
	 * @author 周富强
	 * @param companyId
	 *            企业id
	 * @param cmpIntegerStatus
	 *            企业发表待审核状态
	 * @return
	 */
	@RequestMapping("/auditCompany/{id}/{companyStatus}")
	@ResponseBody
	public String auditCompany(@PathVariable Integer id, @PathVariable Integer companyStatus) {
		int result = adminService.auditCompany(id, companyStatus);
		if (result > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 审核个人企业互评
	 * 
	 * @author 周富强
	 * @param id
	 *            个人企业互评id
	 * @param discussStatus
	 *            待审核状态
	 * @return
	 */
	@RequestMapping("/auditCommentsCompanyAndPeople")
	@ResponseBody
	public String auditCommentsCompanyAndPeople(Integer[] id, Integer discussStatus) {
		int result = adminService.auditCommentsCompanyAndPeople(id, discussStatus);
		if (result > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 审核新闻
	 * 
	 * @author 周富强
	 * @param InfoId
	 *            新闻id
	 * @param cmpInfStatus
	 *            待审核状态
	 * @return
	 */
	@RequestMapping("/auditInfo")
	public ModelAndView auditInfo(Integer id, Integer messageSendStatus) {
		int result = adminService.auditInfo(id, messageSendStatus);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "审核成功");
			mv.setViewName("admin/auditSuccess");
		} else {
			mv.addObject("operatorInfo", "审核失败");
			mv.setViewName("admin/auditSuccess");
		}
		return mv;
	}

	/**
	 * 审核offer
	 * 
	 * @author 周富强
	 * @param id
	 *            offer的id
	 * @param offerType
	 * @return
	 */
	@RequestMapping("/auditOffer") // 审核offer
	@ResponseBody
	public String auditOffer(Integer[] ids, Integer offerStatus) {

		int result = adminService.auditOffer(ids, offerStatus);
		if (result > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 
	 * 
	 * @author 周富强
	 * @param recruitmentId
	 *            招聘信息id
	 * @param cmpRecStatus
	 * @return
	 */
	/**
	 * 牟勇：审核招聘信息，支持批量审核<br />
	 * 状态值：1."待审核",2."审核通过",3."审核不通过",4."已删除"，5."停止招聘"<br />
	 * 如果是通过审核，则写入UserRecord表，标志开始招聘时间，开始扣费(由Service实现)
	 * @param recruitId 招聘信息的主键
	 * @param recruitStatus 要更改的状态值
	 * @param toPage 要跳转的页面
	 * @return 如果是recruit_index提交过来的，则返回recruit_index，如果是recruit_detail提交的就返回recruit_detail
	 */
	@RequestMapping("/recruit_audit") // 审核招聘信息
	public ModelAndView auditRecruitment(Integer[] recruitId, Integer recruitStatus,String toPage,HttpSession session) {
		ModelAndView mv=new ModelAndView(toPage);
		Admin admin=(Admin)session.getAttribute("admin");
		adminService.updateAuditRecruit(recruitId, recruitStatus,admin.getId());
		return mv;
	}

	/**
	 * 企业访问量统计--添加记录
	 * 
	 * @author
	 * @param id
	 *            id
	 * @param companyYear
	 *            年
	 * @param companyMoth
	 *            月
	 * @param companyDay
	 *            日
	 * @param companyResumeCount
	 *            发表招聘信息数统计
	 * @param companyInfoCount
	 *            发表文章数统计
	 * @param companyId
	 *            企业id
	 * @return
	 */
	@RequestMapping("/addcompanyVisitCount")
	public ModelAndView addcompanyVisitCount(Integer id, Integer companyYear, Integer companyMoth, Integer companyDay,
			Integer companyResumeCount, Integer companyInfoCount, Integer companyId) {
		Integer result = adminService.addCompanyVisitCount(id, companyYear, companyMoth, companyDay, companyResumeCount,
				companyId, companyInfoCount);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("", "成功");
			mv.addObject("", "");
			mv.setViewName("");
		} else {
			mv.addObject("", "失败");
			mv.addObject("", "");
			mv.setViewName("");
		}
		return mv;
	}

	/**
	 * 企业访问量统计--修改访问数
	 * 
	 * @author 朱吉
	 * @param companyVisitCount
	 *            企业访问量统计
	 * @return
	 */
	@RequestMapping("/updatecompanyVisitCount") // 企业访问量统计--修改访问数
	public ModelAndView updatecompanyVisitCount(CompanyVisitCount companyVisitCount) {
		Integer result = adminService.updatecompanyVisitCount(companyVisitCount);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("", "成功");
			mv.addObject("", "");
			mv.setViewName("");
		} else {
			mv.addObject("", "失败");
			mv.addObject("", "");
			mv.setViewName("");
		}
		return mv;
	}

	/**
	 * 企业访问量统计--显示所有访问数
	 * 
	 * @author 朱吉
	 * @param page
	 *            偏移量
	 * @return
	 */
	@RequestMapping("/findAll")
	public ModelAndView findAll(Integer page) {
		List<CompanyVisitCount> result = adminService.findAll(page);
		ModelAndView mv = new ModelAndView("");
		mv.addObject("result", result);
		return mv;
	}

	/**
	 * 企业访问量统计--通过企业id查询企业访问量
	 * 
	 * @author
	 * @param companyId
	 *            企业id
	 * @param page
	 * @return
	 */
	@RequestMapping("/findCompanyId")
	public ModelAndView findCompanyId(Integer companyId, Integer page) {
		List<CompanyVisitCount> result = adminService.findCompanyId(companyId, page);
		ModelAndView mv = new ModelAndView("");
		mv.addObject("result", result);

		return mv;
	}

	/**
	 * 企业访问量统计--获得信息量的最大值
	 * 
	 * @author
	 * @return
	 */
	@RequestMapping("/getMaxRecord")
	public ModelAndView getMaxRecord() {
		Integer result = adminService.getMaxRecord();
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("", "成功");
			mv.addObject("", "");
			mv.setViewName("");
		} else {
			mv.addObject("", "失败");
			mv.addObject("", "");
			mv.setViewName("");
		}
		return mv;
	}

	/**
	 * 企业访问量统计--查找发表信息的数量和发表简历的数量
	 * 
	 * @author
	 * @param companyYear
	 *            年
	 * @param companyMonth
	 *            月
	 * @param companyDay
	 *            日
	 * @param companyId
	 *            企业id
	 * @param page
	 *            偏移量
	 * @return
	 */
	@RequestMapping("/findcompanyInfoCountAndcompanyResumeCount")
	public ModelAndView findcompanyInfoCountAndcompanyResumeCount(Integer companyYear, Integer companyMonth,
			Integer companyDay, Integer companyId, Integer page) {
		List<CompanyVisitCount> result = adminService.findcompanyInfoCountAndcompanyResumeCount(companyYear,
				companyMonth, companyDay, companyId, page);
		ModelAndView mv = new ModelAndView("");
		mv.addObject("result", result);
		return mv;
	}

	/**
	 * 增加个人用户访问统计数
	 * 
	 * @author 朱吉
	 * @param userYear
	 *            年
	 * @param userMonth
	 *            月
	 * @param UserDay
	 *            日
	 * @param userCommentCount
	 *            评论条数
	 * @param userArticleCount
	 *            发表文章条数
	 * @param userId
	 *            个人用户id
	 * @return
	 */
	@RequestMapping("/addUserVisitCount")
	public ModelAndView addUserVisitCount(Integer userYear, Integer userMonth, Integer UserDay,
			Integer userCommentCount, Integer userArticleCount, Integer userId) {
		Integer result = adminService.addUserVisitCount(userYear, userMonth, UserDay, userCommentCount,
				userArticleCount, userId);
		ModelAndView mv = new ModelAndView();
		if (result != null && result > 0) {
			mv.addObject("", "添加用户访问统计成功!");
			mv.setViewName("");
		} else {
			mv.addObject("", "添加用户访问统计失败!");
			mv.setViewName("");
		}
		return mv;
	}

	/**
	 * 查找所有个人用户访问量统计记录
	 * 
	 * @author 朱吉
	 * @param page
	 *            偏移量
	 * @return
	 */
	@RequestMapping("/findUserVisitAll")
	public ModelAndView findUserVisitCount(Integer page) {
		List<UserVisitCount> list = adminService.findUserVisitAll(page);
		ModelAndView mv = new ModelAndView();
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.setViewName("");
		} else if (list == null) {
			mv.addObject("", "查询失败！请联系管理员");
			mv.setViewName("");
		} else if (list.size() == 0) {
			mv.addObject("", "没有数据被找到!");
			mv.setViewName("");
		}
		return mv;
	}

	/**
	 * 按条件查找个人用户访问量统计记录
	 * 
	 * @author 朱吉
	 * @param page
	 *            偏移量
	 * @param userYear
	 *            年
	 * @param userMonth
	 *            月
	 * @param userDay
	 *            日
	 * @param userId
	 *            个人用户id
	 * @return
	 */
	@RequestMapping("/findUserVisitCount")
	public ModelAndView findUserVisitCount(Integer page, Integer userYear, Integer userMonth, Integer userDay,
			Integer userId) {
		List<UserVisitCount> list = adminService.findCount(page, userYear, userMonth, userDay, userId);
		ModelAndView mv = new ModelAndView();
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.setViewName("");
		} else if (list == null) {
			mv.addObject("", "查询失败！请联系管理员");
			mv.setViewName("");
		} else if (list.size() == 0) {
			mv.addObject("", "没有数据被找到!");
			mv.setViewName("");
		}
		return mv;
	}

	/**
	 * 审核--查询审核简历ById
	 * 
	 * @author 周富强
	 * @param id
	 *            简历id
	 * @return
	 */
	@RequestMapping("/findAuditResumeById")
	public ModelAndView findAuditResumeById(int id) {
		Resume resume = adminService.findAuditResumeById(id);
		User user = new User();
		if (resume != null) {
			user = adminService.findUserById(resume.getUserId());
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeOwner", user);
		mv.addObject("resume", resume);
		mv.setViewName("admin/auditing/auditingResume");
		return mv;
	}

	/**
	 * 查询审核文章ById
	 * 
	 * @author 周富强
	 * @param id
	 *            文章id
	 * @return
	 */
	@RequestMapping("/findAuditArticleById")
	public ModelAndView findAuditArticleById(Integer id) {
		AuditArticle articles = adminService.findAuditArticleById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("article", articles);
		mv.setViewName("admin/auditing/auditingArticle");
		return mv;
	}

	/**
	 * 
	 * @Name: findAuditCommentsArticle // 查询审核文章评论
	 * @Description: @param page 偏移量
	 * @Description: @return
	 * @Author: 曾瑞（作者）
	 * @Version: V1.00 （版本号）
	 * @Create Date: 2017年4月21日上午10:49:12
	 * @Parameters: AdminController
	 * @Return: ModelAndView
	 */
	@RequestMapping("/findAuditCommentsArticle/{page}")
	public ModelAndView findAuditCommentsArticle(@PathVariable Integer page) {
		List<CommentArticle> commentarticles = adminService.findAuditCommentsArticle(page);
		ModelAndView mv = new ModelAndView();
		mv.addObject("commentarticle", commentarticles);
		mv.addObject("page", page);
		mv.setViewName("admin/audit/auditArticleComment");
		return mv;
	}

	/**
	 * 查询审核企业资质ById
	 * 
	 * @author 周富强
	 * @param id
	 *            企业简介id
	 * @return
	 */
	@RequestMapping("/findAuditCompanyById")
	public ModelAndView findAuditCompanyById(Integer id) {
		Company company = adminService.findAuditCompanyById(id);
		ModelAndView mv = new ModelAndView("admin/auditing/auditCompany");
		mv.addObject("company", company);
		mv.setViewName("admin/auditing/auditCompany");
		return mv;
	}

	/**
	 * 查询审核个人企业互评论ById
	 * 
	 * @author 周富强
	 * @param id
	 *            个人企业互评id
	 * @return
	 */
	@RequestMapping("/findAuditCommentsCompanyAndPeopleById")
	public ModelAndView findAuditCommentsCompanyAndPeopleById(Integer id) {
		Discuss discuss = adminService.findAuditCommentsCompanyAndPeopleById(id);
		ModelAndView mv = new ModelAndView("admin/auditing/auditCompanyComment");
		mv.addObject("discuss", discuss);
		mv.setViewName("admin/auditing/auditCompanyComment");
		return mv;
	}

	/**
	 * 查询审核新闻ById
	 * 
	 * @author 周富强
	 * @param id
	 * @return
	 */
	@RequestMapping("/findAuditInfoById")
	public ModelAndView findAuditInfoById(Integer id) {
		Message message = adminService.findAuditInfoById(id);
		ModelAndView mv = new ModelAndView("admin/auditing/auditNews");
		mv.addObject("message", message);
		mv.setViewName("admin/auditing/auditNews");
		return mv;
	}

	/**
	 * 查询审核offer的id
	 * 
	 * @author 周富强
	 * @param id
	 *            offer的id
	 * @return
	 */
	@RequestMapping("/findAuditOfferById")
	public ModelAndView findAuditOfferById(Integer id) {
		Offer offer = adminService.findAuditOfferById(id);
		ModelAndView mv = new ModelAndView("admin/auditing/auditOffer");
		mv.addObject("offer", offer);
		mv.setViewName("admin/auditing/auditOffer");
		return mv;
	}

	/**
	 * 根据招聘信息的Id查询指定的招聘信息
	 * @author 周富强
	 * @param id 招聘信息的id
	 * @return
	 */
	@RequestMapping("/find_recruit/{id}")
	public ModelAndView findCompanyRecruitById(@PathVariable Integer id) {
		CompanyRecruit companyRecruit = adminService.findCompanyRecruitById(id);
		ModelAndView mv = new ModelAndView("admin/auditing/recruit_detail");
		mv.addObject("companyRecruit", companyRecruit);
		return mv;
	}

	/**
	 * 查询最佳企业
	 * 
	 * @author 朱吉
	 * @return
	 */
	@RequestMapping("/bestCompany") // 查询最佳企业
	public ModelAndView findBestCompany() {
		ModelAndView mv = new ModelAndView("admin/managment/bestCompany");
		List<Company> bestCompanyList = (List<Company>) adminService.findBestCompany();
		mv.addObject("bestCompanyList", bestCompanyList);
		return mv;

	}

	/**
	 * 
	 * @Name: messagePush
	 * @Description: @param id 消息ID
	 * @Description: @param sysmContent 消息内容
	 * @Description: @param sysmCreateTime 时间
	 * @Description: @param systmScope 工作范围
	 * @Description: @return
	 * @Author: 曾瑞（作者）
	 * @Version: V1.00 （版本号）
	 * @Create Date: 2017年4月26日上午11:09:17
	 * @Parameters: AdminController
	 * @Return: ModelAndView
	 */
	@RequestMapping(value = "/messagePush", method = RequestMethod.POST)
	public ModelAndView messagePush(SystemMessage systemMessage, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		systemMessage.setAdminId(admin.getId());
		systemMessage.setSysmCreateTime(new Timestamp(System.currentTimeMillis()));
		systemMessage.setSysmContent(systemMessage.getSysmContent().trim());
		int result = adminService.addMessage(systemMessage);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("result", result);
			mv.setViewName("admin/managment/adminAddMessage");
		}else{
			mv.addObject("result",result);
			mv.setViewName("admin/managment/adminAddMessage");
		}
		return mv;
	}

	/**
	 * 
	 * @Name: addMessage
	 * @Description: @return 消息页面跳转
	 * @Author: 曾瑞（作者）
	 * @Version: V1.00 （版本号）
	 * @Create Date: 2017年4月26日下午2:01:08
	 * @Parameters: AdminController
	 * @Return: String
	 */
	@RequestMapping("/addMessage")
	public String addMessage(){
		return "admin/managment/adminAddMessage";

	}

	/**
	 * 审核简历查找工作经历
	 * 
	 * @author 朱吉
	 * @param resumeId
	 *            简历表id
	 * @return
	 */
	@RequestMapping("/work")
	public ModelAndView showWork(String resumeId) {
		List<Work> works = adminService.findResumeWork(resumeId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("works", works);
		mv.setViewName("admin/auditing/auditingResume");
		return mv;
	}

	/**
	 * 查找项目经历
	 * 
	 * @author 朱吉
	 * @param resumeId
	 *            简历id
	 * @return
	 */
	@RequestMapping("/project")
	public ModelAndView showProject(String resumeId) {
		List<Project> projects = adminService.findResumeProject(resumeId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("projects", projects);
		mv.setViewName("admin/auditing/auditingResume");
		return mv;
	}

	/**
	 * 查找简历培训经历
	 * 
	 * @author 朱吉
	 * @param resumeId
	 * @return
	 */
	@RequestMapping("/edu")
	public ModelAndView showEducation(String resumeId) {
		List<Education> edus = adminService.findResumeEducation(resumeId);
		ModelAndView mv = new ModelAndView();
		if (edus == null) {
			edus = new ArrayList<Education>();
		}
		mv.addObject("edus", edus);
		mv.setViewName("admin/auditing/auditingResume");
		return mv;
	}

	/**
	 * 查找审核企业
	 * 
	 * @author 朱吉
	 * @param page
	 *            偏移量
	 */
	@RequestMapping("/findCompanyIntro/{page}")
	public ModelAndView findCompanyIntro(@PathVariable Integer page) {
		List<AuditComIntro> companyIntro = adminService.findCompanyIntro(page);
		ModelAndView mv = new ModelAndView();
		if (companyIntro != null) {
			mv.addObject("companyIntro", companyIntro);
			mv.setViewName("admin/audit/auditComIntro");
		} else {
			mv.addObject("companyIntro", null);
			mv.setViewName("admin/audit/auditComIntro");
		}
		return mv;
	}

	/**
	 * 通过id找到企业审核
	 * 
	 * @author 朱吉
	 * 
	 */
	@RequestMapping("/findAuditComById/{id}")
	public ModelAndView findAuditComById(@PathVariable Integer id) {
		AuditComIntro auditComIntro = adminService.findAuditComById(id);
		ModelAndView mv = new ModelAndView("admin/auditing/auditingCompany");
		if (auditComIntro != null) {
			Integer CompanyId = auditComIntro.getId();
			List<CompanyDetailImg> detailImgs = adminService.findCompanyImgById(CompanyId);
			mv.addObject("auditComIntro", auditComIntro);
			mv.addObject("detailImgs", detailImgs);
		} else {
			mv.addObject("auditComIntro", null);
		}
		return mv;
	}

	/**
	 * 审核企业基本信息
	 * 
	 * @author 朱吉
	 * @param companyId
	 *            企业表中的id号
	 * @param cmpIntStatus
	 *            企业基本信息的审核状态
	 */
	@RequestMapping("/auditCompanyInfo/{companyid}/{cmpIntStatus}")
	@ResponseBody
	public String auditCompanyInfo(@PathVariable Integer companyId, @PathVariable Integer cmpIntStatus) {
		Integer result = adminService.auditCompanyInfo(companyId, cmpIntStatus);
		if (result != null && result > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 获取验证码
	 * 
	 * @author 朱吉
	 * @param time
	 *            验证码生成时间
	 * @param request
	 *            验证码请求
	 * @param response
	 *            验证码响应
	 */
	@RequestMapping("/codeValidate")
	public void getCode(String time, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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

		// 验证码生成时间设置
		ValidateCode validate = new ValidateCode();
		Date date = new Date();
		try {
			long l = Long.parseLong(time);
			date.setTime(l);
			validate.setvCodeString(buiderCode);
			validate.setGenerateTime(date);
		} catch (Exception e) {
			validate.setvCodeString(buiderCode);
			validate.setGenerateTime(date);
		}

		// 将validate保存到session中

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
}
