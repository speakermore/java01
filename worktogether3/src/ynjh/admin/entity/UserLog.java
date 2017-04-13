package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class UserLog implements Serializable{
	private Integer id;
	private Integer userId;
	private Integer userDo;
	private Integer userTargetType;//对象类型
	private Integer userAid;//操作对象id
	private Timestamp userTime;//操作时间
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getUserDo() {
		return userDo;
	}
	public void setUserDo(Integer userDo) {
		this.userDo = userDo;
	}
	public Integer getUserTargetType() {
		return userTargetType;
	}
	public void setUserTargetType(Integer userTargetType) {
		this.userTargetType = userTargetType;
	}
	public Integer getUserAid() {
		return userAid;
	}
	public void setUserAid(Integer userAid) {
		this.userAid = userAid;
	}
	public Timestamp getUserTime() {
		return userTime;
	}
	public void setUserTime(Timestamp userTime) {
		this.userTime = userTime;
	}
	public Integer getId() {
		return id;
	}
	
	
}
