package ynjh.common.crowdfund.entity;

import java.io.Serializable;

/**
 * 岗位实体类
 * @author 何爽
 *
 */
public class Job implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String jobType;//岗位类型
	private String jobName;//岗位名称
	private Integer jobParantId;//技术方向
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public Integer getJobParantId() {
		return jobParantId;
	}
	public void setJobParantId(Integer jobParantId) {
		this.jobParantId = jobParantId;
	}
	@Override
	public String toString() {
		return "Job [id=" + id + ", jobType=" + jobType + ", jobName=" + jobName + ", jobParantId=" + jobParantId + "]";
	}
	
	
}
