package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class ArticleByFollow implements Serializable {
	private static final long serialVersionUID = -4729832154796619747L;
	// 用户id
	private Integer id;
	// 昵称
	private String userName;
	// 用户头像
	private String userHeadImgPath;
	// 用户生日
	private Timestamp userBirthday;
	// 用户等级
	private Integer userLevel;
	//文章ID
	private Integer articleId;
	// 用户名
	private Integer usersId;
	// 文章标题
	private String articleTitle;
	// 点赞数
	private Integer articleLikeNum;
	// 阅读数
	private Integer articleReadNum;
	// 发表日期
	private Timestamp articleTime;
	// 关键字
	private String articleKey;
	// 文章内容
	private String articleContent;
	// 关注者id(用户或企业id)
	private Integer followId;
	// 被关注者id(企业或用户的id)
	private Integer byFollowId;
	// 关注日期
	private Timestamp followDate;
	// 关注者类型：1.企业用户 2.个人用户
	private Integer followType;
	// 被关注者类型：1.企业用户 2.个人用户
	private Integer followStartType;
	
	public ArticleByFollow() {
	}

	public ArticleByFollow(Integer id, String userName, String userHeadImgPath, Timestamp userBirthday,
			Integer userLevel, Integer usersId, String articleTitle, Integer articleLikeNum, Integer articleReadNum,
			Timestamp articleTime, String articleKey, String articleContent, Integer followId, Integer byFollowId,
			Timestamp followDate, Integer followType, Integer followStartType) {
		super();
		this.id = id;
		this.userName = userName;
		this.userHeadImgPath = userHeadImgPath;
		this.userBirthday = userBirthday;
		this.userLevel = userLevel;
		this.usersId = usersId;
		this.articleTitle = articleTitle;
		this.articleLikeNum = articleLikeNum;
		this.articleReadNum = articleReadNum;
		this.articleTime = articleTime;
		this.articleKey = articleKey;
		this.articleContent = articleContent;
		this.followId = followId;
		this.byFollowId = byFollowId;
		this.followDate = followDate;
		this.followType = followType;
		this.followStartType = followStartType;
	}

	
	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Integer getFollowId() {
		return followId;
	}

	public void setFollowId(Integer followId) {
		this.followId = followId;
	}

	public Integer getByFollowId() {
		return byFollowId;
	}

	public void setByFollowId(Integer byFollowId) {
		this.byFollowId = byFollowId;
	}

	public Timestamp getFollowDate() {
		return followDate;
	}

	public void setFollowDate(Timestamp followDate) {
		this.followDate = followDate;
	}

	public Integer getFollowType() {
		return followType;
	}

	public void setFollowType(Integer followType) {
		this.followType = followType;
	}

	public Integer getFollowStartType() {
		return followStartType;
	}

	public void setFollowStartType(Integer followStartType) {
		this.followStartType = followStartType;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserHeadImgPath() {
		return userHeadImgPath;
	}

	public void setUserHeadImgPath(String userHeadImgPath) {
		this.userHeadImgPath = userHeadImgPath;
	}

	public Timestamp getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Timestamp userBirthday) {
		this.userBirthday = userBirthday;
	}

	public Integer getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(Integer userLevel) {
		this.userLevel = userLevel;
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

	@Override
	public String toString() {
		return "ArticleByFollow [id=" + id + ", userName=" + userName + ", userHeadImgPath=" + userHeadImgPath
				+ ", userBirthday=" + userBirthday + ", userLevel=" + userLevel + ", usersId=" + usersId
				+ ", articleTitle=" + articleTitle + ", articleLikeNum=" + articleLikeNum + ", articleReadNum="
				+ articleReadNum + ", articleTime=" + articleTime + ", articleKey=" + articleKey + ", articleContent="
				+ articleContent + ", followId=" + followId + ", byFollowId=" + byFollowId + ", followDate="
				+ followDate + ", followType=" + followType + ", followStartType=" + followStartType + "]";
	}
	
	
}
