package ynjh.personal.entity;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * @author 胡林飞
 * 信息表，与message表对应
 */
public class Message implements Serializable {
	private static final long serialVersionUID = 2865018412730784571L;
	// id
	private Integer id;
	// 接收者id
	private Integer userId;
	// 发送者id
	private Integer resendId;
	// 消息内容
	private String messageContent;
	// 发送时间
	private Timestamp messageSendTime;
	// 1表示您尚未阅读(默认) 2表示您已接受邀请 3表示您婉言谢绝了申请 4表示已阅读，未回复
	private Integer messageResendStatus;
	// 1.等待审核 2.审核通过 3.审核部通过
	private Integer messageSendStatus;
	//识别用户和企业：1.用户 2 企业
	private Integer messageStatus;

	public Message() {
	}

	public Message(Integer userId, Integer resendId,
			String messageContent, Timestamp messageSendTime,Integer messageStatus) {
		super();
		this.userId = userId;
		this.resendId = resendId;
		this.messageContent = messageContent;
		this.messageSendTime = messageSendTime;
		this.messageStatus=messageStatus;
		
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

	public Integer getResendId() {
		return resendId;
	}

	public void setResendId(Integer resendId) {
		this.resendId = resendId;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Timestamp getMessageSendTime() {
		return messageSendTime;
	}

	public void setMessageSendTime(Timestamp messageSendTime) {
		this.messageSendTime = messageSendTime;
	}

	public Integer getMessageResendStatus() {
		return messageResendStatus;
	}

	public void setMessageResendStatus(Integer messageResendStatus) {
		this.messageResendStatus = messageResendStatus;
	}

	public Integer getMessageSendStatus() {
		return messageSendStatus;
	}

	public void setMessageSendStatus(Integer messageSendStatus) {
		this.messageSendStatus = messageSendStatus;
	}
	

	public Integer getMessageStatus() {
		return messageStatus;
	}

	public void setMessageStatus(Integer messageStatus) {
		this.messageStatus = messageStatus;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", userId=" + userId + ", resendId="
				+ resendId + ", messageContent=" + messageContent
				+ ", messageSendTime=" + messageSendTime
				+ ", messageResendStatus=" + messageResendStatus
				+ ", messageSendStatus=" + messageSendStatus + "]";
	}
}
