package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 用于审核文章的实体类，与数据库无关
 * 
 * @author 牟勇
 *
 */
public class AuditArticle implements Serializable {
	private static final long serialVersionUID = -7380530599051858522L;
	private Integer id;// 文章id
	private Integer usersId;// 用户名
	private String userName;// 昵称
	private String articleTitle;// 文章标题
	private Integer articleLikeNum;// 点赞数
	private Integer articleReadNum;// 阅读数
	private Timestamp articleTime;// 发表日期
	private Integer articleStatus;// 状态
	private String articleKey;// 关键字
	private String articleContent;// 文章内容
	private Integer articleUsersType;// 用户类型1：企业 2：个人
	private String companyName;// 公司名称

	public AuditArticle() {

	}
	
	public AuditArticle(Integer usersId, String userName, String articleTitle, Integer articleLikeNum,
			Integer articleReadNum, Timestamp articleTime, Integer articleStatus, String articleKey,
			String articleContent, Integer articleUsersType, String companyName) {
		super();
		this.usersId = usersId;
		this.userName = userName;
		this.articleTitle = articleTitle;
		this.articleLikeNum = articleLikeNum;
		this.articleReadNum = articleReadNum;
		this.articleTime = articleTime;
		this.articleStatus = articleStatus;
		this.articleKey = articleKey;
		this.articleContent = articleContent;
		this.articleUsersType = articleUsersType;
		this.companyName = companyName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUsersId() {
		return usersId;
	}

	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public Integer getArticleLikeNum() {
		return articleLikeNum;
	}

	public void setArticleLikeNum(Integer articleLikeNum) {
		this.articleLikeNum = articleLikeNum;
	}

	public Integer getArticleReadNum() {
		return articleReadNum;
	}

	public void setArticleReadNum(Integer articleReadNum) {
		this.articleReadNum = articleReadNum;
	}

	public Timestamp getArticleTime() {
		return articleTime;
	}

	public void setArticleTime(Timestamp articleTime) {
		this.articleTime = articleTime;
	}

	public Integer getArticleStatus() {
		return articleStatus;
	}

	public void setArticleStatus(Integer articleStatus) {
		this.articleStatus = articleStatus;
	}

	public String getArticleKey() {
		return articleKey;
	}

	public void setArticleKey(String articleKey) {
		this.articleKey = articleKey;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public Integer getArticleUsersType() {
		return articleUsersType;
	}

	public void setArticleUsersType(Integer articleUsersType) {
		this.articleUsersType = articleUsersType;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Override
	public String toString() {
		return "AuditArticle [id=" + id + ", usersId=" + usersId + ", userName=" + userName + ", articleTitle="
				+ articleTitle + ", articleLikeNum=" + articleLikeNum + ", articleReadNum=" + articleReadNum
				+ ", articleTime=" + articleTime + ", articleStatus=" + articleStatus + ", articleKey=" + articleKey
				+ ", articleContent=" + articleContent + ", articleUsersType=" + articleUsersType + ", companyName="
				+ companyName + "]";
	}

}
