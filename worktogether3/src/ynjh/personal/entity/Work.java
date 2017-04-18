package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Work implements Serializable{
	private Integer id;// 工作经历ID
	private Integer userId;// 用户ID
	private Timestamp workBeginTime;// 工作开始时间
	private Timestamp workEndTime;// 工作结束时间
	private String workFirmName;// 企业名字
	private String workUnit;// 工作岗位
	private String workDescription;// 工作描述
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

}
