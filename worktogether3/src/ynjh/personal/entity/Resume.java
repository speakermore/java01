package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 
 * @author 刘志浩
 * 简历表，对应resume表
 */
public class Resume implements Serializable{
	// 简历ID
	private Integer id;
	// 用户ID
	private Integer userId;
	// 简历标题
	private String resumeTitle;
	// 创建时间
	private Timestamp resumeCreateDate;
	// 姓名
	private String resumeName;
	// 性别
	private Integer resumeGender;
	// 民族
	private String resumeNation;
	// 籍贯
	private String resumePlace;
	// 生日
	private Timestamp resumeBirthday;
	// 婚姻
	private Integer resumeMarriage;
	// 毕业院校
	private String resumeGraduationSchool;
	// 毕业时间
	private Timestamp resumeGraduationTime;
	// 学历
	private String resumeEducation;
	// 专业
	private String resumeMajor;
	// 期望待遇
	private Integer resumeWages;
	// 电话
	private Integer resumePhone;
	// QQ
	private Integer resumeQQ;
	// 外语水平
	private Integer resumeFLAbility;
	// 外语类型
	private Integer resumeFLType;
	// 英语等级
	private Integer resumeEnglishGrade;
	// 计算机水平
	private Integer resumeComputerAbility;
	// 特点描述
	private String resumePersonality;
	// 自我评价
	private String resumeSelfEvaluation;
	// 状态(用户的操作)\n1.完全公开(默认)\n2.只限企业浏览\n3.只对应聘企业公开\n4.保密
	private Integer resumeStatusOne;
	// 身高
	private Integer resumeHeight;
	// 体重
	private Integer resumeWeight;
	//状态（管理员）1.待审核 2.正常	 3. 审核不通过  4.隐藏
	private Integer resumeStatusThree;
	//岗位意向
	private String resumeJor;
	
	
	
	
	public String getResumeJor() {
		return resumeJor;
	}
	public void setResumeJor(String resumeJor) {
		this.resumeJor = resumeJor;
	}
	public Integer getResumeStatusThree() {
		return resumeStatusThree;
	}
	public void setResumeStatusThree(Integer resumeStatusThree) {
		this.resumeStatusThree = resumeStatusThree;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getResumeTitle() {
		return resumeTitle;
	}

	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}

	public Timestamp getResumeCreateDate() {
		return resumeCreateDate;
	}

	public void setResumeCreateDate(Timestamp resumeCreateDate) {
		this.resumeCreateDate = resumeCreateDate;
	}

	public String getResumeName() {
		return resumeName;
	}

	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}

	public Integer getResumeGender() {
		return resumeGender;
	}

	public void setResumeGender(Integer resumeGender) {
		this.resumeGender = resumeGender;
	}

	public String getResumeNation() {
		return resumeNation;
	}

	public void setResumeNation(String resumeNation) {
		this.resumeNation = resumeNation;
	}

	public String getResumePlace() {
		return resumePlace;
	}

	public void setResumePlace(String resumePlace) {
		this.resumePlace = resumePlace;
	}

	public Timestamp getResumeBirthday() {
		return resumeBirthday;
	}

	public void setResumeBirthday(Timestamp resumeBirthday) {
		this.resumeBirthday = resumeBirthday;
	}

	public Integer getResumeMarriage() {
		return resumeMarriage;
	}

	public void setResumeMarriage(Integer resumeMarriage) {
		this.resumeMarriage = resumeMarriage;
	}

	public String getResumeGraduationSchool() {
		return resumeGraduationSchool;
	}

	public void setResumeGraduationSchool(String resumeGraduationSchool) {
		this.resumeGraduationSchool = resumeGraduationSchool;
	}

	public Timestamp getResumeGraduationTime() {
		return resumeGraduationTime;
	}

	public void setResumeGraduationTime(Timestamp resumeGraduationTime) {
		this.resumeGraduationTime = resumeGraduationTime;
	}

	public String getResumeEducation() {
		return resumeEducation;
	}

	public void setResumeEducation(String resumeEducation) {
		this.resumeEducation = resumeEducation;
	}

	public String getResumeMajor() {
		return resumeMajor;
	}

	public void setResumeMajor(String resumeMajor) {
		this.resumeMajor = resumeMajor;
	}

	public Integer getResumeWages() {
		return resumeWages;
	}

	public void setResumeWages(Integer resumeWages) {
		this.resumeWages = resumeWages;
	}

	public Integer getResumePhone() {
		return resumePhone;
	}

	public void setResumePhone(Integer resumePhone) {
		this.resumePhone = resumePhone;
	}

	public Integer getResumeQQ() {
		return resumeQQ;
	}

	public void setResumeQQ(Integer resumeQQ) {
		this.resumeQQ = resumeQQ;
	}

	public Integer getResumeFLAbility() {
		return resumeFLAbility;
	}

	public void setResumeFLAbility(Integer resumeFLAbility) {
		this.resumeFLAbility = resumeFLAbility;
	}

	public Integer getResumeFLType() {
		return resumeFLType;
	}

	public void setResumeFLType(Integer resumeFLType) {
		this.resumeFLType = resumeFLType;
	}

	public Integer getResumeEnglishGrade() {
		return resumeEnglishGrade;
	}

	public void setResumeEnglishGrade(Integer resumeEnglishGrade) {
		this.resumeEnglishGrade = resumeEnglishGrade;
	}

	public Integer getResumeComputerAbility() {
		return resumeComputerAbility;
	}

	public void setResumeComputerAbility(Integer resumeComputerAbility) {
		this.resumeComputerAbility = resumeComputerAbility;
	}

	public String getResumePersonality() {
		return resumePersonality;
	}

	public void setResumePersonality(String resumePersonality) {
		this.resumePersonality = resumePersonality;
	}

	public String getResumeSelfEvaluation() {
		return resumeSelfEvaluation;
	}

	public void setResumeSelfEvaluation(String resumeSelfEvaluation) {
		this.resumeSelfEvaluation = resumeSelfEvaluation;
	}

	public Integer getResumeStatusOne() {
		return resumeStatusOne;
	}

	public void setResumeStatusOne(Integer resumeStatusOne) {
		this.resumeStatusOne = resumeStatusOne;
	}

	public Integer getResumeHeight() {
		return resumeHeight;
	}

	public void setResumeHeight(Integer resumeHeight) {
		this.resumeHeight = resumeHeight;
	}

	public Integer getResumeWeight() {
		return resumeWeight;
	}

	public void setResumeWeight(Integer resumeWeight) {
		this.resumeWeight = resumeWeight;
	}


	@Override
	public String toString() {
		return "Resume [id=" + id + ", userId=" + userId + ", resumeTitle="
				+ resumeTitle + ", resumeCreateDate=" + resumeCreateDate
				+ ", resumeName=" + resumeName + ", resumeGender="
				+ resumeGender + ", resumeNation=" + resumeNation
				+ ", resumePlace=" + resumePlace + ", resumeBirthday="
				+ resumeBirthday + ", resumeMarriage=" + resumeMarriage
				+ ", resumeGraduationSchool=" + resumeGraduationSchool
				+ ", resumeGraduationTime=" + resumeGraduationTime
				+ ", resumeEducation=" + resumeEducation + ", resumeMajor="
				+ resumeMajor + ", resumeWages=" + resumeWages
				+ ", resumePhone=" + resumePhone + ", resumeQQ=" + resumeQQ
				+ ", resumeFLAbility=" + resumeFLAbility + ", resumeFLType="
				+ resumeFLType + ", resumeEnglishGrade=" + resumeEnglishGrade
				+ ", resumeComputerAbility=" + resumeComputerAbility
				+ ", resumePersonality=" + resumePersonality
				+ ", resumeSelfEvaluation=" + resumeSelfEvaluation
				+ ", resumeStatusOne=" + resumeStatusOne + ", resumeHeight="
				+ resumeHeight + ", resumeWeight=" + resumeWeight
				+ ", resumeStatusThree=" + resumeStatusThree + "]";
	}

	
	

}
