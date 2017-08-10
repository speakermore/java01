package ynjh.company.entity;

import java.io.Serializable;
import java.sql.Timestamp;


import ynjh.personal.entity.Resume;
/**
 * 企业收到的简历
 * @author 牟勇
 *
 */
public class CompanyResume implements Serializable{
	private static final long serialVersionUID = 2079298070187296489L;
	private Integer id;//主键
	private Integer resumeId;//投递的简历ID
	private Timestamp cmprTime;//时间
	private Integer cmprStatus=2;//审核状态：1.等待审核 2.审核通过 3.审核不通过 4.删除
	private Integer cmprAction=1;//接收状态： 1.尚未阅读 2.接受简历 3.拒绝简历 4.已阅读
	private Integer cmpRecId;//岗位ID
	
	public CompanyResume() {
		
	}
	public CompanyResume(Integer resumeId, Timestamp cmprTime, Integer cmprStatus, Integer cmprAction,
			Integer cmpRecId) {
		this.resumeId = resumeId;
		this.cmprTime = cmprTime;
		this.cmprStatus = cmprStatus;
		this.cmprAction = cmprAction;
		this.cmpRecId = cmpRecId;
	}
	/**
	 * 主键
	 * @return
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 主键
	 * @param id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 简历Id
	 * @return
	 */
	public Integer getResumeId() {
		return resumeId;
	}
	/**
	 *  简历Id
	 * @param resumeId
	 */
	public void setResumeId(Integer resumeId) {
		this.resumeId = resumeId;
	}
	/**
	 * 投递时间
	 * @return
	 */
	public Timestamp getCmprTime() {
		return cmprTime;
	}
	/**
	 * 投递时间
	 * @param cmprTime
	 */
	public void setCmprTime(Timestamp cmprTime) {
		this.cmprTime = cmprTime;
	}
	/**
	 * 审核状态1.等待审核 2.审核通过 3.审核不通过 4.删除<br />
	 * 目前默认值设置为2
	 * @return
	 */
	public Integer getCmprStatus() {
		return cmprStatus;
	}
	/**
	 * 审核状态1.等待审核 2.审核通过 3.审核不通过 4.删除<br />
	 * 目前默认值设置为2
	 * @param cmprStatus
	 */
	public void setCmprStatus(Integer cmprStatus) {
		this.cmprStatus = cmprStatus;
	}
	/**
	 * 接收状态： 1.尚未阅读 2.接受简历 3.拒绝简历 4.已阅读<br />
	 * 目前默认值设置为1
	 * @return
	 */
	public Integer getCmprAction() {
		return cmprAction;
	}
	/**
	 * 接收状态： 1.尚未阅读 2.接受简历 3.拒绝简历 4.已阅读<br />
	 * 目前默认值设置为1
	 * @param cmprAction
	 */
	public void setCmprAction(Integer cmprAction) {
		this.cmprAction = cmprAction;
	}
	/**
	 * 岗位id
	 * @return
	 */
	public Integer getCmpRecId() {
		return cmpRecId;
	}
	/**
	 * 岗位id
	 * @param cmpRecId
	 */
	public void setCmpRecId(Integer cmpRecId) {
		this.cmpRecId = cmpRecId;
	}
	@Override
	public String toString() {
		return "CompanyResume [id=" + id + ", resumeId=" + resumeId + ", cmprTime=" + cmprTime + ", cmprStatus="
				+ cmprStatus + ", cmprAction=" + cmprAction + ", cmpRecId=" + cmpRecId + "]";
	}
}
