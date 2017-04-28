package ynjh.company.entity;

public class CompanyDetailImg {
	private Integer companyId;
	private String companyDetailImg;
	
	public CompanyDetailImg(){}

	public CompanyDetailImg(Integer companyId, String companyDetailImg) {
		super();
		this.companyId = companyId;
		this.companyDetailImg = companyDetailImg;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyDetailImg() {
		return companyDetailImg;
	}

	public void setCompanyDetailImg(String companyDetailImg) {
		this.companyDetailImg = companyDetailImg;
	}

	@Override
	public String toString() {
		return "CompanyDetail [companyId=" + companyId + ", companyDetailImg=" + companyDetailImg + "]";
	}
}
