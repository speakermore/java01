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
	private Integer jobParentId;//技术方向（牟勇：父级id,如果是顶级，则为null）
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
	public Integer getJobParentId() {
		return jobParentId;
	}
	public void setJobParentId(Integer jobParentId) {
		this.jobParentId = jobParentId;
	}
	@Override
	public String toString() {
		return "Job [id=" + id + ", jobType=" + jobType + ", jobName=" + jobName + ", jobParantId=" + jobParentId + "]";
	}
	
	
}
