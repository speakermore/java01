package ynjh.company.entity;

import java.sql.Timestamp;

public class CompanyCharge {
	private Double CmpChargeMoney;	//充值金额
	private Timestamp cmpChargeTime;//操作时间
	private Double cmpChargeConsume;//消费金额
	private Double cmpChargeBalance;//余额
	
	public CompanyCharge(){}
	
	public CompanyCharge(Double cmpChargeMoney, Timestamp cmpChargeTime, Double cmpChargeConsume,
			Double cmpChargeBalance) {
		super();
		CmpChargeMoney = cmpChargeMoney;
		this.cmpChargeTime = cmpChargeTime;
		this.cmpChargeConsume = cmpChargeConsume;
		this.cmpChargeBalance = cmpChargeBalance;
	}


	public Double getCmpChargeMoney() {
		return CmpChargeMoney;
	}
	public void setCmpChargeMoney(Double cmpChargeMoney) {
		CmpChargeMoney = cmpChargeMoney;
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
	@Override
	public String toString() {
		return "CompanyCharge [CmpChargeMoney=" + CmpChargeMoney + ", cmpChargeTime=" + cmpChargeTime
				+ ", cmpChargeConsume=" + cmpChargeConsume + ", cmpChargeBalance=" + cmpChargeBalance + "]";
	}
	
	
	
	
}
