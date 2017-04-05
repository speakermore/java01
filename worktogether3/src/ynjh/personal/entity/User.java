package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class User implements Serializable{
	private Integer userId;// 用户名
	private String userPassword;// 密码
	private String userName;// 昵称
	private Integer uesrGender;// 性别
	private String userEmail;// 邮箱
	private Integer userStatus;// 状态
	private String userRealName;// 真实姓名
	private String userIDCard;// 身份证号码
	private String userIDImg;// 身份证图片
	private Timestamp userCreateTimestamp;// 注册时间
	private String userHeadImgPath;// 用户头像
	private Double userMoney;// 余额
	private Timestamp userBirthday;// 用户生日
	private Integer userLevel;// 用户等级

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUesrGender() {
		return uesrGender;
	}

	public void setUesrGender(Integer uesrGender) {
		this.uesrGender = uesrGender;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public String getUserIDCard() {
		return userIDCard;
	}

	public void setUserIDCard(String userIDCard) {
		this.userIDCard = userIDCard;
	}

	public String getUserIDImg() {
		return userIDImg;
	}

	public void setUserIDImg(String userIDImg) {
		this.userIDImg = userIDImg;
	}

	public Timestamp getUserCreateTimestamp() {
		return userCreateTimestamp;
	}

	public void setUserCreateTimestamp(Timestamp userCreateTimestamp) {
		this.userCreateTimestamp = userCreateTimestamp;
	}

	public String getUserHeadImgPath() {
		return userHeadImgPath;
	}

	public void setUserHeadImgPath(String userHeadImgPath) {
		this.userHeadImgPath = userHeadImgPath;
	}

	public Double getUserMoney() {
		return userMoney;
	}

	public void setUserMoney(Double userMoney) {
		this.userMoney = userMoney;
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

}
