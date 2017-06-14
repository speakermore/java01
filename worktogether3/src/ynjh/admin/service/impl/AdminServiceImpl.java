package ynjh.admin.service.impl;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.admin.dao.admin.AdminMapper;
import ynjh.admin.dao.adminlog.AdminLogMapper;
import ynjh.admin.dao.companyvisitcount.CompanyVisitCountMapper;
import ynjh.admin.dao.uservisitcount.UserVisitCountMapper;
import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
import ynjh.admin.entity.AuditArticle;
import ynjh.admin.entity.AuditComIntro;
import ynjh.admin.entity.AuditOffer;
import ynjh.admin.entity.CompanyVisitCount;
import ynjh.admin.entity.SysMessageWithAuthor;
import ynjh.admin.entity.SystemMessage;
import ynjh.admin.entity.UserVisitCount;
import ynjh.admin.service.AdminService;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyDetailImg;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.entity.CompanyRecruit;
import ynjh.company.entity.Offer;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Message;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.entity.Work;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminMapper adminMapper;
	@Resource
	private AdminLogMapper adminLogMapper;
	@Resource
	private CompanyVisitCountMapper companyVisitCountMapper;
	@Resource
	private UserVisitCountMapper userVisitCountMapper;
	
	/**
	 * 
	   * @Name: auditResume //审核简历
	   * @Description: @param id 简历ID
	   * @Description: @param status 简历待审核状态
	   * @Description: @return
	   * @Author: 曾瑞（作者）
	   * @Version: V1.00 （版本号）
	   * @Create Date: 2017年4月21日上午11:34:54
	 */
	@Override
	public Integer auditResume(Integer id, Integer status) {
		String resumeId;
		if(id!=null&&status!=null){
			resumeId=id+"";
			try{
				adminMapper.auditingWork(resumeId, status);
				adminMapper.auditingProject(resumeId, status);
				adminMapper.auditingEducation(resumeId, status);
				return adminMapper.auditResume(id, status);
			}catch(Exception e){
				e.printStackTrace();
				return null; 
			}
		}
		return null;
		
	}

	/**
	 * 查询审核简历
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<Resume> findAuditResume(Integer page) {
		 
		return adminMapper.findAuditResume(page);
	}

	/**
	 * 审核文章
	 * @author 周富强
	 * @param articleId 文章id
	 * @param articleStatus 信息状态
	 * @return
	 */
	@Override
	public Integer auditArticle(Integer articleId, Integer articleStatus) {
		 
		return adminMapper.auditArticle(articleId, articleStatus);
	}

	/**
	 * 
	   * @Name: findAuditArticle // 查询审核文章
	   * @Description: @param page 偏移量
	   * @Description: @return
	   * @Author:曾瑞（作者）
	   * @Version: V1.00 （版本号）
	   * @Create Date: 2017年4月21日上午10:48:30
	 */
	@Override
	public List<AuditArticle> findAuditArticle(Integer page) {
		 
		return adminMapper.findAuditArticle((page-1)*0);
	}

	/**
	 * 
	 * 审核文章评论
	 * @author 周富强
	 * @param id 文章评论id
	 * @param commentArticleStatus 文章评论审核状态
	 * @return
	 */
	@Override
	public Integer auditCommentsArticle(Integer[] id, Integer commentsArticleStatus) {
		if(id==null){
			return -1;
		}else{
			int i=0;
			for(;i<id.length;i++){
				adminMapper.auditCommentsArticle(id[i],commentsArticleStatus);
			}
			return i+1;
		}
	}

	/**
	 * 
	   * @Name: findAuditCommentsArticle // 查询审核文章评论
	   * @Description: @param page 偏移量
	   * @Description: @return
	   * @Author: 曾瑞（作者）
	   * @Version: V1.00 （版本号）
	   * @Create Date: 2017年4月21日上午10:49:12
	 */
	@Override
	public List<CommentArticle> findAuditCommentsArticle(Integer page) {
		 
		return adminMapper.findAuditCommentsArticle((page-1)*10);
	}

	/**
	 * 审核企业资质
	 * @author 周富强
	 * @param companyId 企业id
	 * @param cmpIntegerStatus  企业发表待审核状态
	 * @return
	 */
	@Override
	public Integer auditCompany(Integer companyId, Integer cmpIntegerStatus) {
		 
		return adminMapper.auditCompany(companyId, cmpIntegerStatus);
	}

	/**
	 * 查询审核企业资质
	 * @author 周富强
	 * @return
	 */
	@Override
	public List<Company> findAuditCompany(Integer page) {
		 
		return adminMapper.findAuditCompany(page);
	}

	/**
	 * 审核个人企业互评
	 * @author 周富强
	 * @param id 个人企业互评id
	 * @param discussStatus 待审核状态
	 * @return
	 */
	@Override
	public Integer auditCommentsCompanyAndPeople(Integer[] id, Integer discussStatus) {
		if(id!=null){
			int result=0;
			for(int i=0;i<id.length;i++){
				result=adminMapper.auditCommentsCompanyAndPeople(id[i], discussStatus);
			}
			return result;
		}
		return -1; 
	}

	/**
	 * 查询审核个人企业互评论
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<Discuss> findAuditCommentsCompanyAndPeople(Integer page) {
		 
		return adminMapper.findAuditCommentsCompanyAndPeople((page-1)*10);
	}

	/**
	 * 审核新闻
	 * @author 周富强
	 * @param InfoId 新闻id
	 * @param cmpInfStatus 待审核状态
	 * @return
	 */
	@Override
	public Integer auditInfo(Integer InfoId, Integer cmpInfStatus) {
		 
		return adminMapper.auditInfo(InfoId, cmpInfStatus);
	}

	/**
	 * 查询审核新闻
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<AuditArticle> findAuditComArticle(Integer page) {
		if(page!=null&&page>=0){
			page=(page-1)*10;
			if(page<0){
				page=0;
			}
			return adminMapper.findAuditComArticle(page);
		}else{
			return new ArrayList<AuditArticle>();
		}
	}

	/**
	 * 审核offer
	 * @author 周富强
	 * @param id offer的id
	 * @param offerType  
	 * @return
	 */
	@Override
	public Integer auditOffer(Integer[] ids, Integer offerStatus) {
		 if(ids!=null){
			 Integer result=0;
			 for(int i=0;i<ids.length;i++){
				 adminMapper.auditOffer(ids[i], offerStatus);
				 result++;
			 }
			 return result;
		 }else{
			 return null;
		 }
	}

	/**
	 * 查询审核offer
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<AuditOffer> findAuditOffer(Integer page) {
		if(page!=null){
			page=(page-1)*10;
			if(page<0){
				page=0;
			}
			return adminMapper.findAuditOffer(page);
		}else{
			return null;
		}
	}

	/**
	 * 审核招聘信息
	 * @author 周富强
	 * @param recruitmentId 招聘信息id
	 * @param cmpRecStatus 
	 * @return
	 */
	@Override
	public Integer auditRecruitment(Integer[] recruitmentId, Integer cmpRecStatus) {
		if(recruitmentId!=null){
			int result=0;
			for(int i=0;i<recruitmentId.length;i++){
				result=adminMapper.auditRecruitment(recruitmentId[i], cmpRecStatus);
				result++;
			}
			return result;
		}else{
		return -1;
		}		
	}

	/**
	 * 查询审核招聘信息
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<CompanyRecruit> findAuditRecruitment(Integer page) {
		 
		return adminMapper.findAuditRecruitment((page-1)*10);
	}
	
	/**
	 * 
	 * 访问管理员日志
	 * @author 张宇
	 * @param page
	 *            分页条数
	 * @return
	 */

	@Override
	public List<AdminLog> findAdminLogAll(Integer page) {
		// TODO Auto-generated method stub
		return adminLogMapper.findAdminLogAll(page);
	}
	
	@Override
	public List<AdminLog> findAdminLogByTimeAndDoAndId(Integer adminDo, Integer userLoginId, String beginTime,
			String endTime,Integer page) {
		// TODO Auto-generated method stub
		if((adminDo==null)&&userLoginId==null){
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate=null;
			try {
				beginDate = sdf.parse(beginTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date endDate=null;
			try {
				endDate = sdf.parse(endTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return adminLogMapper.findAdminLogByTime(beginDate, endDate, page);
		}else if((beginTime==null)&&endTime==null){
			
			return adminLogMapper.findAdminLogByIdAndDo(userLoginId, adminDo, page);
		}else if(adminDo==null){
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate=null;
			try {
				beginDate = sdf.parse(beginTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date endDate=null;
			try {
				endDate = sdf.parse(endTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return adminLogMapper.findAdminLogByTimeAndId(userLoginId, beginDate, endDate, page);
		}else if(userLoginId==null){
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate=null;
			try {
				beginDate = sdf.parse(beginTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date endDate=null;
			try {
				endDate = sdf.parse(endTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return adminLogMapper.findAdminLogByTimeAndDo(beginDate, endDate, adminDo, page);
		}else{
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate=null;
			try {
				beginDate = sdf.parse(beginTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date endDate=null;
			try {
				endDate = sdf.parse(endTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return adminLogMapper.findAdminLogByTimeAndDoAndId(adminDo, userLoginId, beginDate, endDate, page);
		}
	}

	/** 
	 * 最佳企业查询
	 * @author 朱吉
	 * @return
	 */
	@Override
	public List<Company> findBestCompany() { 
		List<Integer> list=adminMapper.findCompanyId();//找到最佳企业id
		List<Company> listCompany=new ArrayList();
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				Company company=adminMapper.findCompanyById(list.get(i));
				listCompany.add(company);
			}
		}	
			return listCompany;	
	}

	/**
	 * 禁用个人用户后的（查询）显示效果
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<User> findUser(Integer page) {
		 
		return adminMapper.findUser(page);
	}

	/**
	 * 禁用企业用户后的（查询）显示效果
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<Company> findCompany(Integer page) {
		 
		return adminMapper.findCompany(page);
	}

	/**
	 * 禁用个人用户
	 * @author 周富强
	 * @param userId 个人用户id
	 * @param userStatus 个人用户状态
	 * @return
	 */
	@Override
	public Integer disableUser(Integer userId, Integer userStatus) {
		 
		return adminMapper.disableUser(userId, userStatus);
	}

	/**
	 * 禁用企业用户
	 * @author 
	 * @param companyId 企业id
	 * @param companyStatus 企业用户状态
	 * @return
	 */
	@Override
	public Integer disableCompany(Integer companyId, Integer companyStatus) {
		 
		return adminMapper.disableCompany(companyId, companyStatus);
	}

	/**
	 * 登录的管理员，自我信息修改
	 * @author 
	 * @param admin 管理员对象
	 * @param session
	 * @return
	 */
	@Override
	public Integer maIntegerainAdmin(Admin admin) {
		 
		return adminMapper.maIntegerainAdmin(admin);
	}

	/**
	 * 通过用户id查看修改后的内容
	 * @author 朱吉
	 * @param id 用户id
	 * @return
	 */
	@Override
	public List<Admin> findByAdminId(Integer id) {
		 
		return adminMapper.findByAdminId(id);
	}

	/**
	 * 查找最大条数
	 * @author 
	 */
	@Override
	public int findMaxPage() {
		 
		return adminMapper.findMaxPage();
	}

	@Override
	public Integer trafficStatisticalPersonal(Integer year, Integer month, Integer day, String userId) {
		 
		return null;
	}

	@Override
	public Integer trafficStatisticalCompany(Integer year, Integer month, Integer day, String companyId) {
		 
		return null;
	}

	

	/**
	 * 管理员登录验证-查找管理员
	 * @author 曾瑞
	 * @param adminLoginId 管理员登录
	 * @param adminPassword 管理员密码
	 * @return
	 */
	@Override
	public Admin findLogin(String adminLoginId, String adminPassword) {
		 
		return adminMapper.findLogin(adminLoginId, adminPassword);
	}


	@Override
	/**
	 * 消息推送
	 * @author 周富强
	 * @param userid
	 * @param resendId
	 * @param articleContent
	 * @param messageSendTime
	 * @param messageResendStatus
	 */
	public Integer messagePushArticle(Integer userId, Integer resendId,String articleContent, Timestamp messageSendTime,
			Integer messageResendStatus) {
		 
		return adminMapper.messagePushArticle(userId, resendId, articleContent, messageSendTime, messageResendStatus);
	}

	/**
	 * 企业访问量统计--添加记录
	 * @author 
	 * @param id id
	 * @param companyYear 年
	 * @param companyMoth 月
	 * @param companyDay 日
	 * @param companyResumeCount 发表招聘信息数统计
	 * @param companyInfoCount 发表文章数统计
	 * @param companyId 企业id
	 * @return
	 */
	@Override
	public Integer addCompanyVisitCount(Integer id, Integer companyYear, Integer companyMoth, Integer companyDay,
			Integer companyResumeCount,Integer companyInfoCount, Integer companyId) {
		 
		return companyVisitCountMapper.addcompanyVisitCount(id, companyYear, companyMoth, companyDay, companyResumeCount, companyId,companyInfoCount);
	}

	/**
	 * 企业访问量统计--修改访问数
	 * @author 朱吉
	 * @param companyVisitCount 企业访问量统计
	 * @return
	 */
	@Override
	public Integer updatecompanyVisitCount(CompanyVisitCount companyVisitCount) {
		 
		return companyVisitCountMapper.updatecompanyVisitCount(companyVisitCount);
	}

	/**
	 *企业访问量统计--显示所有访问数
	 *@author 朱吉 
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<CompanyVisitCount> findAll(Integer page) {
		 
		return companyVisitCountMapper.findAll(page);
	}

	/**
	 * 企业访问量统计--通过企业id查询企业访问量
	 * @author 
	 * @param companyId 企业id
	 * @param page
	 * @return
	 */
	@Override
	public List<CompanyVisitCount> findCompanyId(Integer companyId, Integer page) {
		 
		return companyVisitCountMapper.findCompanyId(companyId, page);
	}
	/**
	 * 企业访问量统计--查找发表信息的数量和发表简历的数量
	 * @author 
	 * @param companyYear 年
	 * @param companyMonth 月
	 * @param companyDay 日
	 * @param companyId 企业id
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<CompanyVisitCount> findcompanyInfoCountAndcompanyResumeCount(Integer companyYear, Integer companyMonth,
			Integer companyDay, Integer companyId, Integer page) {
		 
		return companyVisitCountMapper.findcompanyInfoCountAndcompanyResumeCount(companyYear, companyMonth, companyDay, companyId, page);
	}

	/**
	 * 企业访问量统计--获得信息量的最大值
	 * @author 
	 * @return
	 */
	@Override
	public Integer getMaxRecord() {
		 
		return companyVisitCountMapper.getMaxRecord();
	}

	/**
	 * 增加个人用户访问统计数
	 * @author 朱吉
	 * @param userYear 年
	 * @param userMonth 月
	 * @param UserDay 日
	 * @param userCommentCount 评论条数
	 * @param userArticleCount 发表文章条数
	 * @param userId 个人用户id
	 * @return
	 */
	@Override
	public Integer addUserVisitCount(Integer userYear, Integer userMonth, Integer userDay, Integer userCommentCount,
			Integer userArticleCount, Integer userId) {
		 
		UserVisitCount userVisitCount=new UserVisitCount();
		userVisitCount.setUserYear(userYear);
		userVisitCount.setUserMonth(userMonth);
		userVisitCount.setUserDay(userDay);
		userVisitCount.setUserCommentCount(userCommentCount);
		userVisitCount.setUserArticleCount(userArticleCount);
		userVisitCount.setUserId(userId);
		return userVisitCountMapper.addUserVisitCount(userVisitCount);
	}

	/**
	 * 个人访问量统计--获得信息量的最大值
	 * @author 朱吉 
	 * @return
	 */
	@Override
	public Integer findMaxPage(Integer page) {
		 
		return userVisitCountMapper.findMaxPage(page);
	}

	/**
	 * 查找所有个人用户访问量统计记录
	 * @author 朱吉
	 * @param page 偏移量
	 * @return
	 */
	@Override
	public List<UserVisitCount> findUserVisitAll(Integer page) {
		 
		return userVisitCountMapper.findAll(page);
	}

	/**
	 * 按条件查找个人用户访问量统计记录
	 * @author 朱吉
	 * @param page 偏移量
	 * @param userYear 年
	 * @param userMonth 月
	 * @param userDay 日
	 * @param userId 个人用户id
	 * @return
	 */
	@Override
	public List<UserVisitCount> findCount(Integer page, Integer userYear, Integer userMonth, Integer userDay,
			Integer userId) {
		 
		return userVisitCountMapper.findCount(page, userYear, userMonth, userDay, userId);
	}

	/**
	 * 审核--查询审核简历ById
	 * @author 周富强
	 * @param id 简历id
	 * @return
	 */
	@Override
	public Resume findAuditResumeById(Integer id) {
		 
		return adminMapper.findAuditResumeById(id);
	}

	/**
	 * 查询审核文章ById
	 * @author 周富强
	 * @param id 文章id
	 * @return
	 */
	@Override
	public AuditArticle findAuditArticleById(Integer id) {
		 
		return adminMapper.findAuditArticleById(id);
	}

	@Override
	public CommentArticle findAuditCommentsArticleById(Integer id) {
		 
		return adminMapper.findAuditCommentsArticleById(id);
	}

	/**
	 * 查询审核企业资质ById
	 * @author 周富强
	 * @param id 企业简介id
	 * @return 
	 */
	@Override
	public Company findAuditCompanyById(Integer id) {
		if(id!=null&&id>0){ 
			return adminMapper.findAuditCompanyById(id);
		}else{
			return null;
		}
	}

	/**
	 * 查询审核个人企业互评论ById
	 * @author 周富强
	 * @param id 个人企业互评id
	 * @return
	 */
	@Override
	public Discuss findAuditCommentsCompanyAndPeopleById(Integer id) {
		 
		return adminMapper.findAuditCommentsCompanyAndPeopleById(id);
	}
	/**
	 * 查询新闻审核
	 */
	@Override
	public Message findAuditInfoById(Integer id) {
		 
		return adminMapper.findAuditInfoById(id);
	}

	/**
	 * 查询审核offer的id
	 * @author 周富强
	 * @param id offer的id
	 * @return
	 */
	@Override
	public Offer findAuditOfferById(Integer id) {
		 
		return adminMapper.findAuditOfferById(id);
	}

	/**
	 * 查询审核招聘信息ById
	 * @author 周富强
	 * @param id 招聘信息的id
	 * @return
	 */
	@Override
	public CompanyRecruit findAuditRecruitmentById(Integer id) {
		 
		return adminMapper.findAuditRecruitmentById(id);
	}

	/**
	 * 按管理员登录名查找管理员
	 * @author 朱吉
	 * @param adminLoginId 登录名
	 */
	@Override
	public Admin findLoginByAdminLoginId(String adminLoginId) {
		 
		return adminMapper.findLoginByAdminLoginId(adminLoginId);
	}

	/**
	 * 个人热门文章查询
	 * @author 张宇
	 */
	@Override
	public List<AuditArticle> findPersonBestArticle() {
		
		return adminMapper.findPersonBestArticle();
	}

	/**
	 * 企业热门文章查询
	 * @author 张宇
	 */
	@Override
	public List<Article> findCompanyBestArticle() {
		 
		return adminMapper.findCompanyBestArticle();
	}

	/**
	 * 首页显示5条简历
	 * @author 朱吉
	 */
	@Override
	public List<Resume> find5Resumes() {
		
		return adminMapper.find5Resumes();
	}

	/**
	 * 首页显示5条文章信息
	 * @author 朱吉
	 */
	@Override
	public List<Article> find5Articles() {
		
		return adminMapper.find5Articles();
	}
	/**
	 * 首页显示5条个人企业互评信息
	 * @author 朱吉
	 */
	@Override
	public List<Discuss> find5Discuss() {
		
		return adminMapper.find5Discuss();
	}

	@Override
	public Integer addMessage(SystemMessage systemMessage) {
		
		return adminMapper.addMessage(systemMessage);
	}
	
	/**
	 * 查询简历的工作信息
	 * @author 朱吉
	 * @param resumeId 简历编号
	 */
	@Override
	public List<Work> findResumeWork(String resumeId) {
		if(resumeId!=null||!(resumeId.equals(""))){
			return adminMapper.findResumeWork(resumeId);
		}else{
			return null;
		}
		
	}

	/**
	 * 查找简历的项目经历
	 * @author 朱吉
	 * @param resumeId 简历id
	 */
	@Override
	public List<Project> findResumeProject(String resumeId) {
		if(resumeId!=null||!(resumeId.equals(""))){
			return adminMapper.findResumeProject(resumeId);
		}else{
			return null;
		}	
	}

	
	@Override
	public List<Education> findResumeEducation(String resumeId) {
		if(resumeId!=null||!(resumeId.equals(""))){
			return adminMapper.findResumeEducation(resumeId);
		}else{
			return null;
		}
	}

	@Override
	public Integer findAdminByAdminLoginId(String adminLoginId) {
		Admin admin = adminMapper.findLoginByAdminLoginId(adminLoginId);
		if(admin!=null){
			return 1;
		}else{
			return 0;
		}
	}

	/**
	 * 通过id查找个人用户
	 * @author 朱吉
	 * @param userId 个人用户表id
	 */
	@Override
	public User findUserById(Integer userId) {
		return adminMapper.findUserById(userId);
	}

	/**
	 * 查找企业简介
	 * @author 朱吉
	 * @param page 偏移量
	 */
	@Override
	public List<AuditComIntro> findCompanyIntro(Integer page) {
		if(page!=null){
			page=(page-1)*10;
			if(page<0){
				page=0;
			}
			return adminMapper.findCompanyIntro(page);
		}
		return null;
	}

	/**
	 * @author 朱吉
	 * @param id 企业表id
	 */
	@Override
	public AuditComIntro findAuditComById(Integer id) {
		AuditComIntro auditComIntro=null;
		if(id!=null&&id>0){
			auditComIntro=adminMapper.findAuditComById(id);
		}
		return auditComIntro;
	}

	/**
	 * 通过公司表id查找公司图片
	 * @author 朱吉
	 * @param Integer id 公司表id
	 */
	@Override
	public List<CompanyDetailImg> findCompanyImgById(Integer id) {
		if(id!=null&&id>=0){
			return adminMapper.findCompanyImgById(id);
		}else{
			return null;
		}	
	}

	/**
	 * 审核企业基本信息
	 * @author 朱吉
	 * @param companyId company表找的id号
	 * @param cmpIntStatus 企业基本信息审核状态
	 */
	@Override
	public Integer auditCompanyInfo(Integer companyId, Integer cmpIntStatus) {
		if(companyId!=null&&companyId>=0&&cmpIntStatus!=null&&cmpIntStatus>=0){
			Integer result=adminMapper.auditCompanyNo(companyId, cmpIntStatus);
		}else{
			return null;
		}
		return -1;
	}

	/**
	 * 查找需要禁用的个人用户、
	 * @author 朱吉
	 */
	@Override
	public List<User> findDisabledUser() {
		return adminMapper.findDisabledUser();
	}

	/**
	 * 查找需要禁用的企业用户
	 * @author 朱吉
	 */
	@Override
	public List<Company> findDisabledCompany() {
		return adminMapper.findDisabledCompany();
	}

	/**
	 * 通过企业账号查找企业用户
	 * @author 朱吉
	 * @param companyLoginId 企业账号
	 */
	@Override
	public Company findCompanyByLoginId(String companyLoginId) {
		return adminMapper.findCompanyByLoginId(companyLoginId);
	}

	/**
	 * 通过个人用户账号查找个人用户
	 * @author 朱吉
	 * @param 个人用户登录Id（账号）
	 */
	@Override
	public User findUserByLoginId(String userLoginId) {
		return adminMapper.findUserByLoginId(userLoginId);
	}

	/**
	 * 通过个人用户id禁用/解禁用户
	 * @author 朱吉
	 * @param ids 个人用户id
	 * @param userStatus 用户状态：1正常，2禁用
	 */
	@Override
	public Integer personalMag(Integer[] ids, Integer userStatus) {
		if(ids!=null&&userStatus!=null&&ids.length>0){
			int result=0;
			for(result=0;result<ids.length;result++){
				adminMapper.disableUser(ids[result], userStatus);
			}
			if(result>0&&result==ids.length){
				return 1;//成功修改状态
			}else{
				return 0;//未能修改状态
			}
		}else{
			return -1;//参数错误
		}
	}

	/**
	 * 查找带有作者的系统消息
	 * 截短系统消息内容长度，方便显示
	 * @author 朱吉
	 */
	@Override
	public List<SysMessageWithAuthor> findSysMsgWithAuth() {
		List<SysMessageWithAuthor> list=adminMapper.findSysMsgWithAuth();
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				SysMessageWithAuthor message=list.get(i);
				String context=message.getSysmContent();
				String shortContext=null;
				if(context.length()>11){
					shortContext=context.substring(0, 10);
					shortContext+="……";
					message.setSysmContent(shortContext);
				}
			}
		}
		return list;
	}

	/**
	 * 新增管理员日志
	 * @author 朱吉
	 * @param adminLog 管理员日志实体类
	 */
	@Override
	public void addAdminLog(AdminLog adminLog) {
		adminMapper.addAdminLog(adminLog);
	}
	
	

	

	
	


}
