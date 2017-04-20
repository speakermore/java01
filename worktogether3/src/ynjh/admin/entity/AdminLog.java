package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class AdminLog implements Serializable{
	private Integer id;
	private Integer adminLoginId;
	//操作类型
	private Integer adminDo;
	private Integer adminTargetType;//对象类型
	private Integer adminAid;//操作对象ID
	private Timestamp adminTime;//操作时间
	public int getAdminLoginId() {
		return adminLoginId;
	}
	public void setAdminLoginId(int adminLoginId) {
		this.adminLoginId = adminLoginId;
	}
	public int getAdminDo() {
		return adminDo;
	}
	public void setAdminDo(int adminDo) {
		this.adminDo = adminDo;
	}
	public int getAdminTargetType() {
		return adminTargetType;
	}
	public void setAdminTargetType(int adminTargetType) {
		this.adminTargetType = adminTargetType;
	}
	public int getAdminAid() {
		return adminAid;
	}
	public void setAdminAid(int adminAid) {
		this.adminAid = adminAid;
	}
	public Date getAdminTime() {
		return adminTime;
	}
	public void setAdminTime(Timestamp adminTime) {
		this.adminTime = adminTime;
	}
	public int getId() {
		return id;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getAdminLoginId()+"--"+this.getAdminDo();
	}
	
	
	
}
