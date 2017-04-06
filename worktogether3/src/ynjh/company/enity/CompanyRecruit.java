package ynjh.company.enity;

import java.sql.Timestamp;

public class CompanyRecruit {
	private Integer id;//主键
	private Integer companyId;//公司编号
	private String cpmRecTitle;//公司标题
	private String cpmRecWage;//公司薪资
	private String cpmRecEducation;//公司学历需求
	private String cmpRecExperience;//工作所需技能及水平描述
	private Integer cmpRecPeople;//需求人数
	private Timestamp cmpRecTime;//发布时间
	private Integer cmpRecStatus;//发表招聘信息状态1:待审 2：审核通过 3：审核不通过
	public CompanyRecruit(){
		
	}
	
	public CompanyRecruit(Integer id, Integer companyId, String cpmRecTitle,
			String cpmRecWage, String cpmRecEducation, String cmpRecExperience,
			Integer cmpRecPeople, Timestamp cmpRecTime, Integer cmpRecStatus) {
		super();
		this.id = id;
		this.companyId = companyId;
		this.cpmRecTitle = cpmRecTitle;
		this.cpmRecWage = cpmRecWage;
		this.cpmRecEducation = cpmRecEducation;
		this.cmpRecExperience = cmpRecExperience;
		this.cmpRecPeople = cmpRecPeople;
		this.cmpRecTime = cmpRecTime;
		this.cmpRecStatus = cmpRecStatus;
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
	public String getCpmRecTitle() {
		return cpmRecTitle;
	}
	public void setCpmRecTitle(String cpmRecTitle) {
		this.cpmRecTitle = cpmRecTitle;
	}
	public String getCpmRecWage() {
		return cpmRecWage;
	}
	public void setCpmRecWage(String cpmRecWage) {
		this.cpmRecWage = cpmRecWage;
	}
	public String getCpmRecEducation() {
		return cpmRecEducation;
	}
	public void setCpmRecEducation(String cpmRecEducation) {
		this.cpmRecEducation = cpmRecEducation;
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
				+ ", cpmRecTitle=" + cpmRecTitle + ", cpmRecWage=" + cpmRecWage
				+ ", cpmRecEducation=" + cpmRecEducation
				+ ", cmpRecExperience=" + cmpRecExperience + ", cmpRecPeople="
				+ cmpRecPeople + ", cmpRecTime=" + cmpRecTime
				+ ", cmpRecStatus=" + cmpRecStatus + "]";
	}
	
}
