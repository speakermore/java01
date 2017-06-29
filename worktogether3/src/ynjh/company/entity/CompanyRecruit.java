package ynjh.company.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class CompanyRecruit implements Serializable{
	private Integer id;//主键
	private Integer companyId;//公司编号
	private String cmpRecTitle;//工作标题
	private String cmpRecWage;//公司薪资
	private String cmpRecEducation;//公司学历需求
	private String cmpRecExperience;//工作所需技能及水平描述
	private Integer cmpRecPeople;//需求人数
	private Timestamp cmpRecTime;//发布时间
	private Integer cmpRecStatus;//发表招聘信息状态1:待审 2：审核通过 3：审核不通过
	private String cmpRecCity;
	
	public CompanyRecruit(){
		
	}
	
	public CompanyRecruit(Integer companyId, String cmpRecTitle,
			String cmpRecWage, String cmpRecEducation, String cmpRecExperience,
			Integer cmpRecPeople, Timestamp cmpRecTime, Integer cmpRecStatus) {
		
		this.companyId = companyId;
		this.cmpRecTitle = cmpRecTitle;
		this.cmpRecWage = cmpRecWage;
		this.cmpRecEducation=cmpRecEducation;
		this.cmpRecExperience = cmpRecExperience;
		this.cmpRecPeople = cmpRecPeople;
		this.cmpRecTime = cmpRecTime;
		this.cmpRecStatus = cmpRecStatus;
	}
	
	public String getCmpRecCity() {
		return cmpRecCity;
	}

	public void setCmpRecCity(String cmpRecCity) {
		this.cmpRecCity = cmpRecCity;
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
	public String getCmpRecExperience() {
		return cmpRecExperience;
	}
	public void setCmpRecExperience(String cmpRecExperience) {
		this.cmpRecExperience = cmpRecExperience;
	}
	public Integer getCmpRecPeople() {
		return cmpRecPeople;
	}
	public void setCmpRecPeople(Integer cmpRecPeople) {
		this.cmpRecPeople = cmpRecPeople;
	}
	public Timestamp getCmpRecTime() {
		return cmpRecTime;
	}
	public void setCmpRecTime(Timestamp cmpRecTime) {
		this.cmpRecTime = cmpRecTime;
	}
	public Integer getCmpRecStatus() {
		return cmpRecStatus;
	}
	public void setCmpRecStatus(Integer cmpRecStatus) {
		this.cmpRecStatus = cmpRecStatus;
	}
	@Override
	public String toString() {
		return "Company [id=" + id + ", companyId=" + companyId
				+ ", cmpRecTitle=" + cmpRecTitle + ", cmpRecWage=" + cmpRecWage
				+ ", cmpRecEducation=" + cmpRecEducation
				+ ", cmpRecExperience=" + cmpRecExperience + ", cmpRecPeople="
				+ cmpRecPeople + ", cmpRecTime=" + cmpRecTime
				+ ", cmpRecStatus=" + cmpRecStatus +",cmpRecCity="+cmpRecCity+ "]";
	}
	
}
