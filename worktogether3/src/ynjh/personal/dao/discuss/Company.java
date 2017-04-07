package ynjh.personal.dao.discuss;

public class Company {
	
	private Integer companyId;
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
	private String companyConnection;
	
	private String CompanyIntrodution;
	private Integer CompanyFollow;
	private Integer CompanyCharge;	
	private Integer followId;
	private Integer ByFollowId;
	
	
	public Company(){
		
	}
	
	
	
	public Company(Integer companyId, String companyLoginId, String companyPassword, String companyName,
			String companySimpleName, String companyLogo, String companyLicenseImg, String companyLicenseNo,
			String companyCorporator, String companyTel, String companyEmail, String companyAddress,
			String companyDetailImg, Integer companyStatus, String companyJob, String companyConnection,
			String companyIntrodution, Integer companyFollow, Integer companyCharge, Integer followId,
			Integer byFollowId) {
		super();
		this.companyId = companyId;
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
		this.companyConnection = companyConnection;
		CompanyIntrodution = companyIntrodution;
		CompanyFollow = companyFollow;
		CompanyCharge = companyCharge;
		this.followId = followId;
		ByFollowId = byFollowId;
	}



	public Integer getCompanyId() {
		return companyId;
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

	public String getCompanyConnection() {
		return companyConnection;
	}

	public void setCompanyConnection(String companyConnection) {
		this.companyConnection = companyConnection;
	}

	public String getCompanyIntrodution() {
		return CompanyIntrodution;
	}

	public void setCompanyIntrodution(String companyIntrodution) {
		CompanyIntrodution = companyIntrodution;
	}

	public Integer getCompanyFollow() {
		return CompanyFollow;
	}

	public void setCompanyFollow(Integer companyFollow) {
		CompanyFollow = companyFollow;
	}

	public Integer getCompanyCharge() {
		return CompanyCharge;
	}

	public void setCompanyCharge(Integer companyCharge) {
		CompanyCharge = companyCharge;
	}

	public Integer getFollowId() {
		return followId;
	}

	public void setFollowId(Integer followId) {
		this.followId = followId;
	}

	public Integer getByFollowId() {
		return ByFollowId;
	}

	public void setByFollowId(Integer byFollowId) {
		ByFollowId = byFollowId;
	}



	@Override
	public String toString() {
		return "Company [companyId=" + companyId + ", companyLoginId=" + companyLoginId + ", companyPassword="
				+ companyPassword + ", companyName=" + companyName + ", companySimpleName=" + companySimpleName
				+ ", companyLogo=" + companyLogo + ", companyLicenseImg=" + companyLicenseImg + ", companyLicenseNo="
				+ companyLicenseNo + ", companyCorporator=" + companyCorporator + ", companyTel=" + companyTel
				+ ", companyEmail=" + companyEmail + ", companyAddress=" + companyAddress + ", companyDetailImg="
				+ companyDetailImg + ", companyStatus=" + companyStatus + ", CompanyJob=" + CompanyJob
				+ ", companyConnection=" + companyConnection + ", CompanyIntrodution=" + CompanyIntrodution
				+ ", CompanyFollow=" + CompanyFollow + ", CompanyCharge=" + CompanyCharge + ", followId=" + followId
				+ ", ByFollowId=" + ByFollowId + "]";
	}

	
	
	
}
