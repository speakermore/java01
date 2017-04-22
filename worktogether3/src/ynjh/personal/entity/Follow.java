package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * @author 胡林飞
 * 关注表，与follow表对应
 */
public class Follow implements Serializable{
	//id
	private Integer id;
	//关注者id(用户或企业id)
	private Integer followId;
	//被关注者id(企业或用户的id)
	private Integer byFollowId;
	//关注日期
	private Timestamp followDate;
	//关注者类型：1.企业用户 2.个人用户
	private Integer followType;
	//被关注者类型：1.企业用户 2.个人用户
	private Integer followStartType;
	
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
