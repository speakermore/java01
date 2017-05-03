package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import ynjh.common.util.MD5Util;
/**
 * 
 * @author 刘志浩
 * 用户表，对应user表
 */
public class User implements Serializable{
	//用户id
	private Integer id;
	// 用户名
	private String userLoginId;
	// 密码
	private String userPassword;
	// 昵称
	private String userName;
	// 性别
	private Integer userGender;
	// 邮箱
	private String userEmail;
	// 状态 1.待审核 2.正常 3.审核未通过 4.禁用
	private Integer userStatus;
	// 真实姓名
	private String userRealName;
	// 身份证号码
	private String userIDCard;
	// 身份证正面图片
	private String userIDImgFace;
	// 身份证反面图片
	private String userIDImgCon;
	// 注册时间
	private Timestamp userCreateDate;
	// 用户头像
	private String userHeadImgPath;
	// 余额
	private Double userMoney;
	// 用户生日
	private Timestamp userBirthday;
	// 用户等级
	private Integer userLevel;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userLoginId, String userPassword, String userName,
			Integer userGender, String userEmail, Integer userStatus,
			String userRealName, String userIDCard, String userIDImgFace,
			String userIDImgCon, Timestamp userCreateDate,
			String userHeadImgPath, Double userMoney, Timestamp userBirthday,
			Integer userLevel) {
		super();
		this.userLoginId = userLoginId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userStatus = userStatus;
		this.userRealName = userRealName;
		this.userIDCard = userIDCard;
		this.userIDImgFace = userIDImgFace;
		this.userIDImgCon = userIDImgCon;
		this.userCreateDate = userCreateDate;
		this.userHeadImgPath = userHeadImgPath;
		this.userMoney = userMoney;
		this.userBirthday = userBirthday;
		this.userLevel = userLevel;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserLoginId() {
		return userLoginId;
	}

	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		try {
			this.userPassword=MD5Util.md5Encode(userPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserGender() {
		return userGender;
	}

	public void setUserGender(Integer userGender) {
		this.userGender = userGender;
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

	public String getUserIDImgFace() {
		return userIDImgFace;
	}

	public void setUserIDImgFace(String userIDImgFace) {
		this.userIDImgFace = userIDImgFace;
	}

	public String getUserIDImgCon() {
		return userIDImgCon;
	}

	public void setUserIDImgCon(String userIDImgCon) {
		this.userIDImgCon = userIDImgCon;
	}

	public Timestamp getUserCreateDate() {
		return userCreateDate;
	}

	public void setUserCreateDate(Timestamp userCreateDate) {
		this.userCreateDate = userCreateDate;
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
