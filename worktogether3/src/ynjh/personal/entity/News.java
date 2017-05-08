package ynjh.personal.entity;

import java.io.Serializable;
/**
 * 最新动态
 * @author dage
 *
 */
public class News implements Serializable{

	private String companyId;	//公司名字
	private String userId;	//用户id
	private String companyRecruitTitle;	//发布的招聘职位
	private String artileTitle; //发送的文章信息
	private String commentArticle; //发送的评论
	
	public News(String companyId, String userId, String companyRecruitTitle, String artileTitle,
			String commentArticle) {
		super();
		this.companyId = companyId;
		this.userId = userId;
		this.companyRecruitTitle = companyRecruitTitle;
		this.artileTitle = artileTitle;
		this.commentArticle = commentArticle;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCompanyRecruitTitle() {
		return companyRecruitTitle;
	}
	public void setCompanyRecruitTitle(String companyRecruitTitle) {
		this.companyRecruitTitle = companyRecruitTitle;
	}
	public String getArtileTitle() {
		return artileTitle;
	}
	public void setArtileTitle(String artileTitle) {
		this.artileTitle = artileTitle;
	}
	public String getCommentArticle() {
		return commentArticle;
	}
	public void setCommentArticle(String commentArticle) {
		this.commentArticle = commentArticle;
	}
	@Override
	public String toString() {
		return "News [companyId=" + companyId + ", userId=" + userId + ", companyRecruitTitle=" + companyRecruitTitle
				+ ", artileTitle=" + artileTitle + ", commentArticle=" + commentArticle + "]";
	}

	
}
