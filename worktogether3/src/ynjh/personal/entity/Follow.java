package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Follow implements Serializable{
	private Integer id;
	private Integer followId;//关注者id(用户或企业id)
	private Integer byFollowId;//被关注者id(企业或用户的id)
	private Timestamp followDate;//关注日期
	private Integer followType;//1.企业用户 2.个人用户
	private Integer followStartType;//1.企业用户 2.个人用户
	
	public Follow(){
		
	}

	public Follow(Integer id, Integer followId, Integer byFollowId, Timestamp followDate, Integer followType, Integer followStartType) {
		super();
		this.id = id;
		this.followId = followId;
		this.byFollowId = byFollowId;
		this.followDate = followDate;
		this.followType = followType;
		this.followStartType = followStartType;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFollowId() {
		return followId;
	}

	public void setFollowId(Integer followId) {
		this.followId = followId;
	}

	public Integer getByFollowId() {
		return byFollowId;
	}

	public void setByFollowId(Integer byFollowId) {
		this.byFollowId = byFollowId;
	}

	public Timestamp getFollowDate() {
		return followDate;
	}

	public void setFollowDate(Timestamp followDate) {
		this.followDate = followDate;
	}

	public Integer getFollowType() {
		return followType;
	}

	public void setFollowType(Integer followType) {
		this.followType = followType;
	}

	public Integer getFollowStartType() {
		return followStartType;
	}

	public void setFollowStartType(Integer followStartType) {
		this.followStartType = followStartType;
	}

	@Override
	public String toString() {
		return "Follow [id=" + id + ", followId=" + followId + ", byFollowId=" + byFollowId + ", followDate="
				+ followDate + ", followType=" + followType + ", followStartType=" + followStartType + "]";
	}
	
}
