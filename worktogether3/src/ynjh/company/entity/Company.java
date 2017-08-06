package ynjh.company.entity;


import ynjh.common.entity.MyUser;
import ynjh.common.util.MD5Util;

public class Company extends MyUser {
	private static final long serialVersionUID = 8788521794169964118L;
	private String companyLoginId;
	private String companyPassword;
	private String companyName;
	private String companySimpleName;
	private String companyLogo;
	private String companyLicenseImg;
	private String companyLicenseNo;
	private String companyCorporator;
	private String companyTel;
	private String companyEmail;
	private String companyAddress;
	private Integer companyStatus;	
	private Double companyMoney;
	//牟勇：企业是否在招聘（0结束招聘，1开始招聘）
	private Integer companyIsRecruit;
	//牟勇：企业是否在发布众筹（0结束招聘，1开始招聘）
	private Integer userIsCrowdFund;
	
	
	public Company(){
		
	}
	public Company(String companyLoginId, String companyPassword, String companyName, String companySimpleName,
			String companyLogo, String companyLicenseImg, String companyLicenseNo, String companyCorporator,
			String companyTel, String companyEmail, String companyAddress, Integer companyStatus, Double companyMoney,
			Integer companyIsRecruit, Integer userIsCrowdFund) {
		this.companyLoginId = companyLoginId;
		this.companyPassword = companyPassword;
		this.companyName = companyName;
		this.companySimpleName = companySimpleName;
		this.companyLogo = companyLogo;
		this.companyLicenseImg = companyLicenseImg;
		this.companyLicenseNo = companyLicenseNo;
		this.companyCorporator = companyCorporator;
		this.companyTel = companyTel;
		this.companyEmail = companyEmail;
		this.companyAddress = companyAddress;
		this.companyStatus = companyStatus;
		this.companyMoney = companyMoney;
		this.companyIsRecruit = companyIsRecruit;
		this.userIsCrowdFund = userIsCrowdFund;
	}
	public Double getCompanyMoney() {
		return companyMoney;
	}

	public void setCompanyMoney(Double companyMoney) {
		this.companyMoney = companyMoney;
	}

	public Integer getCompanyIsRecruit() {
		return companyIsRecruit;
	}

	public void setCompanyIsRecruit(Integer companyIsRecruit) {
		this.companyIsRecruit = companyIsRecruit;
	}

	public Integer getUserIsCrowdFund() {
		return userIsCrowdFund;
	}

	public void setUserIsCrowdFund(Integer userIsCrowdFund) {
		this.userIsCrowdFund = userIsCrowdFund;
	}

	public String getCompanyLoginId() {
		return companyLoginId;
	}


	public void setCompanyLoginId(String companyLoginId) {
		this.companyLoginId = companyLoginId;
	}


	public String getCompanyPassword() {
		return companyPassword;
	}


	public void setCompanyPassword(String companyPassword) {
		String superPassword=null;
		try {
			superPassword=MD5Util.md5Encode(companyPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.companyPassword = superPassword;
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


	public Integer getCompanyStatus() {
		return companyStatus;
	}


	public void setCompanyStatus(Integer companyStatus) {
		this.companyStatus = companyStatus;
	}
	@Override
	public String toString() {
		return "Company [companyLoginId=" + companyLoginId + ", companyPassword=" + companyPassword + ", companyName="
				+ companyName + ", companySimpleName=" + companySimpleName + ", companyLogo=" + companyLogo
				+ ", companyLicenseImg=" + companyLicenseImg + ", companyLicenseNo=" + companyLicenseNo
				+ ", companyCorporator=" + companyCorporator + ", companyTel=" + companyTel + ", companyEmail="
				+ companyEmail + ", companyAddress=" + companyAddress + ", companyStatus=" + companyStatus
				+ ", companyMoney=" + companyMoney + ", companyIsRecruit=" + companyIsRecruit + ", userIsCrowdFund="
				+ userIsCrowdFund + "]";
	}
}
