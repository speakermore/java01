package ynjh.personal.entity;

import java.io.Serializable;

/**
 * 名企列表
 * @author dage
 *
 */
public class CompanyList implements Serializable{
	private static final long serialVersionUID = -446480471591159865L;
	private Integer id;
	private String companyLoginId;
	private String companyName;
	private String companySimpleName;
	private String companyLogo;
	private String companyLicenseImg;
	private String companyLicenseNo;
	private String companyCorporator;
	private String companyTel;
	private String companyEmail;
	private String companyAddress;
	private Integer companyId;//公司id
	private String cmpIntroduction="";//公司简介
	private Integer cmpIntQuality;//公司性质
	private Integer cmpIntPeopleNum;//公司规模
	private String cmpIntComforts="";//公司福利
	private String cmpIntRest="";//公司休息制度
	private String cmpIntInsurance="";//公司保险
	private String cmpIntWage="";//ְ职业薪资
	private Boolean isFoucse;//判断是否关注过
	
	public String getCompanyLoginId() {
		return companyLoginId;
	}
	public void setCompanyLoginId(String companyLoginId) {
		this.companyLoginId = companyLoginId;
	}
	public Boolean getIsFoucse() {
		return isFoucse;
	}
	public void setIsFoucse(Boolean isFoucse) {
		this.isFoucse = isFoucse;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanySimpleName() {
		return companySimpleName;
	}
	public void setCompanySimpleName(String companySimpleName) {
		this.companySimpleName = companySimpleName;
	}
	public String getCompanyLogo() {
		return companyLogo;
	}
	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}
	public String getCompanyLicenseImg() {
		return companyLicenseImg;
	}
	public void setCompanyLicenseImg(String companyLicenseImg) {
		this.companyLicenseImg = companyLicenseImg;
	}
	public String getCompanyLicenseNo() {
		return companyLicenseNo;
	}
	public void setCompanyLicenseNo(String companyLicenseNo) {
		this.companyLicenseNo = companyLicenseNo;
	}
	public String getCompanyCorporator() {
		return companyCorporator;
	}
	public void setCompanyCorporator(String companyCorporator) {
		this.companyCorporator = companyCorporator;
	}
	public String getCompanyTel() {
		return companyTel;
	}
	public void setCompanyTel(String companyTel) {
		this.companyTel = companyTel;
	}
	public String getCompanyEmail() {
		return companyEmail;
	}
	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
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
	@Override
	public String toString() {
		return "CompanyList [id=" + id + ", companyLoginId=" + companyLoginId + ", companyName=" + companyName
				+ ", companySimpleName=" + companySimpleName + ", companyLogo=" + companyLogo + ", companyLicenseImg="
				+ companyLicenseImg + ", companyLicenseNo=" + companyLicenseNo + ", companyCorporator="
				+ companyCorporator + ", companyTel=" + companyTel + ", companyEmail=" + companyEmail
				+ ", companyAddress=" + companyAddress + ", companyId=" + companyId + ", cmpIntroduction="
				+ cmpIntroduction + ", cmpIntQuality=" + cmpIntQuality + ", cmpIntPeopleNum=" + cmpIntPeopleNum
				+ ", cmpIntComforts=" + cmpIntComforts + ", cmpIntRest=" + cmpIntRest + ", cmpIntInsurance="
				+ cmpIntInsurance + ", cmpIntWage=" + cmpIntWage + ", isFoucse=" + isFoucse + "]";
	}
}
