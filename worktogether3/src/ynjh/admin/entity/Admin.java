package ynjh.admin.entity;

import java.io.Serializable;

public class Admin implements Serializable{
	private Integer id;
	private Integer adminLoginId;
	private Integer adminPassword;
	private Integer adminTel;
	private Integer adminEmail;
	private Integer adminName;
	private Integer adminStatusNow;//是否在线状态0.下线，1.在线
	private Integer adminStatus;//禁用状态0.禁用 1.正常 2.超管
	public Integer getAdminLoginId() {
		return adminLoginId;
	}
	public void setAdminLoginId(Integer adminLoginId) {
		this.adminLoginId = adminLoginId;
	}
	public Integer getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(Integer adminPassword) {
		this.adminPassword = adminPassword;
	}
	public Integer getAdminTel() {
		return adminTel;
	}
	public void setAdminTel(Integer adminTel) {
		this.adminTel = adminTel;
	}
	public Integer getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(Integer adminEmail) {
		this.adminEmail = adminEmail;
	}
	public Integer getAdminName() {
		return adminName;
	}
	public void setAdminName(Integer adminName) {
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
