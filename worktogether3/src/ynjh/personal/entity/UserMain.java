package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserMain extends Resume implements Serializable {
	// 用户id
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
	// 工作开始时间
	private Timestamp workBeginTime;
	// 工作结束时间
	private Timestamp workEndTime;
	// 企业名字
	private String workFirmName;
	// 工作岗位
	private String workUnit;
	// 工作描述
	private String workDescription;

	private Timestamp educationBeginTime;// 培训开始时间
	private Timestamp educationEndTime;// 培训结束时间
	private String educationSchool;// 培训地点
	private String educationContent;

	// 文章标题
	private String articleTitle;
	// 点赞数
	private Integer articleLikeNum;
	// 阅读数
	private Integer articleReadNum;
	// 发表日期
	private Timestamp articleTime;
	// 状态
	private Integer articleStatus;
	// 关键字
	private String articleKey;
	// 文章内容
	private String articleContent;
	// 用户状态1：企业 2：个人
	private Integer articleUsersType;
	
	public UserMain() {
	}
	
	public UserMain(Integer id, String userLoginId, String userPassword, String userName, Integer userGender,
			String userEmail, Integer userStatus, String userRealName, String userIDCard, String userIDImgFace,
			String userIDImgCon, Timestamp userCreateDate, String userHeadImgPath, Double userMoney,
			Timestamp userBirthday, Integer userLevel, Timestamp workBeginTime, Timestamp workEndTime,
			String workFirmName, String workUnit, String workDescription, Timestamp educationBeginTime,
			Timestamp educationEndTime, String educationSchool, String educationContent, String articleTitle,
			Integer articleLikeNum, Integer articleReadNum, Timestamp articleTime, Integer articleStatus,
			String articleKey, String articleContent, Integer articleUsersType) {
		super();
		this.id = id;
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
		this.workBeginTime = workBeginTime;
		this.workEndTime = workEndTime;
		this.workFirmName = workFirmName;
		this.workUnit = workUnit;
		this.workDescription = workDescription;
		this.educationBeginTime = educationBeginTime;
		this.educationEndTime = educationEndTime;
		this.educationSchool = educationSchool;
		this.educationContent = educationContent;
		this.articleTitle = articleTitle;
		this.articleLikeNum = articleLikeNum;
		this.articleReadNum = articleReadNum;
		this.articleTime = articleTime;
		this.articleStatus = articleStatus;
		this.articleKey = articleKey;
		this.articleContent = articleContent;
		this.articleUsersType = articleUsersType;
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
		this.userPassword = userPassword;
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
	public Timestamp getWorkBeginTime() {
		return workBeginTime;
	}
	public void setWorkBeginTime(Timestamp workBeginTime) {
		this.workBeginTime = workBeginTime;
	}
	public Timestamp getWorkEndTime() {
		return workEndTime;
	}
	public void setWorkEndTime(Timestamp workEndTime) {
		this.workEndTime = workEndTime;
	}
	public String getWorkFirmName() {
		return workFirmName;
	}
	public void setWorkFirmName(String workFirmName) {
		this.workFirmName = workFirmName;
	}
	public String getWorkUnit() {
		return workUnit;
	}
	public void setWorkUnit(String workUnit) {
		this.workUnit = workUnit;
	}
	public String getWorkDescription() {
		return workDescription;
	}
	public void setWorkDescription(String workDescription) {
		this.workDescription = workDescription;
	}
	public Timestamp getEducationBeginTime() {
		return educationBeginTime;
	}
	public void setEducationBeginTime(Timestamp educationBeginTime) {
		this.educationBeginTime = educationBeginTime;
	}
	public Timestamp getEducationEndTime() {
		return educationEndTime;
	}
	public void setEducationEndTime(Timestamp educationEndTime) {
		this.educationEndTime = educationEndTime;
	}
	public String getEducationSchool() {
		return educationSchool;
	}
	public void setEducationSchool(String educationSchool) {
		this.educationSchool = educationSchool;
	}
	public String getEducationContent() {
		return educationContent;
	}
	public void setEducationContent(String educationContent) {
		this.educationContent = educationContent;
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
	@Override
	public String toString() {
		return "UserMain [id=" + id + ", userLoginId=" + userLoginId + ", userPassword=" + userPassword + ", userName="
				+ userName + ", userGender=" + userGender + ", userEmail=" + userEmail + ", userStatus=" + userStatus
				+ ", userRealName=" + userRealName + ", userIDCard=" + userIDCard + ", userIDImgFace=" + userIDImgFace
				+ ", userIDImgCon=" + userIDImgCon + ", userCreateDate=" + userCreateDate + ", userHeadImgPath="
				+ userHeadImgPath + ", userMoney=" + userMoney + ", userBirthday=" + userBirthday + ", userLevel="
				+ userLevel + ", workBeginTime=" + workBeginTime + ", workEndTime=" + workEndTime + ", workFirmName="
				+ workFirmName + ", workUnit=" + workUnit + ", workDescription=" + workDescription
				+ ", educationBeginTime=" + educationBeginTime + ", educationEndTime=" + educationEndTime
				+ ", educationSchool=" + educationSchool + ", educationContent=" + educationContent + ", articleTitle="
				+ articleTitle + ", articleLikeNum=" + articleLikeNum + ", articleReadNum=" + articleReadNum
				+ ", articleTime=" + articleTime + ", articleStatus=" + articleStatus + ", articleKey=" + articleKey
				+ ", articleContent=" + articleContent + ", articleUsersType=" + articleUsersType + "]";
	}
}
