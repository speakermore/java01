package ynjh.admin.controller.admin;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
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
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
import ynjh.admin.entity.CompanyVisitCount;
import ynjh.admin.entity.UserVisitCount;
import ynjh.admin.service.AdminService;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyRecruit;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.Message;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;

@Controller
@RequestMapping("/admin")
public class AdminController {
	public static final String CHARs = "qqqq";
	private static Random random = new Random();
	private int width = 90;
	private int height = 40;
	private int codeCount = 4;
	private int lineCount = 7;
	@Resource
	private AdminService adminService;
	
	/**
	 * @author 朱吉
	 * @return
	 */
	@RequestMapping(value="/forgetpwd",method=RequestMethod.GET)
	public ModelAndView resetPassword(){
		ModelAndView mv=new ModelAndView("admin/resetpwd");
		return mv;
	}

	/**
	 * @author 曾瑞
	 * @param adminLoginId 用户登录
	 * @param adminPassword
	 * @param validateCode
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
	public ModelAndView findLogin(String adminLoginId, String adminPassword, String validateCode, HttpSession session) {

		StringBuilder codevalidate = (StringBuilder) session.getAttribute("codeValidate");
		String value = codevalidate.toString();

		ModelAndView mv = new ModelAndView();
		if (!(validateCode.equals(value))) {
			mv.setViewName("admin/login");
			mv.addObject("operatorInfo", "登录失败,请输入正确的验证码或者密码！");
		} else {

			Admin admin = adminService.findLogin(adminLoginId, adminPassword);
			if (admin != null) {
				// mv.addObject("operatorInfo", "登录成功");
				mv.addObject("admin", admin);
				session.setAttribute("admin", admin);
				mv.setViewName("admin/auditResume");
			}
		}
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "admin/login";
	}
		
		@RequestMapping("/exit") // 退出返回登录页面
		public ModelAndView exit(HttpSession session) {
			session.invalidate();// 结束session
			ModelAndView mv = new ModelAndView("admin/login");
			return mv;
		}

		// 访问管理员操作日志
		//查询类型选取
		@RequestMapping("/adminLog")
		public ModelAndView selectAdminLog(){
			ModelAndView mv=new ModelAndView("admin/adminLog");
			return mv;
		}
		
				@RequestMapping(value="/findAdminLogAll",method=RequestMethod.GET) // 访问管理员日志,无参查询全部
				public ModelAndView findAdminLogAll() {
					//List<AdminLog> adminLogs = adminService.findAdminLogAll(page);
					ModelAndView mv = new ModelAndView("admin/findAdminLogAll");
					//mv.addObject("adminLogs", adminLogs);
					return mv;
				}
				@RequestMapping(value="/findAdminLogAll",method=RequestMethod.POST) // 访问管理员日志,无参查询全部
				public ModelAndView findAdminLogAll(Integer page) {
					List<AdminLog> adminLogs = adminService.findAdminLogAll(page);
					ModelAndView mv = new ModelAndView("admin/adminLogList");
					mv.addObject("adminLogs", adminLogs);
					return mv;
				}
				@RequestMapping(value="/findAdminLogByTime",method=RequestMethod.GET) // 访问管理员日志,时间段查询
				public ModelAndView findAdminLogByTime() {
					//List<AdminLog> adminLogs = adminService.findAdminLogByTime(beginTime, endTime,page);
					ModelAndView mv = new ModelAndView("admin/findAdminLogByTime");
					//String beginTime, String endTime,Integer pagemv.addObject("adminLogs", adminLogs);
					return mv;
				}
				
				@RequestMapping(value="/findAdminLogByTime",method=RequestMethod.POST) // 访问管理员日志,时间段查询
				public ModelAndView findAdminLogByTime(String beginTime, String endTime,Integer page) {
					List<AdminLog> adminLogs = adminService.findAdminLogByTime(beginTime, endTime,page);
					ModelAndView mv = new ModelAndView("admin/adminLogList");
					mv.addObject("adminLogs", adminLogs);
					return mv;
				}

				@RequestMapping(value="/findAdminLogByTimeAndId",method=RequestMethod.GET) // 访问管理员日志,操作人ID&时间段查询
				public ModelAndView findAdminLogByTimeAndId() {
//					List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndId(userLoginId, beginTime, endTime,page);
					ModelAndView mv = new ModelAndView("admin/findAdminLogByTimeAndId");
					//mv.addObject("adminLogs", adminLogs);
					return mv;
				}
				@RequestMapping(value="/findAdminLogByTimeAndId",method=RequestMethod.POST) // 访问管理员日志,操作人ID&时间段查询
				public ModelAndView findAdminLogByTimeAndId(Integer userLoginId, String beginTime, String endTime,Integer page) {
					List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndId(userLoginId, beginTime, endTime,page);
					ModelAndView mv = new ModelAndView("admin/adminLogList");
					mv.addObject("adminLogs", adminLogs);
					return mv;
				}

				@RequestMapping(value="/findAdminLogByIdAndDo",method=RequestMethod.GET) // 访问管理员日志,操作人ID&操作类型查询
				public ModelAndView findAdminLogByIdAndDo() {
					//List<AdminLog> adminLogs = adminService.findAdminLogByIdAndDo(userLoginId, adminDo,page);
					ModelAndView mv = new ModelAndView("admin/findAdminLogByIdAndDo");
					//mv.addObject("adminLogs", adminLogs);
					return mv;
				}
				
				@RequestMapping(value="/findAdminLogByIdAndDo",method=RequestMethod.POST) // 访问管理员日志,操作人ID&操作类型查询
				public ModelAndView findAdminLogByIdAndDo(Integer userLoginId, Integer adminDo,Integer page) {
					List<AdminLog> adminLogs = adminService.findAdminLogByIdAndDo(userLoginId, adminDo,page);
					ModelAndView mv = new ModelAndView("admin/adminLogList");
					mv.addObject("adminLogs", adminLogs);
					return mv;
				}

				@RequestMapping(value="/findAdminLogByTimeAndDo",method=RequestMethod.GET) // 访问管理员日志,操作类型&时间段查询
				public ModelAndView findAdminLogByTimeAndDo() {
					//List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndDo(beginTime, endTime, adminDo,page);
					ModelAndView mv = new ModelAndView("admin/findAdminLogByTimeAndDo");
				//	mv.addObject("adminLogs", adminLogs);
					return mv;
				}
				@RequestMapping(value="/findAdminLogByTimeAndDo",method=RequestMethod.POST) // 访问管理员日志,操作类型&时间段查询
				public ModelAndView findAdminLogByTimeAndDo(String beginTime, String endTime, Integer adminDo,Integer page) {
					List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndDo(beginTime, endTime, adminDo,page);
					ModelAndView mv = new ModelAndView("admin/adminLogList");
					mv.addObject("adminLogs", adminLogs);
					return mv;
				}
				
				@RequestMapping(value="/findAdminLogByTimeAndDoAndId",method=RequestMethod.GET) // 访问管理员日志,全部类型查询
				public ModelAndView findAdminLogByTimeAndDoAndId() {
					//List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndDoAndId(adminDo, userLoginId, beginTime, endTime,page);
					ModelAndView mv = new ModelAndView("admin/findAdminLogByTimeAndDoAndId");
					//mv.addObject("adminLogs", adminLogs);
					return mv;
				}
				@RequestMapping(value="/findAdminLogByTimeAndDoAndId",method=RequestMethod.POST) // 访问管理员日志,全部类型查询
				public ModelAndView findAdminLogByTimeAndDoAndId(Integer adminDo, Integer userLoginId, String beginTime, String endTime,Integer page) {
					List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndDoAndId(adminDo, userLoginId, beginTime, endTime,page);
					ModelAndView mv = new ModelAndView("admin/adminLogList");
					mv.addObject("adminLogs", adminLogs);
					return mv;
				}

		/*@RequestMapping("/findBestArticle") // 热门文章查询
		public ModelAndView findBestArticle() {
			List<Article> findBestArticles = adminService.findBestArticle();
			ModelAndView mv = new ModelAndView("");
			mv.addObject("findBestArticles", findBestArticles);
			return mv;
		}*/
		
		@RequestMapping(value="/findBestArticle",method=RequestMethod.GET) // 热门文章查询
		public ModelAndView findBestArticle() {
			//List<Article> findBestArticles = adminService.findBestArticle();
			ModelAndView mv = new ModelAndView("admin/findBestArticle");
			//mv.addObject("findBestArticles", findBestArticles);
			return mv;
		}
		@RequestMapping(value="/findBestArticle",method=RequestMethod.POST) // 热门文章查询
		public ModelAndView findBestArticle( Integer articleLikeNum) {
			List<Article> findBestArticles = adminService.findBestArticle();
			ModelAndView mv = new ModelAndView("admin/adminLogList");
			return mv;
		}
		
		//禁用个人用户
		@RequestMapping("/disableUser")
		public ModelAndView disableUser(Integer userId,Integer userStatus){
			Integer result=adminService.disableUser(userId, userStatus);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("operatorInfo","普通用户禁用成功！");
				mv.addObject("toPage", "findAll");
				mv.setViewName("info");
			}else{
				mv.addObject("operatorInfo","禁用失败，请联系系统维护人员");
				mv.addObject("toPage","index");
				mv.setViewName("info");
			}
			return mv;
		}
		
		
		//禁用企业用户
		@RequestMapping("/disableCompany")
		public ModelAndView disableCompany(Integer companyId,Integer companyStatus){
			Integer result=adminService.disableUser(companyId, companyStatus);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("operatorInfo","企业用户禁用成功！");
				mv.addObject("toPage", "findAll");
				mv.setViewName("info");
			}else{
				mv.addObject("operatorInfo","禁用失败，请联系系统维护人员");
				mv.addObject("toPage","index");
				mv.setViewName("info");
			}
			return mv;
		}
		
		//禁用个人用户后的（查询）显示效果
		@RequestMapping("/findUser/{page}")
		public ModelAndView findUser(@PathVariable Integer page){
			List<User> findUser=adminService.findUser(page);
			int maxPage=adminService.findMaxPage();
			ModelAndView mv=new ModelAndView("index");
			mv.addObject("findUser",findUser);
			mv.addObject("page",page);
			mv.addObject("maxPage",maxPage);
			return mv;
		}
		
		//禁用企业用户后的（查询）显示效果
		@RequestMapping("/findCompany/{page}")
		public ModelAndView findCompany(@PathVariable Integer page){
			List<Company> findCompany=adminService.findCompany(page);
			int maxPage=adminService.findMaxPage();
			ModelAndView mv=new ModelAndView("index");
			mv.addObject("findCompany",findCompany);
			mv.addObject("page",page);
			mv.addObject("maxPage",maxPage);
			return mv;
		}
		
		//登录的管理员，自我信息修改
		@RequestMapping("/maIntegerainAdmin")
		public ModelAndView maIntegerainAdmin(String adminName,String adminTel,String adminEmail,HttpSession session){
			Admin admin=(Admin)session.getAttribute("admin");
			admin.setAdminName(adminName);
			admin.setAdminEmail(adminEmail);
			admin.setAdminTel(adminTel);
			
			Integer result=adminService.maIntegerainAdmin(admin);
			ModelAndView mv=new ModelAndView();
			if(result>=1){
				mv.addObject("operatorInfo","信息修改成功！");
				mv.setViewName("info");
			}else{
				mv.addObject("operatorInfo","修改失败！");
				mv.setViewName("info");
			}
			return mv;
		}
		
		//通过用户id查看修改后的内容
		@RequestMapping("/findUpdante")
		public ModelAndView findByAdminId(@PathVariable Integer id){
			List<Admin> findByAdminId=adminService.findByAdminId(id);
			ModelAndView mv=new ModelAndView("update");
			mv.addObject("findByAdminId",findByAdminId);
			return mv; 
		}
		
		//审核--查询
		@RequestMapping("/findAuditResume/{page}")//查询审核简历
		public ModelAndView findAuditResume(@PathVariable Integer page){
			List<Resume> resumes=adminService.findAuditResume(page);
			ModelAndView mv=new ModelAndView();
			mv.addObject("resume",resumes);
			mv.addObject("page", page);
			mv.setViewName("admin/auditResume");
			return mv;
		}
		@RequestMapping("/findAuditArticle/{page}")//查询审核文章
		public ModelAndView findAuditArticle(@PathVariable Integer page){
			List<Article> articles=adminService.findAuditArticle(page);
			ModelAndView mv=new ModelAndView();
			mv.addObject("article",articles);
			mv.addObject("page", page);
			mv.setViewName("admin/auditArticle");
			return mv;
		}
		@RequestMapping("/findAuditCommentsArticle")//查询审核文章评论
		public ModelAndView findAuditCommentsArticle(){
			List<CommentArticle> commentArticles=adminService.findAuditCommentsArticle(null);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("commentArticles",commentArticles);
			return mv;
		}
		@RequestMapping("/findAuditCompany")//查询审核企业资质
		public ModelAndView findAuditCompany(){
			List<Company> companys=adminService.findAuditCompany(null);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("companys",companys);
			return mv;
		}
		@RequestMapping("/findAuditCommentsCompanyAndPeople")//查询审核个人企业互评论
		public ModelAndView findAuditCommentsCompanyAndPeople(){
			List<Discuss> discusss=adminService.findAuditCommentsCompanyAndPeople(null);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("discusss",discusss);
			return mv;
		}
		@RequestMapping("/findAuditInfo")//查询审核新闻
		public ModelAndView findAuditInfo(){
			List<Article> articles=adminService.findAuditInfo(null);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("articles",articles);
			return mv;
		}
		@RequestMapping("/findAuditOffer")//查询审核offer
		public ModelAndView findAuditOffer(){
			List<Message> messages=adminService.findAuditOffer(null);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("messages",messages);
			return mv;
		}
		@RequestMapping("/findAuditRecruitment")//查询审核招聘信息
		public ModelAndView findAuditRecruitment(){
			List<CompanyRecruit> companyRecruits=adminService.findAuditRecruitment(null);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("companyRecruits",companyRecruits);
			return mv;
		}
		
		//需要审核
		@RequestMapping("/auditResume")//审核简历
		public ModelAndView auditResume(Integer id,Integer resumeStatusThree){
			int result=adminService.auditResume(id,resumeStatusThree);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","审核成功");
				mv.addObject("result","");
				mv.setViewName("admin/auditResume");
			}else{
				mv.addObject("","审核失败");
				mv.addObject("","");
				mv.setViewName("admin/login");
			}
			return mv;
		}
		@RequestMapping("/auditArticle")//审核文章
		public ModelAndView auditArticle(Integer articleId,Integer articleStatus){
			int result=adminService.auditArticle(articleId,articleStatus);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","审核成功");
				mv.addObject("","");
				mv.setViewName("");
			}else{
				mv.addObject("","审核失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		@RequestMapping("/auditCommentsArticle")//审核文章评论
		public ModelAndView auditCommentsArticle(Integer id,Integer commentArticleStatus){
			int result=adminService.auditCommentsArticle(id,commentArticleStatus);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","审核成功");
				mv.addObject("","");
				mv.setViewName("");
			}else{
				mv.addObject("","审核失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		@RequestMapping("/auditCompany")//审核企业资质
		public ModelAndView auditCompany(Integer companyId,Integer cmpIntegerStatus){
			int result=adminService.auditCompany(companyId,cmpIntegerStatus);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","审核成功");
				mv.addObject("","");
				mv.setViewName("");
			}else{
				mv.addObject("","审核失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		@RequestMapping("/auditCommentsCompanyAndPeople")//审核个人企业互评
		public ModelAndView auditCommentsCompanyAndPeople(Integer id,Integer discussStatus){
			int result=adminService.auditCommentsCompanyAndPeople(id,discussStatus);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","审核成功");
				mv.addObject("","");
				mv.setViewName("");
			}else{
				mv.addObject("","审核失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		@RequestMapping("/auditInfo")//审核新闻
		public ModelAndView auditInfo(Integer InfoId,Integer cmpInfStatus){
			int result=adminService.auditInfo(InfoId,cmpInfStatus);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","审核成功");
				mv.addObject("","");
				mv.setViewName("");
			}else{
				mv.addObject("","审核失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		@RequestMapping("/auditOffer")//审核offer
		public ModelAndView auditOffer(Integer id,Integer offerType){
			int result=adminService.auditOffer(id,offerType);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","审核成功");
				mv.addObject("","");
				mv.setViewName("");
			}else{
				mv.addObject("","审核失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		@RequestMapping("/auditRecruitment")//审核招聘信息
		public ModelAndView auditRecruitment(Integer recruitmentId,Integer cmpRecStatus){
			int result=adminService.auditRecruitment(recruitmentId,cmpRecStatus);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","审核成功");
				mv.addObject("","");
				mv.setViewName("");
			}else{
				mv.addObject("","审核失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		@RequestMapping("/addcompanyVisitCount")//企业访问量统计--添加记录
		public ModelAndView addcompanyVisitCount(Integer id,Integer companyYear,Integer companyMoth
				,Integer companyDay,Integer companyResumeCount,Integer companyInfoCount,Integer companyId){
			Integer result = adminService.addCompanyVisitCount(id,companyYear,companyMoth
					,companyDay,companyResumeCount,companyId,companyInfoCount);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","成功");
				mv.addObject("", "");
				mv.setViewName("");
			}else{
				mv.addObject("","失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		
		@RequestMapping("/updatecompanyVisitCount")//企业访问量统计--修改访问数
		public ModelAndView updatecompanyVisitCount(CompanyVisitCount companyVisitCount){
			Integer result = adminService.updatecompanyVisitCount(companyVisitCount);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","成功");
				mv.addObject("", "");
				mv.setViewName("");
			}else{
				mv.addObject("","失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		
		@RequestMapping("/findAll")//企业访问量统计--显示所有访问数
		public ModelAndView findAll(Integer page){
			List<CompanyVisitCount> result = adminService.findAll(page);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("result",result);
			
			return mv;
		}
		
		@RequestMapping("/findCompanyId")//企业访问量统计--显示所有访问数
		public ModelAndView findCompanyId(Integer companyId,Integer page){
			List<CompanyVisitCount> result = adminService.findCompanyId(companyId, page);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("result",result);
			
			return mv;
		}
		
		@RequestMapping("/getMaxRecord")//企业访问量统计--获得信息量的最大值
		public ModelAndView getMaxRecord(){
			Integer result = adminService.getMaxRecord();
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("","成功");
				mv.addObject("", "");
				mv.setViewName("");
			}else{
				mv.addObject("","失败");
				mv.addObject("","");
				mv.setViewName("");
			}
			return mv;
		}
		
		@RequestMapping("/findcompanyInfoCountAndcompanyResumeCount")//企业访问量统计--查找发表信息的数量和发表简历的数量
		public ModelAndView findcompanyInfoCountAndcompanyResumeCount(Integer companyYear,Integer companyMonth
				,Integer companyDay,Integer companyId
				,Integer page){
			List<CompanyVisitCount> result = adminService.findcompanyInfoCountAndcompanyResumeCount(companyYear,companyMonth,companyDay,companyId,page);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("result",result);
			return mv;
		}
		
		@RequestMapping("/addUserVisitCount")
		public ModelAndView addUserVisitCount(Integer userYear,Integer userMonth,Integer UserDay,Integer userCommentCount,Integer userArticleCount,Integer userId){
			Integer result=adminService.addUserVisitCount(userYear, userMonth, UserDay, userCommentCount, userArticleCount, userId);
			ModelAndView mv=new ModelAndView();
			if(result!=null&&result>0){
				mv.addObject("","添加用户访问统计成功!");
				mv.setViewName("");
			}else{
				mv.addObject("","添加用户访问统计失败!");
				mv.setViewName("");
			}
			return mv;
		}
		
		@RequestMapping("/findUserVisitAll")
		public ModelAndView findUserVisitCount(Integer page){
			List<UserVisitCount> list=adminService.findUserVisitAll(page);
			ModelAndView mv=new ModelAndView();
			if(list!=null&&list.size()>0){
				mv.addObject("list",list);
				mv.setViewName("");
			}else if(list==null){
				mv.addObject("","查询失败！请联系管理员");
				mv.setViewName("");
			}else if(list.size()==0){
				mv.addObject("", "没有数据被找到!");
				mv.setViewName("");
			}
			return mv;
		}
		
		@RequestMapping("/findUserVisitCount")
		public ModelAndView findUserVisitCount(Integer page,Integer userYear,Integer userMonth,Integer userDay,Integer userId){
			List<UserVisitCount> list=adminService.findCount(page, userYear, userMonth, userDay, userId);
			ModelAndView mv=new ModelAndView();
			if(list!=null&&list.size()>0){
				mv.addObject("list",list);
				mv.setViewName("");
			}else if(list==null){
				mv.addObject("","查询失败！请联系管理员");
				mv.setViewName("");
			}else if(list.size()==0){
				mv.addObject("", "没有数据被找到!");
				mv.setViewName("");
			}
			return mv;	
		}
		
		//审核--查询ById
				@RequestMapping("/findAuditResumeById")//查询审核简历ById
				public ModelAndView findAuditResumeById(int id){
					List<Resume> resumes=adminService.findAuditResumeById(id);
					ModelAndView mv=new ModelAndView();
					mv.addObject("resumes",resumes);
					mv.setViewName("admin/auditing/auditingResume");
					return mv;
				}
				@RequestMapping("/findAuditArticleById")//查询审核文章ById
				public ModelAndView findAuditArticleById(int id){
					Article articles=adminService.findAuditArticleById(id);
					ModelAndView mv=new ModelAndView();
					mv.addObject("article",articles);
					mv.setViewName("admin/auditing/auditingArticle");
					return mv;
				}
				@RequestMapping("/findAuditCommentsArticleById")//查询审核文章评论ById
				public ModelAndView findAuditCommentsArticleById(int id){
					List<CommentArticle> commentArticles=adminService.findAuditCommentsArticleById(id);
					ModelAndView mv=new ModelAndView("auditingArticleComment");
					mv.addObject("commentArticles",commentArticles);
					return mv;
				}
				@RequestMapping("/findAuditCompanyById")//查询审核企业资质ById
				public ModelAndView findAuditCompanyById(int id){
					List<Company> companys=adminService.findAuditCompanyById(id);
					ModelAndView mv=new ModelAndView("auditingCompany");
					mv.addObject("companys",companys);
					return mv;
				}
				@RequestMapping("/findAuditCommentsCompanyAndPeopleById")//查询审核个人企业互评论ById
				public ModelAndView findAuditCommentsCompanyAndPeopleById(int id){
					List<Discuss> discusss=adminService.findAuditCommentsCompanyAndPeopleById(id);
					ModelAndView mv=new ModelAndView("auditingCompanyComment");
					mv.addObject("discusss",discusss);
					return mv;
				}
				@RequestMapping("/findAuditInfoById")//查询审核新闻ById
				public ModelAndView findAuditInfoById(int id){
					Article articles=adminService.findAuditInfoById(id);
					ModelAndView mv=new ModelAndView("auditingNews");
					mv.addObject("articles",articles);
					return mv;
				}
				@RequestMapping("/findAuditOfferById")//查询审核offerById
				public ModelAndView findAuditOfferById(int id){
					List<Message> messages=adminService.findAuditOfferById(id);
					ModelAndView mv=new ModelAndView("auditingOffer");
					mv.addObject("messages",messages);
					return mv;
				}
				@RequestMapping("/findAuditRecruitmentById")//查询审核招聘信息ById
				public ModelAndView findAuditRecruitmentById(int id){
					List<CompanyRecruit> companyRecruits=adminService.findAuditRecruitmentById(id);
					ModelAndView mv=new ModelAndView("auditingRecruitMent");
					mv.addObject("companyRecruits",companyRecruits);
					return mv;
				}
				
			@RequestMapping("/bestCompany")//查询最佳企业
				public ModelAndView findBestCompany(){
					ModelAndView mv=new ModelAndView("admin/bestCompany");
					List<Company> bestCompanyList=(List<Company>)adminService.findBestCompany();
					mv.addObject("bestCompanyList", bestCompanyList);
					return mv;
					
				}
			/**
			 * 获取验证码
			 * @param time
			 * @param request
			 * @param response
			 */
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

				// 将生成的字符串保存到session中
				HttpSession session = request.getSession();
				session.setAttribute("codeValidate", buiderCode);

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
