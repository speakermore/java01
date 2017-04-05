package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Education implements Serializable{
	private Integer id;//ID
	private Integer userId;//用户ID
	private Timestamp educationBegIntegerime;//培训开始时间
	private Timestamp educationEndTime;//培训结束时间
	private String educationSchool;//培训地点
	
	public Education(){
		
	}

	public Education(Integer id, Integer userId, Timestamp educationBegIntegerime, Timestamp educationEndTime,
			String educationSchool) {
		super();
		this.id = id;
		this.userId = userId;
		this.educationBegIntegerime = educationBegIntegerime;
		this.educationEndTime = educationEndTime;
		this.educationSchool = educationSchool;
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

	public Timestamp getEducationBegIntegerime() {
		return educationBegIntegerime;
	}

	public void setEducationBegIntegerime(Timestamp educationBegIntegerime) {
		this.educationBegIntegerime = educationBegIntegerime;
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

	@Override
	public String toString() {
		return "Education [id=" + id + ", userId=" + userId + ", educationBegIntegerime=" + educationBegIntegerime
				+ ", educationEndTime=" + educationEndTime + ", educationSchool=" + educationSchool + "]";
	}
	
}
