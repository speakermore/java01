package ynjh.admin.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
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
public class AdminController {
	@Resource
	private AdminService adminService;
	
	//登录
		@RequestMapping(value="/findLogin",method=RequestMethod.POST)
		public ModelAndView findLogin(String adminLoginId,String adminPassword,HttpSession session){
			Admin admin = adminService.findLogin(adminLoginId, adminPassword);
			ModelAndView mv=new ModelAndView("login");
			if(admin==null){
				mv.addObject("loginInfo", "登录失败");
			}else{
				mv.addObject("loginInfo", "登录成功");
				mv.addObject("admin", admin);
				session.setAttribute("admin", admin);
			}
			return mv;
		}
		
		@RequestMapping("/exit") // 退出返回登录页面
		public ModelAndView exit(HttpSession session) {
			session.invalidate();// 结束session
			ModelAndView mv = new ModelAndView("login");
			return mv;
		}

		// 访问管理员操作日志
		@RequestMapping("/findAdminLogAll") // 访问管理员日志,无参查询全部
		public ModelAndView findAdminLogAll(Integer page) {
			List<AdminLog> adminLogs = adminService.findAdminLogAll(page);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findAdminLogByTime") // 访问管理员日志,时间段查询
		public ModelAndView findAdminLogByTime(String beginTime, String endTime,Integer page) {
			List<AdminLog> adminLogs = adminService.findAdminLogByTime(beginTime, endTime,page);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findAdminLogByTimeAndId") // 访问管理员日志,操作人ID&时间段查询
		public ModelAndView findAdminLogByTimeAndId(Integer userLoginId, String beginTime, String endTime,Integer page) {
			List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndId(userLoginId, beginTime, endTime,page);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findAdminLogByIdAndDo") // 访问管理员日志,操作人ID&操作类型查询
		public ModelAndView findAdminLogByIdAndDo(Integer userLoginId, Integer adminDo,Integer page) {
			List<AdminLog> adminLogs = adminService.findAdminLogByIdAndDo(userLoginId, adminDo,page);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findAdminLogByTimeAndDo") // 访问管理员日志,操作类型&时间段查询
		public ModelAndView findAdminLogByTimeAndDo(String beginTime, String endTime, Integer adminDo,Integer page) {
			List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndDo(beginTime, endTime, adminDo,page);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}
		
		@RequestMapping("/findAdminLogByTimeAndDoAndId") // 访问管理员日志,全部类型查询
		public ModelAndView findAdminLogByTimeAndDoAndId(Integer adminDo, Integer userLoginId, String beginTime, String endTime,Integer page) {
			List<AdminLog> adminLogs = adminService.findAdminLogByTimeAndDoAndId(adminDo, userLoginId, beginTime, endTime,page);
			ModelAndView mv = new ModelAndView("");
			mv.addObject("adminLogs", adminLogs);
			return mv;
		}

		@RequestMapping("/findBestArticle") // 热门文章查询
		public ModelAndView findBestArticle() {
			List<Article> findBestArticles = adminService.findBestArticle();
			ModelAndView mv = new ModelAndView("");
			mv.addObject("findBestArticles", findBestArticles);
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
		@RequestMapping("/findAuditResume")//查询审核简历
		public ModelAndView findAuditResume(){
			List<Resume> resumes=adminService.findAuditResume(null);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("resumes",resumes);
			return mv;
		}
		@RequestMapping("/findAuditArticle")//查询审核文章
		public ModelAndView findAuditArticle(){
			List<Article> articles=adminService.findAuditArticle(null);
			ModelAndView mv=new ModelAndView("");
			mv.addObject("articles",articles);
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
				mv.addObject("","");
				mv.setViewName("");
			}else{
				mv.addObject("","审核失败");
				mv.addObject("","");
				mv.setViewName("");
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
		public ModelAndView auditOffer(Integer offerId,Integer offerStatus){
			int result=adminService.auditOffer(offerId,offerStatus);
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
}
