package ynjh.common.crowdfund.entity;

import java.io.Serializable;

/**
 * 项目众筹岗位需求实体类
 * @author 何爽
 *
 */
public class CrowdfundDemand implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer crowdfundId;//项目众筹ID
	private String demandJobName;//需求岗位表ID
	private String demandSummary;//需求描述
	private Integer demandPeopleCount;//需求人数
	

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


	public String getDemandSummary() {
		return demandSummary;
	}


	public void setDemandSummary(String demandSummary) {
		this.demandSummary = demandSummary;
	}


	public Integer getDemandPeopleCount() {
		return demandPeopleCount;
	}


	public void setDemandPeopleCount(Integer demandPeopleCount) {
		this.demandPeopleCount = demandPeopleCount;
	}


	@Override
	public String toString() {
		return "CrowdfundDemand [id=" + id + ", crowdfundId=" + crowdfundId + ", demandJobName=" + demandJobName + ", demandSummary="
				+ demandSummary + ", demandPeopleCount=" + demandPeopleCount + "]";
	}
	
	
}
