package ynjh.personal.entity;

import java.io.Serializable;

public class ResumeStatusTwo implements Serializable {

	private Integer id;
	private Integer resumeId; // 简历Id
	private Integer userId; // 发送者Id
	private Integer companyId; // 接收者Id
	/**
	 * 1表示企业尚未阅读（默认） 2表示企业已接受申请 3表示企业需要考虑 4表示企业拒绝了您的申请 5表示企业已删除你的申请 6表示已阅读
	 */
	private Integer resumeStatusTwo;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getResumeId() {
		return resumeId;
	}
	public void setResumeId(Integer resumeId) {
		this.resumeId = resumeId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public Integer getResumeStatusTwo() {
		return resumeStatusTwo;
	}
	public void setResumeStatusTwo(Integer resumeStatusTwo) {
		this.resumeStatusTwo = resumeStatusTwo;
	}
	
	
}
