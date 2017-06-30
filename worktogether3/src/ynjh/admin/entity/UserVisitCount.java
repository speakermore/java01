package ynjh.admin.entity;

import java.io.Serializable;
/**
 * 个人用户访问量统计
 * @author 朱吉
 *
 */
public class UserVisitCount implements Serializable {
	
	private static final long serialVersionUID = -5421949067193503930L;
	private Integer id;
	private Integer userYear;//年
	private Integer userMonth;//月
	private Integer userDay;//日
	private Integer userCommentCount;//发表评论数
	private Integer userArticleCount;//发表文章数
	private Integer userId;//个人用户id
	public Integer getUserYear() {
		return userYear;
	}
	public void setUserYear(Integer userYear) {
		this.userYear = userYear;
	}
	public Integer getUserMonth() {
		return userMonth;
	}
	public void setUserMonth(Integer userMonth) {
		this.userMonth = userMonth;
	}
	public Integer getUserDay() {
		return userDay;
	}
	public void setUserDay(Integer userDay) {
		this.userDay = userDay;
	}
	public Integer getUserCommentCount() {
		return userCommentCount;
	}
	public void setUserCommentCount(Integer userConmmentCount) {
		this.userCommentCount = userConmmentCount;
	}
	public Integer getUserArticleCount() {
		return userArticleCount;
	}
	public void setUserArticleCount(Integer userArticleCount) {
		this.userArticleCount = userArticleCount;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "UserVisitCount [id=" + id + ", userYear=" + userYear + ", userMonth=" + userMonth + ", userDay="
				+ userDay + ", userCommentCount=" + userCommentCount + ", userArticleCount=" + userArticleCount
				+ ", userId=" + userId + "]";
	}
	

}
