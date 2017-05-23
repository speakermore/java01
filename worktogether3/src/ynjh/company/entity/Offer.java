package ynjh.company.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Offer extends Company implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer companyId;
	private Integer userId;
	private String offerJob;
	private String offerContent;
	private Timestamp offerInvitationTime;
	private Timestamp offerSendTime;
	private Integer offerStatus=1;
	private Integer offerAction=1;
	private String companySimpleName;
	private String companyName;
	private String userName;
	
	public Offer() {
		
	}

	public Offer(Integer id, Integer companyId, Integer userId,
			String offerJob, String offerContent,
			Timestamp offerInvitationTime, Timestamp offerSendTime,
			Integer offerStatus, Integer offerAction,
			String companySimpleName, String companyName,String userName) {
		super();
		this.id = id;		
		this.companyId = companyId;
		this.userId = userId;
		this.offerJob = offerJob;
		this.offerContent = offerContent;
		this.offerInvitationTime = offerInvitationTime;
		this.offerSendTime = offerSendTime;
		this.offerStatus= offerStatus;
		this.offerAction= offerAction;
		this.companySimpleName= companySimpleName;
		this.companyName=companyName;
		this.userName= userName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}	

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
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

	public Integer getOfferAction() {
		return offerAction;
	}

	public void setOfferAction(Integer offerAction) {
		this.offerAction = offerAction;
	}

	public String getCompanySimpleName() {
		return companySimpleName;
	}

	public void setCompanySimpleName(String companySimpleName) {
		this.companySimpleName = companySimpleName;
	}
	
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Override
	public String toString() {
		return "Offer [id=" + id +
				", companyId=" + companyId +
				", userId=" + userId +
				", offerJob=" + offerJob +
				", offerContent=" + offerContent +
				", offerInvitationTime=" + offerInvitationTime +
				", offerSendTime=" + offerSendTime +
				", offerStatus=" + offerStatus +
				", offerAction=" + offerAction +
				", companySimpleName=" + companySimpleName +
				", companyName=" + companyName +
				", userName=" + userName +
				"]";				
	}
}
