package ynjh.company.entity;

import java.io.Serializable;
import java.sql.Timestamp;

// 对应数据库offer表
/**
 * 对应数据库offer表的实体类
 * 有几个显示企业名称及个人用户昵称的字段
 * @author 牟勇
 *
 */
public class Offer implements Serializable {
	private static final long serialVersionUID = 8535725032528744867L;
	private Integer id;
	//应聘信息主键id
	private Integer cmpResId;
	//offer需要补充的内容
	private String offerContent;
	//offer面试时间
	private Timestamp offerInvitationTime;
	//offer发送时间
	private Timestamp offerSendTime;
	//offer状态：1.等待审核2.审核通过3.审核未过，默认是2，审核通过（这是后期才确定的，offer不再做审核了）
	private Integer offerStatus=2;
	//offer的接收状态：1.尚未阅读2.接受邀请3.拒绝邀请4.已阅读，默认是1，未阅读
	private Integer offerAction=1;
	private String companySimpleName;
	private String companyName;
	private String userName;

	public Offer() {

	}
	
	public Offer(Integer cmpResId, String offerContent, Timestamp offerInvitationTime,
			Timestamp offerSendTime, Integer offerStatus, Integer offerAction) {
		this.cmpResId = cmpResId;
		this.offerContent = offerContent;
		this.offerInvitationTime = offerInvitationTime;
		this.offerSendTime = offerSendTime;
		this.offerStatus = offerStatus;
		this.offerAction = offerAction;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCmpResId() {
		return cmpResId;
	}

	public void setCmpResId(Integer cmpResId) {
		this.cmpResId = cmpResId;
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
		return "Offer [id=" + id + ", cmpResId=" + cmpResId + ", offerContent=" + offerContent
				+ ", offerInvitationTime=" + offerInvitationTime + ", offerSendTime=" + offerSendTime + ", offerStatus="
				+ offerStatus + ", offerAction=" + offerAction + ", companySimpleName=" + companySimpleName
				+ ", companyName=" + companyName + ", userName=" + userName + "]";
	}
	
}
