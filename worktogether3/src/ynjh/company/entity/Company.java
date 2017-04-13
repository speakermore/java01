package ynjh.company.entity;

public class Company {
	
	private Integer id;
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
	private String companyDetailImg;
	private Integer companyStatus;	
	private String CompanyJob;
	
	
	
	public Company(){
		
	}

	
	
	public Company(Integer id, String companyLoginId, String companyPassword, String companyName,
			String companySimpleName, String companyLogo, String companyLicenseImg, String companyLicenseNo,
			String companyCorporator, String companyTel, String companyEmail, String companyAddress,
			String companyDetailImg, Integer companyStatus, String companyJob, String companyConnection) {
		super();
		this.id = id;
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
		this.companyDetailImg = companyDetailImg;
		this.companyStatus = companyStatus;
		CompanyJob = companyJob;
	}



	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
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
		this.companyPassword = companyPassword;
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


	public String getCompanyDetailImg() {
		return companyDetailImg;
	}


	public void setCompanyDetailImg(String companyDetailImg) {
		this.companyDetailImg = companyDetailImg;
	}


	public Integer getCompanyStatus() {
		return companyStatus;
	}


	public void setCompanyStatus(Integer companyStatus) {
		this.companyStatus = companyStatus;
	}


	public String getCompanyJob() {
		return CompanyJob;
	}


	public void setCompanyJob(String companyJob) {
		CompanyJob = companyJob;
	}



	@Override
	public String toString() {
		return "Company [id=" + id + ", companyLoginId=" + companyLoginId + ", companyPassword=" + companyPassword
				+ ", companyName=" + companyName + ", companySimpleName=" + companySimpleName + ", companyLogo="
				+ companyLogo + ", companyLicenseImg=" + companyLicenseImg + ", companyLicenseNo=" + companyLicenseNo
				+ ", companyCorporator=" + companyCorporator + ", companyTel=" + companyTel + ", companyEmail="
				+ companyEmail + ", companyAddress=" + companyAddress + ", companyDetailImg=" + companyDetailImg
				+ ", companyStatus=" + companyStatus + ", CompanyJob=" + CompanyJob + ", companyConnection="+"]";
	}
	
}
