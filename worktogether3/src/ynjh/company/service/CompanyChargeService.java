package ynjh.company.service;

import java.util.List;

import ynjh.company.entity.CompanyCharge;

public interface CompanyChargeService {
	//充值
	public Integer addMoney(CompanyCharge companyCharge);
	//查询余额
	public CompanyCharge findById(Integer CompanyId);
	//查询账单
	public List<CompanyCharge> findAllById(Integer CompanyId);
	//消费
	public Integer consumeMoney(CompanyCharge chargeConsume);
	//记录数
	public Integer getMaxPage(Integer companyId);
	
}
