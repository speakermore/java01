package ynjh.admin.dao.admin;

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

	// public Integer auditResume(Integer id,Integer status);//审核简历
	// public List<Resume> findAuditResume(Integer page);//查询审核简历
	public Integer auditArticle(@Param("articleId") Integer articleId, @Param("articleStatus") Integer articleStatus);// 审核文章

	public List<Article> findAuditArticle(Integer page);// 查询审核文章

	public Integer auditCommentsArticle(@Param("CAId") Integer CAId,
			@Param("commentsArticleStatus") Integer commentsArticleStatus);// 审核文章评论

	public List<CommentArticle> findAuditCommentsArticle(Integer page);// 查询审核文章评论

	public Integer auditCompany(@Param("companyId") Integer companyId,
			@Param("cmpIntegerStatus") Integer cmpIntegerStatus);// 审核企业资质

	public List<Company> findAuditCompany(Integer page);// 查询审核企业资质

	public Integer auditCommentsCompanyAndPeople(@Param("CCPId") Integer CCPId,
			@Param("discussStatus") Integer discussStatus);// 审核个人企业互评论

	public List<Discuss> findAuditCommentsCompanyAndPeople(Integer page);// 查询审核个人企业互评论

	public Integer auditInfo(@Param("InfoId") Integer InfoId, @Param("cmpInfStatus") Integer cmpInfStatus);// 审核新闻

	public List<Article> findAuditInfo(Integer page);// 查询审核新闻

	public Integer auditOffer(@Param("offerId") Integer offerId, @Param("offerStatus") Integer offerStatus);// 审核offer

	public List<Message> findAuditOffer(Integer page);// 查询审核offer

	public Integer auditRecruitment(@Param("recruitmentId") Integer recruitmentId,
			@Param("cmpRecStatus") Integer cmpRecStatus);// 审核招聘信息

	public List<CompanyRecruit> findAuditRecruitment(Integer page);// 查询审核招聘信息

	// 信息维护--修改正在登录的管理员信息
	public Integer maIntegerainAdmin(@Param("adminName") String adminName, @Param("adminTel") String adminTel,
			@Param("adminEmail") String adminEmail);// 改

	public List<Admin> findByAdminId(String adminId);// 查

	// public Integer messagePush(String message,Integer status);//消息推送

	public List<Article> findBestArticle();// 热门文章

	public List<Integer> findCompanyId();// 最佳企业id

	public Company findCompanyById(Integer companyLoginId);// 找到企业

}
