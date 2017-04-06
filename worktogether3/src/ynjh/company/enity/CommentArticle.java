package ynjh.company.enity;

import java.io.Serializable;
import java.sql.Timestamp;

public class CommentArticle implements Serializable{
	/**
	 * 评论文章
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer articleId; //文章id
	private Integer usersId; //1：企业id  2：用户id
	private Timestamp commentArticleTime; //评论时间
	private String commentArticleContent; //评论文章内容
	private Integer commentArticleLikeNum; //评论文章点赞数
	private Integer commentArticleStatus; //评论文章状态
	
	public CommentArticle(){}
	public CommentArticle(Integer id, Integer articleId, Integer usersId,
			Timestamp commentArticleTime, String commentArticleContent,
			Integer commentArticleLikeNum, Integer commentArticleStatus) {
		super();
		this.id = id;
		this.articleId = articleId;
		this.usersId = usersId;
		this.commentArticleTime = commentArticleTime;
		this.commentArticleContent = commentArticleContent;
		this.commentArticleLikeNum = commentArticleLikeNum;
		this.commentArticleStatus = commentArticleStatus;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Integer getId() {
		return id;
	}
	public Integer getArticleId() {
		return articleId;
	}
	public Integer getUsersId() {
		return usersId;
	}
	@Override
	public String toString() {
		return "CommentArticle [id=" + id + ", articleId=" + articleId
				+ ", usersId=" + usersId + ", commentArticleTime="
				+ commentArticleTime + ", commentArticleContent="
				+ commentArticleContent + ", commentArticleLikeNum="
				+ commentArticleLikeNum + ", commentArticleStatus="
				+ commentArticleStatus + "]";
	}
}
