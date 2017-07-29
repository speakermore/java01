package ynjh.company.dao.company;


import java.util.List;

import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyCharge;

public interface CompanyChargeMapper {
	//充值
	public Integer addMoney(CompanyCharge companyCharge);
	//查询余额
	public CompanyCharge findById(Integer companyId);
	//查询账单
	public List<CompanyCharge> findAllById(Integer companyId);
	//消费
	public Integer consumeMoney(CompanyCharge cmpChargeConsume);
	//最大页码
	public Integer getMaxRecordCount(Integer companyId);
	
}
