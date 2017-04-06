package ynjh.admin.service;



import java.util.List;

import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
import ynjh.admin.entity.CompanyVisitCount;
import ynjh.company.enity.Company;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.User;



public interface AdminService {
	//审核
	public Integer auditResume(Integer resumeId,Integer status);//审核简历
	public Integer auditResumeSelect(Integer status);//查询审核简历
	public Integer auditArticle(Integer articleId,Integer articleStatus);//审核文章
	public Integer auditArticleSelect(Integer articleStatus);//查询审核文章
	public Integer auditCommentsArticle(Integer CAId,Integer commentsArticleStatus);//审核文章评论
	public Integer auditCommentsArticleSelect(Integer commentsArticleStatus);//查询审核文章评论
	public Integer auditCompany(Integer companyId,Integer cmpIntegerStatus);//审核企业资质
	public Integer auditCompanySelect(Integer cmpIntegerStatus);//查询审核企业资质
	public Integer auditCommentsCompanyAndPeople(Integer CCPId,Integer discussStatus);//审核个人企业互评论
	public Integer auditCommentsCompanyAndPeopleSelect(Integer discussStatus);//查询审核个人企业互评论
	public Integer auditInfo(Integer InfoId,Integer cmpInfStatus);//审核新闻
	public Integer auditInfoSelect(Integer cmpInfStatus);//查询审核新闻
	public Integer auditOffer(Integer offerId,Integer offerStatus);//审核offer
	public Integer auditOfferSelect(Integer offerStatus);//查询审核offer
	public Integer auditRecruitment(Integer recruitmentId,Integer cmpRecStatus);//审核招聘信息
	public Integer auditRecruitmentSelect(Integer cmpRecStatus);//查询审核招聘信息
	
	
	//管理员操作日志
	public List<AdminLog> findAdminLog();//访问管理员日志,无参查询全部
	public List<AdminLog> findAdminLog(String beginTime,String endTime);//访问管理员日志,时间段查询
	public List<AdminLog> findAdminLog(Integer userLoginId,String beginTime,String endTime);//访问管理员日志,操作人ID&时间段查询
	public List<AdminLog> findAdminLog(Integer userLoginId,Integer adminDo);//访问管理员日志,操作人ID&操作类型查询
	public List<AdminLog> findAdminLog(String beginTime,String endTime,Integer adminDo);//访问管理员日志,操作类型&时间段查询
	public List<AdminLog> findAdminLog(Integer adminDo,Integer userLoginId,String beginTime,String endTime);//访问管理员日志,全部类型查询
	
	public List<Company> findBestCompany();//最佳企业查询
	public List<Article> findBestArticle();//热门文章
	
	//用户管理
	public List<User> findUser();//查询所有个人用户，用于禁用
	public List<Company> findCompany();//查询所有企业用户，用于禁用
	public Integer disableUser(Integer userId,Integer userStatus);//禁用个人用户
	public Integer disableCompany(Integer companyId,Integer companyStatus);//禁用企业用户
	
	//信息维护--修改正在登录的管理员信息
	public Integer maIntegerainAdmin(String adminName,String adminTel,String adminEmail);//改
	public List<Admin> findByAdminId(String adminId);//查
	
	public Integer trafficStatisticalPersonal(Integer year,Integer month,Integer day,String userId);//个人访问量统计判断是否有空值
	public Integer trafficStatisticalCompany(Integer year,Integer month,Integer day,String companyId);//企业访问量统计判断是否有空值
	
	public Integer messagePush(String message,Integer status);//消息推送
	
}	

