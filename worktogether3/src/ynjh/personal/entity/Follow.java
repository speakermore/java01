package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * @author 胡林飞
 * 关注表，与follow表对应
 */
public class Follow implements Serializable{
	//id
	private Integer id;
	//关注者id(用户或企业id)
	private Integer followId;
	//被关注者id(企业或用户的id)
	private Integer byFollowId;
	//关注日期
	private Timestamp followDate;
	//关注者类型：1.企业用户 2.个人用户
	private Integer followType;
	//被关注者类型：1.企业用户 2.个人用户
	private Integer followStartType;
	//姓名
	private String userRealName;
	//性别
	private Integer userGender;
	//年龄
	private Timestamp userBirthday;
	//学历
	private String resumeEducation;
	//工作时间
	private Integer resumeWorks; 
	//求职意向
	private String resumeJor;
	
	public Follow() {
		// TODO Auto-generated constructor stub
	}

	public Follow(Integer id, Integer followId, Integer byFollowId, Timestamp followDate, Integer followType,
			Integer followStartType, String userRealName, Integer userGender, Timestamp userBirthday,
			String resumeEducation, Integer resumeWorks, String resumeJor) {
		super();
		this.id = id;
		this.followId = followId;
		this.byFollowId = byFollowId;
		this.followDate = followDate;
		this.followType = followType;
		this.followStartType = followStartType;
		this.userRealName = userRealName;
		this.userGender = userGender;
		this.userBirthday = userBirthday;
		this.resumeEducation = resumeEducation;
		this.resumeWorks = resumeWorks;
		this.resumeJor = resumeJor;
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

	public Integer getResumeWorks() {
		return resumeWorks;
	}

	public void setResumeWorks(Integer resumeWorks) {
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

	@Override
	public String toString() {
		return "Follow [id=" + id + ", followId=" + followId + ", byFollowId=" + byFollowId + ", followDate="
				+ followDate + ", followType=" + followType + ", followStartType=" + followStartType + ", userRealName="
				+ userRealName + ", userGender=" + userGender + ", userBirthday=" + userBirthday + ", resumeEducation="
				+ resumeEducation + ", resumeWorks=" + resumeWorks + ", resumeJor=" + resumeJor + "]";
	}
}
