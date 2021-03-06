package ynjh.company.entity;

import java.io.Serializable;

public class CompanyConnection implements Serializable{
	private static final long serialVersionUID = 2703810307795445891L;
	private Integer id;
	private Integer companyId;
	private String cmpConnection;
	private String cmpConnectionName;
	public CompanyConnection(){}
	public CompanyConnection(Integer companyId, String cmpConnection, String cmpConnectionName) {
		super();
		this.companyId = companyId;
		this.cmpConnection = cmpConnection;
		this.cmpConnectionName = cmpConnectionName;
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setComanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getCmpConnection() {
		return cmpConnection;
	}
	public void setCmpConnection(String cmpConnection) {
		this.cmpConnection = cmpConnection;
	}
	public String getCmpConnectionName() {
		return cmpConnectionName;
	}
	public void setCmpConnectionName(String cmpConnectionName) {
		this.cmpConnectionName = cmpConnectionName;
	}
	@Override
	public String toString() {
		return "CompanyConnection [companyId=" + companyId + ", cmpConnection=" + cmpConnection + ", cmpConnectionName="
				+ cmpConnectionName + "]";
	}
	
}
