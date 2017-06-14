package ynjh.company.entity;

import java.io.Serializable;

public class CompanyJob implements Serializable{
	private Integer id;
	private String jobName;
	private Integer jobParentId;
	
	public CompanyJob(){
		
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

	public Integer getId() {
		return id;
	}

	@Override
	public String toString() {
		return "CompanyJob [id=" + id + ", jobName=" + jobName
				+ ", jobParentId=" + jobParentId + "]";
	}
	
	
}
