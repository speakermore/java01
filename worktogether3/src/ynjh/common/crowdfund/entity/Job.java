package ynjh.common.crowdfund.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 岗位实体类
 * @author 何爽
 *
 */
public class Job implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String jobName;//岗位名称
	private Integer jobParantId;//技术方向
	private List<Job> subJobs=new ArrayList<Job>();//牟勇：二级分类
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public List<Job> getSubJobs() {
		return subJobs;
	}
	public void setSubJobs(List<Job> subJobs) {
		this.subJobs = subJobs;
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
		return "Job [id=" + id + ", jobName=" + jobName + ", jobParantId=" + jobParantId +",subJobs="+subJobs+ "]";
	}
	
	
}
