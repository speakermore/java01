package ynjh.admin.entity;

import java.io.Serializable;

public class UserVisitCount implements Serializable {
	private Integer id;
	private Integer userYear;
	private Integer userMonth;
	private Integer userDay;
	private Integer userConmmentCount;//发表评论数
	private Integer userArticleCount;//发表文章数
	private Integer userId;
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
	public Integer getUserConmmentCount() {
		return userConmmentCount;
	}
	public void setUserConmmentCount(Integer userConmmentCount) {
		this.userConmmentCount = userConmmentCount;
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
	

}
