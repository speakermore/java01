package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Project implements Serializable{
	//id
	private Integer id;
	//用户id
	private Integer userId;
	//项目开始时间
	private Timestamp projectBeginTime;
	//项目结束时间
	private Timestamp projectEndTime;
	//项目名字
	private String projectName;
	//项目岗位
	private String projectJob;
	//项目描述
	private String projectDescription;
	//责任描述与感受
	private String projectMakeDescription;
	
	private Integer resumeId;
	
	private Integer resumeType;
	
	

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
	public Timestamp getProjectBeginTime() {
		return projectBeginTime;
	}
	public void setProjectBeginTime(Timestamp projectBeginTime) {
		this.projectBeginTime = projectBeginTime;
	}
	public Timestamp getProjectEndTime() {
		return projectEndTime;
	}
	public void setProjectEndTime(Timestamp projectEndTime) {
		this.projectEndTime = projectEndTime;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectJob() {
		return projectJob;
	}
	public void setProjectJob(String projectJob) {
		this.projectJob = projectJob;
	}
	public String getProjectDescription() {
		return projectDescription;
	}
	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}
	public String getProjectMakeDescription() {
		return projectMakeDescription;
	}
	public void setProjectMakeDescription(String projectMakeDescription) {
		this.projectMakeDescription = projectMakeDescription;
	}
	@Override
	public String toString() {
		return "Project [id=" + id + ", userId=" + userId
				+ ", projectBeginTime=" + projectBeginTime
				+ ", projectEndTime=" + projectEndTime + ", projectName="
				+ projectName + ", projectJob=" + projectJob
				+ ", projectDescription=" + projectDescription
				+ ", projectMakeDescription=" + projectMakeDescription + "]";
	}
	
}
