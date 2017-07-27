package ynjh.common.crowdfund.entity;

import java.io.Serializable;

/**
 * 项目众筹岗位需求实体类
 * @author 何爽
 *
 */
public class CrowdfundDemand implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer crowdfundId;//项目众筹ID
	private Integer demandJobId;//需求岗位表ID
	private Integer jobParentId;//父级岗位ID
	private String demandSummary;//需求描述
	private Integer demandPeopleCount;//需求人数
	private String jobType;//岗位类别（一级）
	private String jobName;//岗位职称（二级）

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCrowdfundId() {
		return crowdfundId;
	}

	public void setCrowdfundId(Integer crowdfundId) {
		this.crowdfundId = crowdfundId;
	}
	
	public Integer getDemandJobId() {
		return demandJobId;
	}


	public void setDemandJobId(Integer demandJobId) {
		this.demandJobId = demandJobId;
	}


	public String getDemandSummary() {
		return demandSummary;
	}


	public void setDemandSummary(String demandSummary) {
		this.demandSummary = demandSummary;
	}


	public Integer getDemandPeopleCount() {
		return demandPeopleCount;
	}


	public void setDemandPeopleCount(Integer demandPeopleCount) {
		this.demandPeopleCount = demandPeopleCount;
	}

	public Integer getJobParentId() {
		return jobParentId;
	}

	public void setJobParentId(Integer jobParentId) {
		this.jobParentId = jobParentId;
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

	@Override
	public String toString() {
		return "CrowdfundDemand [id=" + id + ", crowdfundId=" + crowdfundId + ", demandJobId=" + demandJobId
				+ ", jobParentId=" + jobParentId + ", demandSummary=" + demandSummary + ", demandPeopleCount="
				+ demandPeopleCount + ", jobType=" + jobType + ", jobName=" + jobName + "]";
	}

	
}
