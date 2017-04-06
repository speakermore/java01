package ynjh.company.enity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Article implements Serializable{
	/**
	 * 发表文章
	 */
	private static final long serialVersionUID = 1L;
	private Integer articleId; //文章id
	private Integer usersId;//1：企业id  2：用户id
	private String articleTitle;//文章标题
	private Timestamp articleTime;//评论时间
	private String articleKey;//文章关键字
	private Integer articleContent;//文章内容
	private Integer articleReadNum;//文章阅读数
	private Integer articleLikeNum;//文章点赞数
	private Integer articleStatus;//文章状态
	private Integer articleUsersType;//1：企业id  2：用户id
	
	public Article(){}
	public Article(Integer articleId, Integer usersId, String articleTitle,
			Timestamp articleTime, String articleKey, Integer articleContent,
			Integer articleReadNum, Integer articleLikeNum,
			Integer articleStatus, Integer articleUsersType) {
		super();
		this.articleId = articleId;
		this.usersId = usersId;
		this.articleTitle = articleTitle;
		this.articleTime = articleTime;
		this.articleKey = articleKey;
		this.articleContent = articleContent;
		this.articleReadNum = articleReadNum;
		this.articleLikeNum = articleLikeNum;
		this.articleStatus = articleStatus;
		this.articleUsersType = articleUsersType;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public Timestamp getArticleTime() {
		return articleTime;
	}
	public void setArticleTime(Timestamp articleTime) {
		this.articleTime = articleTime;
	}
	public String getArticleKey() {
		return articleKey;
	}
	public void setArticleKey(String articleKey) {
		this.articleKey = articleKey;
	}
	public Integer getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(Integer articleContent) {
		this.articleContent = articleContent;
	}
	public Integer getArticleReadNum() {
		return articleReadNum;
	}
	public void setArticleReadNum(Integer articleReadNum) {
		this.articleReadNum = articleReadNum;
	}
	public Integer getArticleLikeNum() {
		return articleLikeNum;
	}
	public void setArticleLikeNum(Integer articleLikeNum) {
		this.articleLikeNum = articleLikeNum;
	}
	public Integer getArticleStatus() {
		return articleStatus;
	}
	public void setArticleStatus(Integer articleStatus) {
		this.articleStatus = articleStatus;
	}
	public Integer getArticleUsersType() {
		return articleUsersType;
	}
	public void setArticleUsersType(Integer articleUsersType) {
		this.articleUsersType = articleUsersType;
	}
	public Integer getArticleId() {
		return articleId;
	}
	public Integer getUsersId() {
		return usersId;
	}
	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", usersId=" + usersId + ", articleTitle="
				+ articleTitle + ", articleTime=" + articleTime
				+ ", articleKey=" + articleKey + ", articleContent="
				+ articleContent + ", articleReadNum=" + articleReadNum
				+ ", articleLikeNum=" + articleLikeNum + ", articleStatus="
				+ articleStatus + ", articleUsersType=" + articleUsersType
				+ "]";
	}
	
	
	
	
}
