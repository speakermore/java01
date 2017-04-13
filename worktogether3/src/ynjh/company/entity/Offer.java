package ynjh.company.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Offer implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer userId;
	private Integer companyId;	
	private String offerJob;
	private String offerContent;	
	private Timestamp offerInvitationTime;
	private Timestamp offerSendTime;
	private Integer offerStatus=1;
	
	public Offer() {
		
	}

	public Offer(Integer id, Integer userId, Integer companyId, 
			String offerJob, String offerContent, 
			Timestamp offerInvitationTime, Timestamp offerSendTime, Integer offerStatus) {
		super();
		this.id = id;
		this.userId = userId;
		this.companyId = companyId;
		this.offerJob = offerJob;
		this.offerContent = offerContent;
		this.offerInvitationTime = offerInvitationTime;
		this.offerSendTime = offerSendTime;
		this.offerStatus= offerStatus;
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
	
	@Override
	public String toString() {
		return "Offer [id=" + id + 
				", userId=" + userId + 
				", companyId=" + companyId + 
				", offerJob="	+ offerJob + 
				", offerContent=" + offerContent + 
				", offerInvitationTime=" + offerInvitationTime +
				", offerSendTime=" + offerSendTime + 
				", offerStatus=" + offerStatus +
				"]";				
	}
}
