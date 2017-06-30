package ynjh.admin.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 用于管理员审核offer，包括offer表，company表部分字段，user表部分字段
 * @author 朱吉
 * 
 */
public class AuditOffer implements Serializable {
	private static final long serialVersionUID = 3655559501044371390L;
	private Integer id; //offer表id
	private Integer userId; //offer表中的user表id
	private Integer companyId;	//offer表中的company表id 
	private String offerJob; //工作岗位
	private String offerContent; //offer主要内容	
	private Timestamp offerInvitationTime; //面试时间
	private Timestamp offerSendTime; //offer发送时间
	private Integer offerStatus;	//offer审核状态
	private String companyName;	//company表，发送公司名字
	private Integer companyStatus; //company表，发送公司审核状态
	private String userName;	//user表，接收人昵称
	private String userEmail;	//user表，接收人Email
	private Integer userStatus;	//user表，接收人审核状态
	private String userRealName; //user表，接收人真实姓名
	
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
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getOfferJob() {
		return offerJob;
	}
	public void setOfferJob(String offerJob) {
		this.offerJob = offerJob;
	}
	public String getOfferContent() {
		return offerContent;
	}
	public void setOfferContent(String offerContent) {
		this.offerContent = offerContent;
	}
	public Timestamp getOfferInvitationTime() {
		return offerInvitationTime;
	}
	public void setOfferInvitationTime(Timestamp offerInvitationTime) {
		this.offerInvitationTime = offerInvitationTime;
	}
	public Timestamp getOfferSendTime() {
		return offerSendTime;
	}
	public void setOfferSendTime(Timestamp offerSendTime) {
		this.offerSendTime = offerSendTime;
	}
	public Integer getOfferStatus() {
		return offerStatus;
	}
	public void setOfferStatus(Integer offerStatus) {
		this.offerStatus = offerStatus;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Integer getCompanyStatus() {
		return companyStatus;
	}
	public void setCompanyStatus(Integer companyStatus) {
		this.companyStatus = companyStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Integer getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserRealName() {
		return userRealName;
	}
	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}
	@Override
	public String toString() {
		return "AuditOffer [id=" + id + ", userId=" + userId + ", companyId=" + companyId + ", offerJob=" + offerJob
				+ ", offerContent=" + offerContent + ", offerInvitationTime=" + offerInvitationTime + ", offerSendTime="
				+ offerSendTime + ", offerStatus=" + offerStatus + ", companyName=" + companyName + ", companyStatus="
				+ companyStatus + ", userName=" + userName + ", userEmail=" + userEmail + ", userStatus=" + userStatus
				+ ", userRealName=" + userRealName + "]";
	}
	
	
	
	
}
