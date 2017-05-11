package ynjh.company.entity;

import java.io.Serializable;
import java.sql.Timestamp;


import ynjh.personal.entity.Resume;

public class CompanyResume extends Resume implements Serializable{
	private Integer id;//主键
	private Integer companyId;//公司ID
	private Integer resumeId;//简历ID
	private Timestamp cmprTime;//时间
	private Integer cmprStatus;//审核状态：1.等待审核 2.审核通过 3.审核不通过
	private Integer companyResumeId;//投递简历的用户ID
	private Integer cmprAction;//接收状态： 1.尚未阅读 2.接受简历 3.拒绝简历4.已阅读

	public CompanyResume(){
		
	}

	@Override
	public String toString() {
		return "CompanyResume [companyId=" + companyId + ", resumeId="
				+ resumeId  + ", cmprTime=" + cmprTime
				+ ", cmprStatus=" + cmprStatus + ", companyResumeId="
				+ companyResumeId + ", cmprAction=" + cmprAction + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public Integer getResumeId() {
		return resumeId;
	}

	public void setResumeId(Integer resumeId) {
		this.resumeId = resumeId;
	}
	public Timestamp getCmprTime() {
		return cmprTime;
	}

	public void setCmprTime(Timestamp cmprTime) {
		this.cmprTime = cmprTime;
	}

	public Integer getCmprStatus() {
		return cmprStatus;
	}

	public void setCmprStatus(Integer cmprStatus) {
		this.cmprStatus = cmprStatus;
	}

	public Integer getCompanyResumeId() {
		return companyResumeId;
	}

	public void setCompanyResumeId(Integer companyResumeId) {
		this.companyResumeId = companyResumeId;
	}

	public Integer getCmprAction() {
		return cmprAction;
	}

	public void setCmprAction(Integer cmprAction) {
		this.cmprAction = cmprAction;
	}
	
}
