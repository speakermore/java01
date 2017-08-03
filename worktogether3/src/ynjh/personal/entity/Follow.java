package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import ynjh.common.exception.AgeOverFlowException;
import ynjh.common.util.LiuZhiHaoDateTimeUtil;

/**
 * @author 胡林飞 关注表，与follow表对应
 */
public class Follow implements Serializable {
	private static final long serialVersionUID = 2634128412121305060L;
	// id
	private Integer id;
	// 关注者id(用户或企业id)
	private Integer followId;
	// 被关注者id(企业或用户的id)
	private Integer byFollowId;
	// 关注日期
	private Timestamp followDate;
	// 关注者类型：1.企业用户 2.个人用户
	private Integer followType;
	// 被关注者类型：1.企业用户 2.个人用户
	private Integer followStartType;
	// 姓名
	private String userRealName;
	//昵称
	private String userName;
	// 性别
	private Integer userGender;
	// 年龄
	private Timestamp userBirthday;
	// 学历
	private String resumeEducation;
	// 工作时间
	private Timestamp resumeWorks;
	// 求职意向
	private String resumeJor;
	//企业账号，通常是手机
	private String companyLoginId;
	// 企业名字
	private String companyName;
	//企业简称
	private String companySimpleName;
	// 企业logo
	private String companyLogo;
	// 企业简介
	private String cmpIntroduction;
	// 企业规模1.20人 2.50人 3.80人4.100人 5.150人 6.200人 7.200人以上
	private Integer cmpIntPeopleNum;
	
	//用户头像
	private String userHeadImgPath;
	//用户登录名，通常是手机号
	private String userLoginId;
	
	
	public String getCompanySimpleName() {
		return companySimpleName;
	}
	public void setCompanySimpleName(String companySimpleName) {
		this.companySimpleName = companySimpleName;
	}
	public String getUserLoginId() {
		return userLoginId;
	}
	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	public String getUserHeadImgPath() {
		return userHeadImgPath;
	}
	public void setUserHeadImgPath(String userHeadImgPath) {
		this.userHeadImgPath = userHeadImgPath;
	}
	/**
	 * 通过对生日的计算，返回年龄
	 * @return 返回年龄
	 */
	public Integer getAge(){
		Integer age=0;
		try {
			age=LiuZhiHaoDateTimeUtil.getAgeTools(userBirthday);
		} catch (AgeOverFlowException e) {
			e.printStackTrace();
		}
		return age;
	}
	/**
	 * 通过对首次工作时间的计算，返回工作的年限
	 * @return 返回工作的年限 
	 */
	public Integer getWorkAge(){
		Integer worksAge=0;
		try {
			worksAge=LiuZhiHaoDateTimeUtil.getAgeTools(resumeWorks);
		} catch (AgeOverFlowException e) {
			e.printStackTrace();
		}
		return worksAge;
		
	}

	public String getCompanyLoginId() {
		return companyLoginId;
	}

	public void setCompanyLoginId(String companyLoginId) {
		this.companyLoginId = companyLoginId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyLogo() {
		return companyLogo;
	}

	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}

	public String getCmpIntroduction() {
		return cmpIntroduction;
	}

	public void setCmpIntroduction(String cmpIntroduction) {
		this.cmpIntroduction = cmpIntroduction;
	}

	public Integer getCmpIntPeopleNum() {
		return cmpIntPeopleNum;
	}

	public void setCmpIntPeopleNum(Integer cmpIntPeopleNum) {
		this.cmpIntPeopleNum = cmpIntPeopleNum;
	}

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public Integer getUserGender() {
		return userGender;
	}

	public void setUserGender(Integer userGender) {
		this.userGender = userGender;
	}

	public Timestamp getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(Timestamp userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getResumeEducation() {
		return resumeEducation;
	}

	public void setResumeEducation(String resumeEducation) {
		this.resumeEducation = resumeEducation;
	}

	public Timestamp getResumeWorks() {
		return resumeWorks;
	}

	public void setResumeWorks(Timestamp resumeWorks) {
		this.resumeWorks = resumeWorks;
	}

	public String getResumeJor() {
		return resumeJor;
	}

	public void setResumeJor(String resumeJor) {
		this.resumeJor = resumeJor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFollowId() {
		return followId;
	}

	public void setFollowId(Integer followId) {
		this.followId = followId;
	}

	public Integer getByFollowId() {
		return byFollowId;
	}

	public void setByFollowId(Integer byFollowId) {
		this.byFollowId = byFollowId;
	}

	public Timestamp getFollowDate() {
		return followDate;
	}

	public void setFollowDate(Timestamp followDate) {
		this.followDate = followDate;
	}

	public Integer getFollowType() {
		return followType;
	}

	public void setFollowType(Integer followType) {
		this.followType = followType;
	}

	public Integer getFollowStartType() {
		return followStartType;
	}

	public void setFollowStartType(Integer followStartType) {
		this.followStartType = followStartType;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Follow [id=" + id + ", followDate=" + followDate + ", followType=" + followType + ", followStartType="
				+ followStartType + ", userRealName=" + userRealName + ", userName=" + userName + ", userGender="
				+ userGender + ", userBirthday=" + userBirthday + ", resumeEducation=" + resumeEducation
				+ ", resumeWorks=" + resumeWorks + ", resumeJor=" + resumeJor + ", companyLoginId=" + companyLoginId
				+ ", companyName=" + companyName + ", companyLogo=" + companyLogo + ", cmpIntroduction="
				+ cmpIntroduction + ", cmpIntPeopleNum=" + cmpIntPeopleNum + ", userHeadImgPath=" + userHeadImgPath
				+ "]";
	}
}
