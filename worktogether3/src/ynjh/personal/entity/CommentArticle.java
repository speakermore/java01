package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class CommentArticle implements Serializable{
	private Integer id;//id
	private Integer articleId;//文章ID
	private Integer usersId;//用户id
	private Timestamp commentArticleTime;//评论时间
	private String commentArticleContent;//评论内容
	private Integer commentArticleLikeNum;//点赞数
	private Integer commentArticleStatus;//评论文章状态1：等待审核  2：审核通过3：审核不通过 4：删除
	private Integer commentArticleUsersType;
	public CommentArticle(){
		
	}

	public CommentArticle(Integer id, Integer articleId, Integer usersId, Timestamp commentArticleTime,
			String commentArticleContent, Integer commentArticleLikeNum, Integer commentArticleStatus) {
		super();
		this.id = id;
		this.articleId = articleId;
		this.usersId = usersId;
		this.commentArticleTime = commentArticleTime;
		this.commentArticleContent = commentArticleContent;
		this.commentArticleLikeNum = commentArticleLikeNum;
		this.commentArticleStatus = commentArticleStatus;
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
				+ "]";
	}
	
}
