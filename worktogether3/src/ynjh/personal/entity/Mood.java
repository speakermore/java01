package ynjh.personal.entity;

import java.io.Serializable;
/**
 * @author 胡林飞
 * 心情表与mood表对应
 */
import java.sql.Timestamp;

public class Mood implements Serializable{
	//id
	private Integer id;
	//用户ID
	private Integer userId;
	//心情内容
	private String moodContent;
	//心情发布时间
	private Timestamp moodTime;

	public Mood(){
		
	}

	public Mood(Integer id, Integer userId, String moodContent, Timestamp moodTime) {
		super();
		this.id = id;
		this.userId = userId;
		this.moodContent = moodContent;
		this.moodTime = moodTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getMoodContent() {
		return moodContent;
	}

	public void setMoodContent(String moodContent) {
		this.moodContent = moodContent;
	}

	public Timestamp getMoodTime() {
		return moodTime;
	}

	public void setMoodTime(Timestamp moodTime) {
		this.moodTime = moodTime;
	}

	@Override
	public String toString() {
		return "Mood [id=" + id + ", userId=" + userId + ", moodContent=" + moodContent + ", moodTime=" + moodTime
				+ "]";
	}
	
}
