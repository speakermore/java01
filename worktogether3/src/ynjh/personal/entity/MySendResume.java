package ynjh.personal.entity;

import ynjh.company.entity.CompanyResume;
/**
 * 我发送过的简历
 * @author 刘志浩
 *
 */
public class MySendResume extends CompanyResume{
	private String companyName;//公司名字
	private String cmpRecTitle;//招聘标题
	private String cmpRecWage;//薪资
	private String cmpRecEducation;//学历需求
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCmpRecTitle() {
		return cmpRecTitle;
	}
	public void setCmpRecTitle(String cmpRecTitle) {
		this.cmpRecTitle = cmpRecTitle;
	}
	public String getCmpRecWage() {
		return cmpRecWage;
	}
	public void setCmpRecWage(String cmpRecWage) {
		this.cmpRecWage = cmpRecWage;
	}
	public String getCmpRecEducation() {
		return cmpRecEducation;
	}
	public void setCmpRecEducation(String cmpRecEducation) {
		this.cmpRecEducation = cmpRecEducation;
	}
	@Override
	public String toString() {
		return "MySendResume [companyName=" + companyName + ", cmpRecTitle=" + cmpRecTitle + ", cmpRecWage="
				+ cmpRecWage + ", cmpRecEducation=" + cmpRecEducation + "]";
	}
	
}
