package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class Education implements Serializable{
	private Integer id;//ID
	private Integer userId;//用户ID
	private Timestamp educationBeginTime;//培训开始时间
	private Timestamp educationEndTime;//培训结束时间
	private String educationSchool;//培训地点
	private Integer resumeId;
	private Integer resumeType;
	private String educationContent;
	


	public String getEducationContent() {
		return educationContent;
	}

	public void setEducationContent(String educationContent) {
		this.educationContent = educationContent;
	}

	public Integer getResumeType() {
		return resumeType;
	}

	public void setResumeType(Integer resumeType) {
		this.resumeType = resumeType;
	}

	public Integer getResumeId() {
		return resumeId;
	}

	public void setResumeId(Integer resumeId) {
		this.resumeId = resumeId;
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

	public Timestamp getEducationBeginTime() {
		return educationBeginTime;
	}

	public void setEducationBeginTime(Timestamp educationBeginTime) {
		this.educationBeginTime = educationBeginTime;
	}

	
}
