package ynjh.admin.service;



import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
import ynjh.admin.entity.CompanyVisitCount;
import ynjh.admin.entity.UserVisitCount;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyRecruit;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.Message;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;



public interface AdminService {
	//审核
	public Integer auditResume(Integer id,Integer status);//审核简历
	public List<Resume> findAuditResume(@Param("page") Integer page);//查询审核简历
	public Integer auditArticle(Integer articleId,Integer articleStatus);//审核文章
	public List<Article> findAuditArticle(@Param("page") Integer page);//查询审核文章
	public Integer auditCommentsArticle(Integer id,Integer commentsArticleStatus);//审核文章评论
	public List<CommentArticle> findAuditCommentsArticle(Integer page);//查询审核文章评论
	public Integer auditCompany(Integer companyId,Integer cmpIntegerStatus);//审核企业资质
	public List<Company> findAuditCompany(Integer page);//查询审核企业资质
	public Integer auditCommentsCompanyAndPeople(Integer id,Integer discussStatus);//审核个人企业互评论
	public List<Discuss> findAuditCommentsCompanyAndPeople(Integer page);//查询审核个人企业互评论
	public Integer auditInfo(Integer InfoId,Integer cmpInfStatus);//审核新闻
	public List<Article> findAuditInfo(Integer page);//查询审核新闻
	public Integer auditOffer(Integer id,Integer offerType);//审核offer
	public List<Message> findAuditOffer(Integer page);//查询审核offer
	public Integer auditRecruitment(Integer recruitmentId,Integer cmpRecStatus);//审核招聘信息
	public List<CompanyRecruit> findAuditRecruitment(Integer page);//查询审核招聘信息
	public List<Resume> findAuditResumeById(Integer id);//查询审核简历ById
	public Article findAuditArticleById(Integer id);//查询审核文章ById
	public List<CommentArticle> findAuditCommentsArticleById(Integer id);//查询审核文章评论ById
	public List<Company> findAuditCompanyById(Integer id);//查询审核企业资质ById
	public List<Discuss> findAuditCommentsCompanyAndPeopleById(Integer id);//查询审核个人企业互评论ById
	public Article findAuditInfoById(Integer id);//查询审核新闻ById
	public List<Message> findAuditOfferById(Integer id);//查询审核offerById
	public List<CompanyRecruit> findAuditRecruitmentById(Integer id);//查询审核招聘信息ById
	
	
	//管理员操作日志
	public List<AdminLog> findAdminLogAll(Integer page);//访问管理员日志,无参查询全部
	public List<AdminLog> findAdminLogByTime(String beginTime,String endTime,Integer page);//访问管理员日志,时间段查询
	public List<AdminLog> findAdminLogByTimeAndId(Integer userLoginId,String beginTime,String endTime,Integer page);//访问管理员日志,操作人ID&时间段查询
	public List<AdminLog> findAdminLogByIdAndDo(Integer userLoginId,Integer adminDo,Integer page);//访问管理员日志,操作人ID&操作类型查询
	public List<AdminLog> findAdminLogByTimeAndDo(String beginTime,String endTime,Integer adminDo,Integer page);//访问管理员日志,操作类型&时间段查询
	public List<AdminLog> findAdminLogByTimeAndDoAndId(Integer adminDo,Integer userLoginId,String beginTime,String endTime,Integer page);//访问管理员日志,全部类型查询
	
	public List<Company> findBestCompany();//最佳企业查询
	public List<Article> findBestArticle();//热门文章
	
	//用户管理
	public List<User> findUser(@Param("page")Integer page);//查询所有个人用户，用于禁用
	public List<Company> findCompany(@Param("page")Integer page);//查询所有企业用户，用于禁用
	public Integer disableUser(Integer userId,Integer userStatus);//禁用个人用户
	public Integer disableCompany(Integer companyId,Integer companyStatus);//禁用企业用户
	
	//信息维护--修改正在登录的管理员信息
	public Integer maIntegerainAdmin(Admin admin);//改
	public List<Admin> findByAdminId(Integer id);//查
	public int findMaxPage();//获得最大信息数
	public Integer trafficStatisticalPersonal(Integer year,Integer month,Integer day,String userId);//个人访问量统计判断是否有空值
	public Integer trafficStatisticalCompany(Integer year,Integer month,Integer day,String companyId);//企业访问量统计判断是否有空值
	
	public Integer messagePushArticle(Integer userId,Integer resendId,String articleContent,Timestamp messageSendTime,Integer messageResendStatus);//消息推送
	//登录&退出
	public Admin findLogin(String adminLoginId,String adminPassword);
	
	//企业访问数统计
	public Integer addCompanyVisitCount(Integer id,Integer companyYear,Integer companyMoth
			,Integer companyDay,Integer companyResumeCount,Integer companyInfoCount,Integer companyId);//自增记录
	public Integer updatecompanyVisitCount(CompanyVisitCount companyVisitCount);//修改记录
	public List<CompanyVisitCount> findAll(Integer page);//分页
	public List<CompanyVisitCount> findCompanyId(Integer companyId,Integer page);//查找企业id
	public List<CompanyVisitCount> findcompanyInfoCountAndcompanyResumeCount(//查找发表信息的数量和发表简历的数量
			Integer companyYear,Integer companyMonth
			,Integer companyDay,Integer companyId
			,Integer page);
	public Integer getMaxRecord();//获得信息量的最大值。
	
	//普通用户访问数统计
	//自增记录
	public Integer addUserVisitCount(Integer userYear,Integer userMonth,Integer UserDay,Integer userCommentCount,Integer userArticleCount,Integer userId);
	//查找最大信息条数
	public Integer findMaxPage(Integer page);
	//查找所有访问记录条数
    public List<UserVisitCount> findUserVisitAll(Integer page);
    //按年月日和用户id查找
    public List<UserVisitCount> findCount(Integer page,Integer userYear,Integer userMonth,Integer userDay,Integer userId);
    
}	

