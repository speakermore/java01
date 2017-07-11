package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 最新文章评论
 * @author dage
 *
 */
public class ArticleByComment extends User implements Serializable{
	private static final long serialVersionUID = -748763666186818454L;
		//id
		private Integer id;
		//文章标题
		private String articleTitle;
		//点赞数
		private Integer articleLikeNum;
		//阅读数
		private Integer articleReadNum;
		//发表日期
		private Timestamp articleTime;
		//状态
		private Integer articleStatus;
		//关键字
		private String articleKey;
		//文章内容
		private String articleContent;
		//用户状态1：企业 2：个人
		private Integer articleUsersType;
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
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
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
		public Integer getCommentArticleUsersType() {
			return commentArticleUsersType;
		}
		public void setCommentArticleUsersType(Integer commentArticleUsersType) {
			this.commentArticleUsersType = commentArticleUsersType;
		}
		@Override
		public String toString() {
			return "ArticleByComment [id=" + id + ", articleTitle=" + articleTitle + ", articleLikeNum="
					+ articleLikeNum + ", articleReadNum=" + articleReadNum + ", articleTime=" + articleTime
					+ ", articleStatus=" + articleStatus + ", articleKey=" + articleKey + ", articleContent="
					+ articleContent + ", articleUsersType=" + articleUsersType + ", articleId=" + articleId
					+ ", usersId=" + usersId + ", commentArticleTime=" + commentArticleTime + ", commentArticleContent="
					+ commentArticleContent + ", commentArticleLikeNum=" + commentArticleLikeNum
					+ ", commentArticleStatus=" + commentArticleStatus + ", commentArticleUsersType="
					+ commentArticleUsersType + "]";
		}

}
