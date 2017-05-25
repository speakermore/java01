package ynjh.common.crowdfund.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 项目众筹实体类
 * @author 何爽
 *date:2017-5-10
 */
public class Crowdfund implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;//众筹项目ID
	private String crowdfundProjectName;//众筹项目名称
	private String crowdfundProjectSummary;//众筹项目简介
	private String crowdfundProjectMoney;//项目金额
	private String crowdfundProjectCycle;//项目周期
	private String crowdfundProjectMethod;//众筹办法
	private Timestamp crowdfundProjectStartDate;//项目开始时间
	private Timestamp crowdfundProjectEndDate;//项目结束时间
	private Integer crowdfundProjectCheckState;//众筹审核状态
	private Integer crowdfundProjectState;//众筹进度状态
	private Integer publisherId;//发布者ID
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCrowdfundProjectName() {
		return crowdfundProjectName;
	}
	public void setCrowdfundProjectName(String crowdfundProjectName) {
		this.crowdfundProjectName = crowdfundProjectName;
	}
	public String getCrowdfundProjectSummary() {
		return crowdfundProjectSummary;
	}
	public void setCrowdfundProjectSummary(String crowdfundProjectSummary) {
		this.crowdfundProjectSummary = crowdfundProjectSummary;
	}
	public String getCrowdfundProjectMoney() {
		return crowdfundProjectMoney;
	}
	public void setCrowdfundProjectMoney(String crowdfundProjectMoney) {
		this.crowdfundProjectMoney = crowdfundProjectMoney;
	}
	public String getCrowdfundProjectCycle() {
		return crowdfundProjectCycle;
	}
	public void setCrowdfundProjectCycle(String crowdfundProjectCycle) {
		this.crowdfundProjectCycle = crowdfundProjectCycle;
	}
	public String getCrowdfundProjectMethod() {
		return crowdfundProjectMethod;
	}
	public void setCrowdfundProjectMethod(String crowdfundProjectMethod) {
		this.crowdfundProjectMethod = crowdfundProjectMethod;
	}
	public Timestamp getCrowdfundProjectStartDate() {
		return crowdfundProjectStartDate;
	}
	public void setCrowdfundProjectStartDate(Timestamp crowdfundProjectStartDate) {
		this.crowdfundProjectStartDate = crowdfundProjectStartDate;
	}
	public Timestamp getCrowdfundProjectEndDate() {
		return crowdfundProjectEndDate;
	}
	public void setCrowdfundProjectEndDate(Timestamp crowdfundProjectEndDate) {
		this.crowdfundProjectEndDate = crowdfundProjectEndDate;
	}
	public Integer getCrowdfundProjectCheckState() {
		return crowdfundProjectCheckState;
	}
	public void setCrowdfundProjectCheckState(Integer crowdfundProjectCheckState) {
		this.crowdfundProjectCheckState = crowdfundProjectCheckState;
	}
	public Integer getCrowdfundProjectState() {
		return crowdfundProjectState;
	}
	public void setCrowdfundProjectState(Integer crowdfundProjectState) {
		this.crowdfundProjectState = crowdfundProjectState;
	}
	
	public Integer getPublisherId() {
		return publisherId;
	}
	public void setPublisher(Integer publisherId) {
		this.publisherId = publisherId;
	}
	@Override
	public String toString() {
		return "Crowdfund [id=" + id + ", crowdfundProjectName=" + crowdfundProjectName + ", crowdfundProjectSummary="
				+ crowdfundProjectSummary + ", crowdfundProjectMoney=" + crowdfundProjectMoney
				+ ", crowdfundProjectCycle=" + crowdfundProjectCycle + ", crowdfundProjectMethod="
				+ crowdfundProjectMethod + ", crowdfundProjectStartDate=" + crowdfundProjectStartDate
				+ ", crowdfundProjectEndDate=" + crowdfundProjectEndDate + ", crowdfundProjectCheckState="
				+ crowdfundProjectCheckState + ", crowdfundProjectState=" + crowdfundProjectState +"publisherId="+publisherId+ "]";
	}
	
	
	
}
