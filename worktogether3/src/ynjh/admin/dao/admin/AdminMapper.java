package ynjh.admin.dao.admin;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Company;
import ynjh.personal.entity.User;
import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.Admin;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyRecruit;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.Message;
import ynjh.personal.entity.Resume;

public interface AdminMapper {
	public List<User> findUser(@Param("page") Integer page); // 查找所有用户

	public List<Company> findCompany(@Param("page") Integer page);// 查找所有企业用户
	// 禁用普通用户

	public Integer disableUser(@Param("userId") Integer userId, @Param("userStatus") Integer userStatus);

	// 禁用企业用户
	public Integer disableCompany(@Param("companyId") Integer companyId, @Param("companyStatus") Integer companyStatus);

	public Integer auditResume(@Param("id")Integer id,@Param("resumeStatusThree")Integer resumeStatusThree);//审核简历
	public List<Resume> findAuditResume(Integer page);//查询审核简历
	public Integer auditArticle(@Param("articleId") Integer articleId, @Param("articleStatus") Integer articleStatus);// 审核文章

	public List<Article> findAuditArticle(Integer page);// 查询审核文章

	public Integer auditCommentsArticle(@Param("id")Integer id,@Param("commentArticleStatus")Integer commentArticleStatus);//审核文章评论

	public List<CommentArticle> findAuditCommentsArticle(Integer page);// 查询审核文章评论

	public Integer auditCompany(@Param("companyId") Integer companyId,
			@Param("cmpIntegerStatus") Integer cmpIntegerStatus);// 审核企业资质

	public List<Company> findAuditCompany(Integer page);// 查询审核企业资质

	public Integer auditCommentsCompanyAndPeople(@Param("id")Integer id,@Param("discussStatus")Integer discussStatus);//审核个人企业互评论

	public List<Discuss> findAuditCommentsCompanyAndPeople(Integer page);// 查询审核个人企业互评论

	public Integer auditInfo(@Param("InfoId") Integer InfoId, @Param("cmpInfStatus") Integer cmpInfStatus);// 审核新闻

	public List<Article> findAuditInfo(Integer page);// 查询审核新闻

	public Integer auditOffer(@Param("id") Integer id, @Param("offerType") Integer offerType);// 审核offer
	
	public List<Message> findAuditOffer(Integer page);// 查询审核offer

	public Integer auditRecruitment(@Param("id") Integer id,
			@Param("cmpRecStatus") Integer cmpRecStatus);// 审核招聘信息

	public List<CompanyRecruit> findAuditRecruitment(Integer page);// 查询审核招聘信息
	
	public List<CompanyRecruit> findAuditRecruitmentById(Integer id);// 查询审核招聘信息依据Id

	public List<Message> findAuditOfferById(Integer id);// 查询审核offer依据Id

	public List<Article> findAuditInfoById(Integer id);// 查询审核新闻依据Id

	public List<Discuss> findAuditCommentsCompanyAndPeopleById(Integer id);// 查询审核个人企业互评论依据Id

	public List<Company> findAuditCompanyById(Integer id);// 查询审核企业资质依据Id

	public List<CommentArticle> findAuditCommentsArticleById(Integer id);// 查询审核文章评论依据id

	public List<Article> findAuditArticleById(Integer id);// 查询审核文章依据id

	public List<Resume> findAuditResumeById(Integer id);//查询审核简历依据id

	// 信息维护--修改正在登录的管理员信息
	public Integer findMaxPage();//查找admin表中信息条数
	
	public Integer maIntegerainAdmin(Admin admin);// 改

	public List<Admin> findByAdminId(Integer adminId);// 查

	public Integer messagePushArticle(@Param("userId")Integer userId,@Param("resendId")Integer resendId,@Param("messageContent")String messageContent,@Param("messageSendTime")Timestamp messageSendTime,@Param("messageResendStatus")Integer messageResendStatus);//消息推送

	public List<Article> findBestArticle();// 热门文章

	public List<Integer> findCompanyId();// 最佳企业id

	public Company findCompanyById(Integer companyLoginId);// 找到企业
	
	//登录&退出
	public Admin findLogin(@Param("adminLoginId")String adminLoginId,@Param("adminPassword")String adminPassword);

}
