package ynjh.company.entity;

import java.io.Serializable;

public class CompanyIntroduction implements Serializable{
	private Integer companyId;//公司id
	private String cmpIntroduction="";//公司简介
	private Integer cmpIntQuality;//公司性质
	private Integer cmpIntPeopleNum;//公司规模
	private String cmpIntComforts="";//公司福利
	private String cmpIntRest="";//公司休息制度
	private String cmpIntInsurance="";//公司保险
	private String cmpIntWage="";//ְ职业薪资
	private Integer cmpIntStatus;//公司简介状态
	
	
	public CompanyIntroduction(){}
	
	public CompanyIntroduction(Integer companyId,String cmpIntroduction, Integer cmpIntQuality, Integer cmpIntPeopleNum,
			String cmpIntComforts, String cmpIntRest, String cmpIntInsurance, String cmpIntWage, Integer cmpIntStatus) {
		super();
		this.companyId=companyId;
		this.cmpIntroduction = cmpIntroduction;
		this.cmpIntQuality = cmpIntQuality;
		this.cmpIntPeopleNum = cmpIntPeopleNum;
		this.cmpIntComforts = cmpIntComforts;
		this.cmpIntRest = cmpIntRest;
		this.cmpIntInsurance = cmpIntInsurance;
		this.cmpIntWage = cmpIntWage;
		this.cmpIntStatus = cmpIntStatus;
	
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCmpIntroduction() {
		return cmpIntroduction;
	}
	
	
	public void setCmpIntroduction(String cmpIntroduction) {
		this.cmpIntroduction = cmpIntroduction;
	}
	public Integer getCmpIntQuality() {
		return cmpIntQuality;
	}
	public void setCmpIntQuality(Integer cmpIntQuality) {
		this.cmpIntQuality = cmpIntQuality;
	}
	public Integer getCmpIntPeopleNum() {
		return cmpIntPeopleNum;
	}
	public void setCmpIntPeopleNum(Integer cmpIntPeopleNum) {
		this.cmpIntPeopleNum = cmpIntPeopleNum;
	}
	public String getCmpIntComforts() {
		return cmpIntComforts;
	}
	public void setCmpIntComforts(String cmpIntComforts) {
		this.cmpIntComforts = cmpIntComforts;
	}
	public String getCmpIntRest() {
		return cmpIntRest;
	}
	public void setCmpIntRest(String cmpIntRest) {
		this.cmpIntRest = cmpIntRest;
	}
	public String getCmpIntInsurance() {
		return cmpIntInsurance;
	}
	public void setCmpIntInsurance(String cmpIntInsurance) {
		this.cmpIntInsurance = cmpIntInsurance;
	}
	public String getCmpIntWage() {
		return cmpIntWage;
	}
	public void setCmpIntWage(String cmpIntWage) {
		this.cmpIntWage = cmpIntWage;
	}
	public Integer getCmpIntStatus() {
		return cmpIntStatus;
	}
	public void setCmpIntStatus(Integer cmpIntStatus) {
		this.cmpIntStatus = cmpIntStatus;
	}

	@Override
	public String toString() {
		return "CompanyIntrodution [cmpIntroduction=" + cmpIntroduction + ", cmpIntQuality=" + cmpIntQuality
				+ ", cmpIntPeopleNum=" + cmpIntPeopleNum + ", cmpIntComforts=" + cmpIntComforts + ", cmpIntRest=" + cmpIntRest
				+ ", cmpIntInsurance=" + cmpIntInsurance + ", cmpIntWage=" + cmpIntWage + ", cmpIntStatus="
				+ cmpIntStatus + "]";
	}
	
	
	
}
