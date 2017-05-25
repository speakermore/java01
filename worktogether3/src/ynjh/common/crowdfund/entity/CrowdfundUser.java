package ynjh.common.crowdfund.entity;

import java.io.Serializable;

/**
 * 岗位-众筹项目-用户信息对应表
 * @author 何爽
 *
 */
public class CrowdfundUser implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer crowdfundId;//项目众筹表ID
	private String demandJobName;//岗位名称
	private Integer userId;//用户表ID
	private Integer checkStatus;//众筹录用状态
	//附加项（mybatis导入联表查询数据）
	private String crowdfundProjectName;//众筹项目名称
	private String crowdfundProjectCycle;//众筹项目周期
	private String crowdfundProjectMoney;//众筹项目金额
	private Integer publisherId;//众筹发布者ID
	private Integer crowdfundProjectState;//众筹进度
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCrowdfundId() {
		return crowdfundId;
	}
	public void setCrowdfundId(Integer crowdfundId) {
		this.crowdfundId = crowdfundId;
	}
	public String getDemandJobName() {
		return demandJobName;
	}
	public void setDemandJobName(String demandJobName) {
		this.demandJobName = demandJobName;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}
	public String getCrowdfundProjectName() {
		return crowdfundProjectName;
	}
	public void setCrowdfundProjectName(String crowdfundProjectName) {
		this.crowdfundProjectName = crowdfundProjectName;
	}
	public String getCrowdfundProjectCycle() {
		return crowdfundProjectCycle;
	}
	public void setCrowdfundProjectCycle(String crowdfundProjectCycle) {
		this.crowdfundProjectCycle = crowdfundProjectCycle;
	}
	public String getCrowdfundProjectMoney() {
		return crowdfundProjectMoney;
	}
	public void setCrowdfundProjectMoney(String crowdfundProjectMoney) {
		this.crowdfundProjectMoney = crowdfundProjectMoney;
	}
	public Integer getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(Integer publisherId) {
		this.publisherId = publisherId;
	}
	public Integer getCrowdfundProjectState() {
		return crowdfundProjectState;
	}
	public void setCrowdfundProjectState(Integer crowdfundProjectState) {
		this.crowdfundProjectState = crowdfundProjectState;
	}
	
	
}
