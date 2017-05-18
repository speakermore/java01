package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * user表和resume联表查询
 * @author dage
 *
 */
public class UserAndResume implements Serializable{
		//用户id
		private Integer id;
		//用户名
		private String userLoginId;
		// 昵称
		private String userName;
		// 性别
		private Integer userGender;
		// 邮箱
		private String userEmail;
		// 真实姓名
		private String userRealName;
		// 用户头像
		private String userHeadImgPath;
		// 用户生日
		private Timestamp userBirthday;
		// 用户等级
		private Integer userLevel;
		//岗位意向
		private String resumeJor;
		// 学历
		private String resumeEducation;
		//工作年限
		private Integer resumeWorks;
		//判断是否关注的状态
		private Boolean isFoucse;
		//计算年龄
		private Integer age;
		//计算工作年限
		private Integer works;
		
		public UserAndResume() {
		}
		
		public UserAndResume(Integer id, String userLoginId, String userName, Integer userGender, String userEmail,
				String userRealName, String userHeadImgPath, Timestamp userBirthday, Integer userLevel,
				String resumeJor, String resumeEducation, Integer resumeWorks) {
			super();
			this.id = id;
			this.userLoginId = userLoginId;
			this.userName = userName;
			this.userGender = userGender;
			this.userEmail = userEmail;
			this.userRealName = userRealName;
			this.userHeadImgPath = userHeadImgPath;
			this.userBirthday = userBirthday;
			this.userLevel = userLevel;
			this.resumeJor = resumeJor;
			this.resumeEducation = resumeEducation;
			this.resumeWorks = resumeWorks;
		}
		

		public Integer getWorks() {
			return works;
		}

		public void setWorks(Integer works) {
			this.works = works;
		}

		public Integer getAge() {
			return age;
		}

		public void setAge(Integer age) {
			this.age = age;
		}

		public Boolean getIsFoucse() {
			return isFoucse;
		}

		public void setIsFoucse(Boolean isFoucse) {
			this.isFoucse = isFoucse;
		}

		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
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
		public String getUserRealName() {
			return userRealName;
		}
		public void setUserRealName(String userRealName) {
			this.userRealName = userRealName;
		}
		public String getUserHeadImgPath() {
			return userHeadImgPath;
		}
		public void setUserHeadImgPath(String userHeadImgPath) {
			this.userHeadImgPath = userHeadImgPath;
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
		public String getResumeJor() {
			return resumeJor;
		}
		public void setResumeJor(String resumeJor) {
			this.resumeJor = resumeJor;
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
		public String getUserLoginId() {
			return userLoginId;
		}
		public void setUserLoginId(String userLoginId) {
			this.userLoginId = userLoginId;
		}
		@Override
		public String toString() {
			return "UserAndResume [id=" + id + ", userLoginId=" + userLoginId + ", userName=" + userName
					+ ", userGender=" + userGender + ", userEmail=" + userEmail + ", userRealName=" + userRealName
					+ ", userHeadImgPath=" + userHeadImgPath + ", userBirthday=" + userBirthday + ", userLevel="
					+ userLevel + ", resumeJor=" + resumeJor + ", resumeEducation=" + resumeEducation + ", resumeWorks="
					+ resumeWorks + "]";
		}
		
}
