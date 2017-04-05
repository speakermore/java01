package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Article implements Serializable{
	private Integer articleId;//文章id
	private Integer usersId;//用户名
	private String articleTitle;//文章标题
	private Integer articleLikeNum;//点赞数
	private Integer articleReadNum;//阅读数
	private Timestamp articleTime;//发表日期
	private Integer articleStatus;//状态
	private String articleKey;//关键字
	private String articleContent;//文章内容
	private Integer articleUsersType;//用户状态1：企业 2：个人
	
	public Article(){
		
	}

	public Article(Integer articleId, Integer usersId, String articleTitle, Integer articleLikeNum, Integer articleReadNum,
			Timestamp articleTime, Integer articleStatus, String articleKey, String articleContent, Integer articleUsersType) {
		super();
		this.articleId = articleId;
		this.usersId = usersId;
		this.articleTitle = articleTitle;
		this.articleLikeNum = articleLikeNum;
		this.articleReadNum = articleReadNum;
		this.articleTime = articleTime;
		this.articleStatus = articleStatus;
		this.articleKey = articleKey;
		this.articleContent = articleContent;
		this.articleUsersType = articleUsersType;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Integer getUsersId() {
		return usersId;
	}

	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
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

	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", usersId=" + usersId + ", articleTitle=" + articleTitle
				+ ", articleLikeNum=" + articleLikeNum + ", articleReadNum=" + articleReadNum + ", articleTime="
				+ articleTime + ", articleStatus=" + articleStatus + ", articleKey=" + articleKey + ", articleContent="
				+ articleContent + ", articleUsersType=" + articleUsersType + "]";
	}
	
}
