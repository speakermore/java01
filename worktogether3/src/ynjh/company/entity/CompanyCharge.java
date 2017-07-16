package ynjh.company.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class CompanyCharge implements Serializable{
	
	private static final long serialVersionUID = 1953669583188341146L;
	private Integer companyId;//公司id
	private Double cmpChargeMoney=0.0;	//充值金额
	private Timestamp cmpChargeTime;//操作时间
	private Double cmpChargeConsume=0.0;//消费金额
	private Double cmpChargeBalance=0.0;//余额
	private Integer cmpChargeStatus;//充值状态
	
	public CompanyCharge(){}

	public CompanyCharge(Integer companyId, Double cmpChargeMoney, Timestamp cmpChargeTime, Double cmpChargeConsume,
			Double cmpChargeBalance, Integer cmpChargeStatus) {
		super();
		this.companyId = companyId;
		this.cmpChargeMoney = cmpChargeMoney;
		this.cmpChargeTime = cmpChargeTime;
		this.cmpChargeConsume = cmpChargeConsume;
		this.cmpChargeBalance = cmpChargeBalance;
		this.cmpChargeStatus = cmpChargeStatus;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public Double getCmpChargeMoney() {
		return cmpChargeMoney;
	}

	public void setCmpChargeMoney(Double cmpChargeMoney) {
		this.cmpChargeMoney = cmpChargeMoney;
	}

	public Timestamp getCmpChargeTime() {
		return cmpChargeTime;
	}

	public void setCmpChargeTime(Timestamp cmpChargeTime) {
		this.cmpChargeTime = cmpChargeTime;
	}

	public Double getCmpChargeConsume() {
		return cmpChargeConsume;
	}

	public void setCmpChargeConsume(Double cmpChargeConsume) {
		this.cmpChargeConsume = cmpChargeConsume;
	}

	public Double getCmpChargeBalance() {
		return cmpChargeBalance;
	}

	public void setCmpChargeBalance(Double cmpChargeBalance) {
		this.cmpChargeBalance = cmpChargeBalance;
	}

	public Integer getCmpChargeStatus() {
		return cmpChargeStatus;
	}

	public void setCmpChargeStatus(Integer cmpChargeStatus) {
		this.cmpChargeStatus = cmpChargeStatus;
	}

	@Override
	public String toString() {
		return "CompanyCharge [companyId=" + companyId + ", cmpChargeMoney=" + cmpChargeMoney + ", cmpChargeTime="
				+ cmpChargeTime + ", cmpChargeConsume=" + cmpChargeConsume + ", cmpChargeBalance=" + cmpChargeBalance
				+ ", cmpChargeStatus=" + cmpChargeStatus + "]";
	}
	
}
