package ynjh.admin.dao.admin;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Company;
import ynjh.personal.entity.User;
import ynjh.personal.entity.Work;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AuditArticle;
import ynjh.admin.entity.SystemMessage;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyRecruit;
import ynjh.company.entity.Offer;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Message;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
/**
 * Admin功能的数据访问层
 * @author 周富强
 *
 */
public interface AdminMapper {
	/**
	 * 禁用个人用户后的（查询）显示效果
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	public List<User> findUser(@Param("page") Integer page); 
	/**
	 * 禁用企业用户后的（查询）显示效果
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	public List<Company> findCompany(@Param("page") Integer page);
	/**
	 * 禁用个人用户
	 * @author 周富强
	 * @param userId 个人用户id
	 * @param userStatus 个人用户状态
	 * @return
	 */
	public Integer disableUser(@Param("userId") Integer userId, @Param("userStatus") Integer userStatus);
	/**
	 * 禁用企业用户
	 * @author 
	 * @param companyId 企业id
	 * @param companyStatus 企业用户状态
	 * @return
	 */
	public Integer disableCompany(@Param("companyId") Integer companyId, @Param("companyStatus") Integer companyStatus);
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
	public Integer auditResume(@Param("id")Integer id,@Param("resumeStatusThree")Integer resumeStatusThree);
	/**
	 * 查询审核简历
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	public List<Resume> findAuditResume(@Param("page") Integer page);
	/**
	 * 审核文章
	 * @author 周富强
	 * @param articleId 文章id
	 * @param articleStatus 信息状态
	 * @return
	 */
	public Integer auditArticle(@Param("articleId") Integer articleId, @Param("articleStatus") Integer articleStatus);// 审核文章
	/**
	 * 
	   * @Name: findAuditArticle // 查询审核文章
	   * @Description: @param page 偏移量
	   * @Description: @return
	   * @Author:曾瑞（作者）
	   * @Version: V1.00 （版本号）
	   * @Create Date: 2017年4月21日上午10:48:30
	 */
	public List<AuditArticle> findAuditArticle(@Param("page") Integer page);// 查询审核文章
	/**
	 * 
	 * 审核文章评论
	 * @author 周富强
	 * @param id 文章评论id
	 * @param commentArticleStatus 文章评论审核状态
	 * @return
	 */
	public Integer auditCommentsArticle(@Param("id")Integer id,@Param("commentArticleStatus")Integer commentArticleStatus);//审核文章评论
	/**
	 * 
	   * @Name: findAuditCommentsArticle // 查询审核文章评论
	   * @Description: @param page 偏移量
	   * @Description: @return
	   * @Author: 曾瑞（作者）
	   * @Version: V1.00 （版本号）
	   * @Create Date: 2017年4月21日上午10:49:12
	 */
	public List<CommentArticle> findAuditCommentsArticle(Integer page);// 查询审核文章评论
	/**
	 * 审核企业资质
	 * @author 周富强
	 * @param companyId 企业id
	 * @param cmpIntegerStatus  企业发表待审核状态
	 * @return
	 */
	public Integer auditCompany(@Param("id") Integer id,
			@Param("companyIntStatus") Integer companyIntStatus);
	/**
	 * 查询审核企业资质
	 * @author 周富强
	 * @param 偏移量
	 * @return
	 */
	public List<Company> findAuditCompany(Integer page);// 查询审核企业资质
	/**
	 * 
	 * @author 周富强
	 * @param id
	 * @param companyIntStatus
	 * @return
	 */
	public Integer auditCompanyNo(@Param("id") Integer id,
			@Param("companyIntStatus") Integer companyIntStatus);// 审核企业资质
	/**
	 * 审核个人企业互评
	 * @author 周富强
	 * @param id 个人企业互评id
	 * @param discussStatus 待审核状态
	 * @return
	 */
	
	public Integer auditCommentsCompanyAndPeople(@Param("id")Integer id,@Param("discussStatus")Integer discussStatus);//审核个人企业互评论
	/**
	 * 查询审核个人企业互评论
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	public List<Discuss> findAuditCommentsCompanyAndPeople(Integer page);// 查询审核个人企业互评论
	/**
	 * 审核新闻
	 * @author 周富强
	 * @param InfoId 新闻id
	 * @param cmpInfStatus 待审核状态
	 * @return
	 */
	public Integer auditInfo(@Param("id") Integer id, @Param("messageSendStatus") Integer messageSendStatus);// 审核新闻
	/**
	 * 查询审核新闻
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	public List<Message> findAuditInfo(Integer page);// 查询审核新闻
	/**
	 * 审核offer
	 * @author 周富强
	 * @param id offer的id
	 * @param offerType  
	 * @return
	 */
	public Integer auditOffer(@Param("id") Integer id, @Param("offerType") Integer offerType);// 审核offer
	/**
	 * 查询审核offer
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */	
	public List<Offer> findAuditOffer(Integer page);// 查询审核offer
	/**
	 * 审核招聘信息
	 * @author 周富强
	 * @param recruitmentId 招聘信息id
	 * @param cmpRecStatus 
	 * @return
	 */
	public Integer auditRecruitment(@Param("id") Integer id,
			@Param("cmpRecStatus") Integer cmpRecStatus);// 审核招聘信息
	/**
	 * 查询审核招聘信息
	 * @author 周富强
	 * @param page 偏移量
	 * @return
	 */
	public List<CompanyRecruit> findAuditRecruitment(Integer page);// 查询审核招聘信息
	/**
	 * 查询审核招聘信息ById
	 * @author 周富强
	 * @param id 招聘信息的id
	 * @return
	 */	
	public List<CompanyRecruit> findAuditRecruitmentById(Integer id);// 查询审核招聘信息依据Id
	/**
	 * 查询审核offer的id
	 * @author 周富强
	 * @param id offer的id
	 * @return
	 */
	public Offer findAuditOfferById(Integer id);// 查询审核offer依据Id

	/**
	 *  查询审核新闻依据Id
	 *  @author 周富强
	 * @param id 新闻id
	 * @return
	 */
	public Message findAuditInfoById(Integer id);// 查询审核新闻依据Id
	/**
	 * 查询审核个人企业互评论ById
	 * @author 周富强
	 * @param id 个人企业互评id
	 * @return
	 */
	public Discuss findAuditCommentsCompanyAndPeopleById(Integer id);// 查询审核个人企业互评论依据Id
	/**
	 * 查询审核企业资质ById
	 * @author 周富强
	 * @param page 偏移量
	 * @return 
	 */
	public Company findAuditCompanyById(Integer id);// 查询审核企业资质依据Id

	public CommentArticle findAuditCommentsArticleById(Integer id);// 查询审核文章评论依据id

	public AuditArticle findAuditArticleById(Integer id);// 查询审核文章依据id
	/**
	 * 审核--查询审核简历ById
	 * @author 周富强
	 * @param id 简历id
	 * @return
	 */
	public Resume findAuditResumeById(Integer id);//查询审核简历依据id

	// 信息维护--修改正在登录的管理员信息
	/**
	 * 查找最大条数
	 * @author 
	 */
	public Integer findMaxPage();//查找admin表中信息条数
	/**
	 * 登录的管理员，自我信息修改
	 * @author 
	 * @param admin 管理员对象
	 * @param session
	 * @return
	 */
	public Integer maIntegerainAdmin(Admin admin);// 改
	/**
	 * 通过用户id查看修改后的内容
	 * @author 朱吉
	 * @param id 用户id
	 * @return
	 */
	public List<Admin> findByAdminId(Integer adminId);// 查
	/**
	 * 消息推送
	 * @author 周富强
	 * @param userid
	 * @param resendId
	 * @param articleContent
	 * @param messageSendTime
	 * @param messageResendStatus
	 */
	public Integer messagePushArticle(@Param("userId")Integer userId,@Param("resendId")Integer resendId,@Param("messageContent")String messageContent,@Param("messageSendTime")Timestamp messageSendTime,@Param("messageResendStatus")Integer messageResendStatus);//消息推送
	/**
	 * 个人热门文章查询
	 * @author 张宇
	 */
	public List<Article> findPersonBestArticle();// 个人热门文章
	/**
	 * 企业热门文章查询
	 * @author 张宇
	 */
	public List<Article> findCompanyBestArticle();// 企业热门文章
	/**
	 * 查找最佳企业id
	 * @author 朱吉
	 * @return
	 */
	public List<Integer> findCompanyId();// 最佳企业id
	/**
	 * 通过企业登录id查找企业
	 * @author 朱吉
	 * @param companyLoginId 企业登录id
	 * @return
	 */
	public Company findCompanyById(Integer companyLoginId);// 找到企业
	
	/**
	 * 登录时查找管理员
	 * @author 曾瑞
	 * @param adminLoginId
	 * @param adminPassword
	 * @return
	 */
	public Admin findLogin(@Param("adminLoginId")String adminLoginId,@Param("adminPassword")String adminPassword);
	
	/**
	 * 根据管理员登录名查找管理员
	 * @author 朱吉
	 * @param adminLoginId
	 * @return
	 */
	public Admin findLoginByAdminLoginId(String adminLoginId);
	/**
	 * 5条导航显示简历
	 * @author 朱吉
	 */
	public List<Resume> find5Resumes();
	/**
	 * 5条导航显示文章
	 * @author 朱吉
	 */  
    public List<Article> find5Articles();
    /**
     * 5条个人企业简历互评
     * @author 朱吉
     */
    public List<Discuss> find5Discuss();
    
    /**
     * 系统消息
     * @author 曾瑞
     */
    public Integer addMessage(SystemMessage systemMessage);
    
    /**
     * 查询简历工作经历
     * @author 朱吉
     * @param resumeId
     * @return
     */
    public List<Work> findResumeWork(String resumeId);
    
    /**
     * 查询简历项目经验
     * @author 朱吉
     * @param resumeId
     * @return
     */
    public List<Project> findResumeProject(String resumeId);
    
    /**
     * 查找培训经历
     * @author 朱吉
     * @param resumeId
     * @return
     */
    public List<Education> findResumeEducation(String resumeId);
    
    /**
     * 审核简历的工作经历
     * @author 朱吉
     * @param resumeId 简历编号
     * @param resumeType 审核结果
     * @return
     */
    public Integer auditingWork(@Param("resumeId")String resumeId,@Param("resumeType")Integer resumeType);
    
    /**
     * 审核简历的项目经历
     * @author 朱吉
     * @param resumeId 简历编号
     * @param resumeType 审核结果
     * @return
     */
    public Integer auditingProject(@Param("resumeId")String resumeId,@Param("resumeType")Integer resumeType);
    
    /**
     * 审核简历的培训经历
     * @author 朱吉
     * @param resumeId 简历编号
     * @param resumeType 审核结果
     * @return
     */
    public Integer auditingEducation(@Param("resumeId")String resumeId,@Param("resumeType")Integer resumeType);
}
