package ynjh.company.entity;

public class LikeNum {
	
	private Integer articleId=null;//文章id
	private Integer usersId;//用户id
	private Integer commentArticleId=null;//评论文章id
	private Integer usersIdType;//1.企业id 2.用户id
	
	public LikeNum(){}
	
	public LikeNum(Integer articleId, Integer usersId, Integer commentArticleId, Integer usersIdType) {
		super();
		
		this.articleId = articleId;
		this.usersId = usersId;
		this.commentArticleId = commentArticleId;
		this.usersIdType = usersIdType;
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
	public Integer getCommentArticleId() {
		return commentArticleId;
	}
	public void setCommentArticleId(Integer commentArticleId) {
		this.commentArticleId = commentArticleId;
	}
	
	public Integer getUsersIdType() {
		return usersIdType;
	}

	public void setUsersIdType(Integer usersIdType) {
		this.usersIdType = usersIdType;
	}

	@Override
	public String toString() {
		return "LikeNum [articleId=" + articleId + ", usersId=" + usersId + ", commentArticleId="
				+ commentArticleId + ", usersIdType="+ usersIdType + "]";
	}
	
	
}
