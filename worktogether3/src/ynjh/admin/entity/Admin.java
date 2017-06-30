package ynjh.admin.entity;

import java.io.Serializable;

/**
 * 管理员实体类，与admin表对应
 * @author 朱吉
 *
 */
public class Admin implements Serializable{
	private static final long serialVersionUID = -4942322496227225518L;
	private Integer id;
	private String adminLoginId;//管理员登录id
	private String adminPassword;//管理员登录密码
	private String adminTel;//管理员电话
	private String adminEmail;//管理员电子邮件
	private String adminName;//管理员真实姓名
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
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getId() {
		return id;
	}
	@Override
	public String toString() {
		return this.getId().toString()+"--"+this.getAdminLoginId().toString()+"--"+this.getAdminName().toString()+"--"+this.getAdminEmail()+"--"+this.getAdminPassword();
	}
	
	
	
}
