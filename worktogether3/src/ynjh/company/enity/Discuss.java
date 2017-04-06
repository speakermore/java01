package ynjh.company.enity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Discuss implements Serializable{
	/**
	 * 评论个人或企业
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer discussUsersId;// 1：企业id  2：个人用户id
	private String discussContent;//评论内容
	private Integer discussLevel; //评论星级
	private Timestamp discussTime; //评论时间
	private Integer discussStatus; //评论状态
	private Integer discusUsersType;//1：企业id 2：个人用户id
	
	public Discuss(){}
	public Discuss(Integer id, Integer discussUsersId, String discussContent,
			Integer discussLevel, Timestamp discussTime, Integer discussStatus,
			Integer discusUsersType) {
		super();
		this.id = id;
		this.discussUsersId = discussUsersId;
		this.discussContent = discussContent;
		this.discussLevel = discussLevel;
		this.discussTime = discussTime;
		this.discussStatus = discussStatus;
		this.discusUsersType = discusUsersType;
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
	public Integer getId() {
		return id;
	}
	public Integer getDiscussUsersId() {
		return discussUsersId;
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
