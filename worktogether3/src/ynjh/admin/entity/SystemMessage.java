package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 系统消息实体类
 * @author 曾瑞
 *
 */
public class SystemMessage implements Serializable {
	
	private static final long serialVersionUID = 6105382378370712160L;
	private Integer id;
	private String sysmContent;
	private Timestamp sysmCreateTime;
	private Integer sysmScope;
	private Integer adminId;
	
	
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


	@Override
	public String toString() {
		return "SystemMessage [id=" + id + ", sysmContent=" + sysmContent + ", sysmCreateTime=" + sysmCreateTime
				+ ", systmScope=" + sysmScope + ", adminId=" + adminId + "]";
	}
	
	
}
