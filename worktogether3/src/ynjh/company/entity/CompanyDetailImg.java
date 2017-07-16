package ynjh.company.entity;

import java.io.Serializable;

public class CompanyDetailImg implements Serializable{
	private static final long serialVersionUID = -94210087480187355L;
	private Integer id;
	private Integer companyId;
	private String companyDetailImg;
	
	public CompanyDetailImg(){}

	public CompanyDetailImg(Integer id, Integer companyId, String companyDetailImg) {
		super();
		this.id = id;
		this.companyId = companyId;
		this.companyDetailImg = companyDetailImg;
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
