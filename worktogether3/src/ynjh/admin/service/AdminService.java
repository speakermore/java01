package ynjh.admin.service;



import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.SysMessageWithAuthor;
import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
import ynjh.admin.entity.AuditArticle;
import ynjh.admin.entity.AuditComIntro;
import ynjh.admin.entity.AuditOffer;
import ynjh.admin.entity.CompanyVisitCount;
import ynjh.admin.entity.SystemMessage;
import ynjh.admin.entity.UserVisitCount;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyDetailImg;
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



public interface AdminService {
	//审核简历
	public Integer auditResume(Integer id,Integer status);
	//查询审核简历
	public List<Resume> findAuditResume(@Param("page") Integer page);
	//审核文章
	public Integer auditArticle(Integer articleId,Integer articleStatus);
	//查询审核文章
	public List<AuditArticle> findAuditArticle(@Param("page") Integer page);
	//审核文章评论
	public Integer auditCommentsArticle(Integer[] id,Integer commentsArticleStatus);
	//查询审核文章评论
	public List<CommentArticle> findAuditCommentsArticle(Integer page);
	//审核企业资质
	public Integer auditCompany(Integer companyId,Integer cmpIntegerStatus);
	//查询审核企业资质
	public List<Company> findAuditCompany(Integer page);
	//审核个人企业互评论
	public Integer auditCommentsCompanyAndPeople(Integer[] id,Integer discussStatus);
	//查询审核个人企业互评论
	public List<Discuss> findAuditCommentsCompanyAndPeople(Integer page);
	//审核新闻
	public Integer auditInfo(Integer InfoId,Integer cmpInfStatus);
	//查询审核新闻
	public List<AuditArticle> findAuditComArticle(Integer page);
	//审核offer
	public Integer auditOffer(Integer[] id,Integer offerStatus);
	//查询审核offer
	public List<AuditOffer> findAuditOffer(Integer page);
	//审核招聘信息
	public Integer auditRecruitment(Integer[] recruitmentId,Integer cmpRecStatus);
	//查询审核招聘信息
	public List<CompanyRecruit> findAuditRecruitment(Integer page);
	//查询审核简历ById
	public Resume findAuditResumeById(Integer id);
	//查询审核文章ById
	public AuditArticle findAuditArticleById(Integer id);
	//查询审核文章评论ById
	public CommentArticle findAuditCommentsArticleById(Integer id);
	//查询审核企业资质ById
	public Company findAuditCompanyById(Integer id);
	//查询审核个人企业互评论ById
	public Discuss findAuditCommentsCompanyAndPeopleById(Integer id);
	//查询审核新闻ById
	public Message findAuditInfoById(Integer id);
	//查询审核offerById
	public Offer findAuditOfferById(Integer id);
	//查询审核招聘信息ById
	public CompanyRecruit findAuditRecruitmentById(Integer id);
	//查询工作经历
	public List<Work> findResumeWork(String resumeId);
	//查询项目经历
	public List<Project> findResumeProject(String resumeId);
	//查询培训经历
	public List<Education> findResumeEducation(String resumeId);
	

	public List<AdminLog> findAdminLogAll(Integer page);//访问管理员日志,无参查询全部
	//访问管理员日志,全部类型查询
	public List<AdminLog> findAdminLogByTimeAndDoAndId(Integer adminDo,Integer userLoginId,String beginTime,String endTime,Integer page);
	
	//最佳企业查询
	public List<Company> findBestCompany();
	
	//个人热门文章查询
	public List<AuditArticle> findPersonBestArticle();
	//企业热门文章查询
	public List<Article> findCompanyBestArticle();
	
	//用户管理
	//查询所有个人用户，用于禁用
	public List<User> findUser(@Param("page")Integer page);
	//查询所有企业用户，用于禁用
	public List<Company> findCompany(@Param("page")Integer page);
	//禁用个人用户
	public Integer disableUser(Integer userId,Integer userStatus);
	//禁用企业用户
	public Integer disableCompany(Integer companyId,Integer companyStatus);
	
	//信息维护--修改正在登录的管理员信息
	//改
	public Integer maIntegerainAdmin(Admin admin);
	//查
	public List<Admin> findByAdminId(Integer id);
	//获得最大信息数
	public int findMaxPage();
	//个人访问量统计判断是否有空值
	public Integer trafficStatisticalPersonal(Integer year,Integer month,Integer day,String userId);
	//企业访问量统计判断是否有空值
	public Integer trafficStatisticalCompany(Integer year,Integer month,Integer day,String companyId);
	//消息推送
	public Integer messagePushArticle(Integer userId,Integer resendId,String articleContent,Timestamp messageSendTime,Integer messageResendStatus);
	//登录&退出
	public Admin findLogin(String adminLoginId,String adminPassword);
	//根据管理员登录名查找管理员
	public Admin findLoginByAdminLoginId(String adminLoginId);
	
	//企业访问数统计
	//自增记录
	public Integer addCompanyVisitCount(Integer id,Integer companyYear,Integer companyMoth
			,Integer companyDay,Integer companyResumeCount,Integer companyInfoCount,Integer companyId);
	//修改记录
	public Integer updatecompanyVisitCount(CompanyVisitCount companyVisitCount);
	//分页
	public List<CompanyVisitCount> findAll(Integer page);
	//查找企业id
	public List<CompanyVisitCount> findCompanyId(Integer companyId,Integer page);
	//查找发表信息的数量和发表简历的数量
	public List<CompanyVisitCount> findcompanyInfoCountAndcompanyResumeCount(
			Integer companyYear,Integer companyMonth
			,Integer companyDay,Integer companyId
			,Integer page);
	//获得信息量的最大值
	public Integer getMaxRecord();
	
	//普通用户访问数统计
	//自增记录
	public Integer addUserVisitCount(Integer userYear,Integer userMonth,Integer UserDay,Integer userCommentCount,Integer userArticleCount,Integer userId);
	//查找最大信息条数
	public Integer findMaxPage(Integer page);
	//查找所有访问记录条数
    public List<UserVisitCount> findUserVisitAll(Integer page);
    //按年月日和用户id查找
    public List<UserVisitCount> findCount(Integer page,Integer userYear,Integer userMonth,Integer userDay,Integer userId);
    
    //首页
    //5条导航显示简历
    public List<Resume> find5Resumes();
    //5条导航显示文章
    public List<Article> find5Articles();
    //5条个人企业互评审核
    public List<Discuss> find5Discuss();
    
    //系统消息推送
    public Integer addMessage(SystemMessage systemMessage);
    //查找管理员，通过管理员帐号
	public Integer findAdminByAdminLoginId(String adminLoginId);
	//查找个人用户，通过用户id
	public User findUserById(Integer userId);
	//查找企业简介
	public List<AuditComIntro> findCompanyIntro(Integer page);
	//通过id查找审核企业
	public AuditComIntro findAuditComById(Integer id);
	//通过id查找审核企业照片
	public List<CompanyDetailImg> findCompanyImgById(Integer id);
	//审核企业基本信息
	public Integer auditCompanyInfo(Integer companyId, Integer cmpIntStatus);
	//查找需要禁用的个人用户
	public List<User> findDisabledUser();
	//查找需要禁用的企业用户
	public List<Company> findDisabledCompany();
	//通过账号查找企业
	public Company findCompanyByLoginId(String companyLoginId);
	//通过账号查找用户
	public User findUserByLoginId(String userLoginId);
	//用户管理，通过个人用户id禁用/解禁用户
	public Integer personalMag(Integer[] ids, Integer userStatus);
	//查找带有作者的系统消息
	public List<SysMessageWithAuthor> findSysMsgWithAuth();
	//新增管理员日志
	public void addAdminLog(AdminLog adminLog);

}	

