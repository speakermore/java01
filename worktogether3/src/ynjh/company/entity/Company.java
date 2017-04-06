package ynjh.company.enity;

public class Company {
	
	private Integer companyId;//公司id
	private String companyLoginId;//企业登录名
	private String companyPassword;//密码
	private String companyName;//公司全名
	private String companySimpleName;//公司简称
	private String companyLogo;//公司logo
	private String companyLicenseImg;//公司营业执照
	private String companyLicenseNo;//公司营业执照码
	private String companyCorporator;//公司法人代表
	private String companyTel;//公司实体类
	private String companyEmail;//公司邮件
	private String companyAddress;//公司地址
	private String companyDetailImg;//公司细节环境图
	private Integer companyStatus;//账户状态
	
	private String CompanyJob;//职业种类
	private String companyConnection;//联系人
	
	private String CompanyIntrodution;//企业简介
	private Integer CompanyFollow;//关注
	private Integer CompanyCharge;//充值
	
	private Integer followId;//关注者
	private Integer ByFollowId;//被关注者
	
	
	public Company(){
		
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

	
	
	
}
