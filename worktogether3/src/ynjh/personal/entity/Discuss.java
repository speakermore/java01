package ynjh.personal.entity;

import java.io.Serializable;
/**
 * @author 胡林飞
 * 评论企业星级表，与dicuss表对应
 */

import java.sql.Timestamp;

public class Discuss implements Serializable {
	// id
	private Integer id;
	//发送者 1：企业id 2：个人用户id
	private Integer discussUsersId;
	// 评论内容
	private String discussContent;
	// 评论星级 1：1星 2：2星 3：3星 4：4星 5：5星
	private Integer discussLevel;
	// 评论时间
	private Timestamp discussTime;
	// 评论状态1:待审 2：正常 3：审核不通过 4：隐藏
	private Integer discussStatus;
	// 1：企业id 2：个人用户id
	private Integer discusUsersType;
	//被发送者id
	private Integer discussBySendId;
	
	public Discuss() {
	}

	public Discuss(Integer discussUsersId, String discussContent,
			Integer discussLevel, Timestamp discussTime,
			Integer discusUsersType) {
		super();
		this.discussUsersId = discussUsersId;
		this.discussContent = discussContent;
		this.discussLevel = discussLevel;
		this.discussTime = discussTime;
		this.discusUsersType = discusUsersType;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDiscussUsersId() {
		return discussUsersId;
	}

	public void setDiscussUsersId(Integer discussUsersId) {
		this.discussUsersId = discussUsersId;
	}

	public String getDiscussContent() {
		return discussContent;
	}

	public void setDiscussContent(String discussContent) {
		this.discussContent = discussContent;
	}

	public Integer getDiscussLevel() {
		return discussLevel;
	}

	public void setDiscussLevel(Integer discussLevel) {
		this.discussLevel = discussLevel;
	}

	public Timestamp getDiscussTime() {
		return discussTime;
	}

	public void setDiscussTime(Timestamp discussTime) {
		this.discussTime = discussTime;
	}

	public Integer getDiscussStatus() {
		return discussStatus;
	}

	public void setDiscussStatus(Integer discussStatus) {
		this.discussStatus = discussStatus;
	}

	public Integer getDiscusUsersType() {
		return discusUsersType;
	}

	public void setDiscusUsersType(Integer discusUsersType) {
		this.discusUsersType = discusUsersType;
	}

	@Override
	public String toString() {
		return "Discuss [id=" + id + ", discussUsersId=" + discussUsersId
				+ ", discussContent=" + discussContent + ", discussLevel="
				+ discussLevel + ", discussTime=" + discussTime
				+ ", discussStatus=" + discussStatus + ", discusUsersType="
				+ discusUsersType + "]";
	}

}
