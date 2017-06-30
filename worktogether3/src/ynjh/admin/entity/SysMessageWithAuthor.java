package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 带有作者的系统消息类，数据库中没有对应表
 * @author 朱吉
 *
 */
public class SysMessageWithAuthor implements Serializable {
	
	private static final long serialVersionUID = 1687728987853937107L;
	private Integer id;
	private String sysmContent;//消息内容
	private Timestamp sysmCreateTime;//消息发送时间
	private Integer sysmScope;//消息作用域
	private Integer adminId;//管理员表id字段
	private String adminLoginId;//管理员登录id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSysmContent() {
		return sysmContent;
	}
	public void setSysmContent(String sysmContent) {
		this.sysmContent = sysmContent;
	}
	public Timestamp getSysmCreateTime() {
		return sysmCreateTime;
	}
	public void setSysmCreateTime(Timestamp sysmCreateTime) {
		this.sysmCreateTime = sysmCreateTime;
	}
	public Integer getSysmScope() {
		return sysmScope;
	}
	public void setSysmScope(Integer sysmScope) {
		this.sysmScope = sysmScope;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getAdminLoginId() {
		return adminLoginId;
	}
	public void setAdminLoginId(String adminLoginId) {
		this.adminLoginId = adminLoginId;
	}
	@Override
	public String toString() {
		return "SysMessageWithAuthor [id=" + id + ", sysmContent=" + sysmContent + ", sysmCreateTime=" + sysmCreateTime
				+ ", sysmScope=" + sysmScope + ", adminId=" + adminId + ", adminLoginId=" + adminLoginId + "]";
	}
	
	
}
