package ynjh.personal.entity;

import java.sql.Timestamp;

import ynjh.common.entity.MyUser;
import ynjh.common.util.MD5Util;
import ynjh.common.util.MyStringUtil;
/**
 * 
 * @author 刘志浩
 * 用户表，对应user表
 */
public class User extends MyUser{
	private static final long serialVersionUID = 780075079053933472L;
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
	//是否应聘中，0.在职中，1.应聘中
	private Integer userIsRecruit=0;
	//是否众筹中，0.未众筹，2.发布众筹中
	private Integer userIsCrowdFund=0;
	//是否合伙创业中，0.未合伙创业，2.发布合伙创业中
	private Integer userIsPartner=0;
	public User() {
	}

	public User(String userLoginId, String userPassword, String userName,
			Integer userGender, String userEmail, Integer userStatus,
			String userRealName, String userIDCard, String userIDImgFace,
			String userIDImgCon, Timestamp userCreateDate,
			String userHeadImgPath, Double userMoney, Timestamp userBirthday,
			Integer userLevel) {
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
	
	
	public Integer getUserIsRecruit() {
		return userIsRecruit;
	}

	public void setUserIsRecruit(Integer userIsRecruit) {
		this.userIsRecruit = userIsRecruit;
	}

	public Integer getUserIsCrowdFund() {
		return userIsCrowdFund;
	}

	public void setUserIsCrowdFund(Integer userIsCrowdFund) {
		this.userIsCrowdFund = userIsCrowdFund;
	}

	public Integer getUserIsPartner() {
		return userIsPartner;
	}

	public void setUserIsPartner(Integer userIsPartner) {
		this.userIsPartner = userIsPartner;
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
	/**
	 * 牟勇：将真实姓名进行掩码处理
	 * 如果是两个字的姓名，掩去名字
	 * 如果是两个及以上的姓名，只留下第一个字和最后一个字
	 * @return 进行了掩码处理之后的真实姓名
	 */
	public String getUserRealNameMasked(){
		String masked="";
		if (userRealName.length()==2) {
			masked=MyStringUtil.replaceStart(userRealName, 1, 1);
		}else{
			masked=MyStringUtil.replaceStart(userRealName, 1, userRealName.length()-2);
		}
		return masked;
	}
	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}
	public String getUserIDCardMasked(){
		return MyStringUtil.replaceStart(userIDCard, 2, userIDCard.length()-2);
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

	@Override
	public String toString() {
		return "User [id=" + getId() + ", userLoginId=" + userLoginId + ", userPassword=" + userPassword + ", userName="
				+ userName + ", userGender=" + userGender + ", userEmail=" + userEmail + ", userStatus=" + userStatus
				+ ", userRealName=" + userRealName + ", userIDCard=" + userIDCard + ", userIDImgFace=" + userIDImgFace
				+ ", userIDImgCon=" + userIDImgCon + ", userCreateDate=" + userCreateDate + ", userHeadImgPath="
				+ userHeadImgPath + ", userMoney=" + userMoney + ", userBirthday=" + userBirthday + ", userLevel="
				+ userLevel + "]";
	}
	
	
}
