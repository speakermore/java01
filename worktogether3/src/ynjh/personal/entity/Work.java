package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 
 * @author 刘志浩
 * 工作记录表，与work表相对应，是resume的子表
 *
 */
public class Work implements Serializable{
	// 工作经历ID
	private Integer id;
	// 用户ID
	private Integer userId;
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
	//简历id
	private Integer resumeId;
	//状态 1.待审核 2.正常 3.审核未通过 4.删除
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
