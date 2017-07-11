package ynjh.personal.entity;

import java.io.Serializable;
/**
 * @author 胡林飞
 * 评论企业星级表，与dicuss表对应
 */

import java.sql.Timestamp;

public class Discuss implements Serializable {
	private static final long serialVersionUID = -1135982522248411023L;
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
	private Integer discussSendType;
	//被发送者id
	private Integer discussBySendId;
	// 1：企业id 2：个人用户id
	private Integer discussBySendType;

	public Integer getDiscussBySendType() {
		return discussBySendType;
	}

	public void setDiscussBySendType(Integer discussBySendType) {
		this.discussBySendType = discussBySendType;
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

	public Integer getDiscussSendType() {
		return discussSendType;
	}

	public void setDiscussSendType(Integer discussSendType) {
		this.discussSendType = discussSendType;
	}

	public Integer getDiscussBySendId() {
		return discussBySendId;
	}

	public void setDiscussBySendId(Integer discussBySendId) {
		this.discussBySendId = discussBySendId;
	}

	@Override
	public String toString() {
		return "Discuss [id=" + id + ", discussUsersId=" + discussUsersId + ", discussContent=" + discussContent
				+ ", discussLevel=" + discussLevel + ", discussTime=" + discussTime + ", discussStatus=" + discussStatus
				+ ", discussSendType=" + discussSendType + ", discussBySendId=" + discussBySendId
				+ ", discussBySendType=" + discussBySendType + "]";
	}

}
