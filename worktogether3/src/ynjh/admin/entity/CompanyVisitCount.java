package ynjh.admin.entity;

import java.io.Serializable;
/**
 * 企业用户访问量统计
 * @author 朱吉
 *
 */
public class CompanyVisitCount implements Serializable{
	private static final long serialVersionUID = -7095080096792928044L;
	private Integer id;
	private Integer companyYear;
	private Integer companyMonth;
	private Integer companyDay;
	private Integer companyInfoCount;//发表消息数
	private Integer companyResumeCount;//发表招聘信息数
	private Integer companyId;
	public Integer getCompanyYear() {
		return companyYear;
	}
	public void setCompanyYear(Integer companyYear) {
		this.companyYear = companyYear;
	}
	public Integer getCompanyMonth() {
		return companyMonth;
	}
	public void setCompanyMonth(Integer companyMonth) {
		this.companyMonth = companyMonth;
	}
	public Integer getCompanyDay() {
		return companyDay;
	}
	public void setCompanyDay(Integer companyDay) {
		this.companyDay = companyDay;
	}
	public Integer getCompanyInfoCount() {
		return companyInfoCount;
	}
	public void setCompanyInfoCount(Integer companyInfoCount) {
		this.companyInfoCount = companyInfoCount;
	}
	public Integer getCompanyResumeCount() {
		return companyResumeCount;
	}
	public void setCompanyResumeCount(Integer companyResumeCount) {
		this.companyResumeCount = companyResumeCount;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public Integer getId() {
		return id;
	}
	@Override
	public String toString() {
		return this.getId()+"--"+this.getCompanyId().toString()+"--"+this.getCompanyYear()+"--"+this.getCompanyMonth()+"--"+this.getCompanyDay();
	}
	
	
	
}
