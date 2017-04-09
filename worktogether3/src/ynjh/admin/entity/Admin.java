package ynjh.admin.entity;

import java.io.Serializable;

public class Admin implements Serializable{
	private Integer id;
	private String adminLoginId;
	private String adminPassword;
	private String adminTel;
	private String adminEmail;
	private String adminName;
	private Integer adminStatusNow;//是否在线状态0.下线，1.在线
	private Integer adminStatus;//禁用状态0.禁用 1.正常 2.超管
	public String getAdminLoginId() {
		return adminLoginId;
	}
	public void setAdminLoginId(String adminLoginId) {
		this.adminLoginId = adminLoginId;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminTel() {
		return adminTel;
	}
	public void setAdminTel(String adminTel) {
		this.adminTel = adminTel;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public Integer getAdminStatusNow() {
		return adminStatusNow;
	}
	public void setAdminStatusNow(Integer adminStatusNow) {
		this.adminStatusNow = adminStatusNow;
	}
	public Integer getAdminStatus() {
		return adminStatus;
	}
	public void setAdminStatus(Integer adminStatus) {
		this.adminStatus = adminStatus;
	}
	public Integer getId() {
		return id;
	}
	
	
	
	
}
