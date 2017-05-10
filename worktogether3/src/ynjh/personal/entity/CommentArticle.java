package ynjh.personal.entity;

import java.io.Serializable;
/**
 * @author 胡林飞
 * 评论文章表，与commentArticle表对应
 */
import java.sql.Timestamp;

public class CommentArticle implements Serializable {
	// id
	private Integer id;
	// 文章ID
	private Integer articleId;
	// 用户id
	private Integer usersId;
	// 评论时间
	private Timestamp commentArticleTime;
	// 评论内容
	private String commentArticleContent;
	// 点赞数
	private Integer commentArticleLikeNum;
	// 评论文章状态1：等待审核 2：正常3：审核不通过 4：隐藏
	private Integer commentArticleStatus;
	// 用户类型
	private Integer commentArticleUsersType;
	// 昵称
	private String userName;
	// 用户名
	private String userLoginId;
	// 用户头像
	private String userHeadImgPath;

	public CommentArticle() {

	}

	

	public CommentArticle(Integer id, Integer articleId, Integer usersId, Timestamp commentArticleTime,
			String commentArticleContent, Integer commentArticleLikeNum, Integer commentArticleStatus,
			Integer commentArticleUsersType, String userName, String userLoginId, String userHeadImgPath) {
		super();
		this.id = id;
		this.articleId = articleId;
		this.usersId = usersId;
		this.commentArticleTime = commentArticleTime;
		this.commentArticleContent = commentArticleContent;
		this.commentArticleLikeNum = commentArticleLikeNum;
		this.commentArticleStatus = commentArticleStatus;
		this.commentArticleUsersType = commentArticleUsersType;
		this.userName = userName;
		this.userLoginId = userLoginId;
		this.userHeadImgPath = userHeadImgPath;
	}



	public String getUserLoginId() {
		return userLoginId;
	}

	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
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

	public Integer getCommentArticleUsersType() {
		return commentArticleUsersType;
	}

	public void setCommentArticleUsersType(Integer commentArticleUsersType) {
		this.commentArticleUsersType = commentArticleUsersType;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Timestamp getCommentArticleTime() {
		return commentArticleTime;
	}

	public void setCommentArticleTime(Timestamp commentArticleTime) {
		this.commentArticleTime = commentArticleTime;
	}

	public String getCommentArticleContent() {
		return commentArticleContent;
	}

	public void setCommentArticleContent(String commentArticleContent) {
		this.commentArticleContent = commentArticleContent;
	}

	public Integer getCommentArticleLikeNum() {
		return commentArticleLikeNum;
	}

	public void setCommentArticleLikeNum(Integer commentArticleLikeNum) {
		this.commentArticleLikeNum = commentArticleLikeNum;
	}

	public Integer getCommentArticleStatus() {
		return commentArticleStatus;
	}

	public void setCommentArticleStatus(Integer commentArticleStatus) {
		this.commentArticleStatus = commentArticleStatus;
	}

	@Override
	public String toString() {
		return "CommentArticle [id=" + id + ", articleId=" + articleId + ", usersId=" + usersId
				+ ", commentArticleTime=" + commentArticleTime + ", commentArticleContent=" + commentArticleContent
				+ ", commentArticleLikeNum=" + commentArticleLikeNum + ", commentArticleStatus=" + commentArticleStatus
				+ ", commentArticleUsersType=" + commentArticleUsersType + ", userName=" + userName + ", userLoginId="
				+ userLoginId + ", userHeadImgPath=" + userHeadImgPath + "]";
	}

}
