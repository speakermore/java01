package ynjh.company.dao.company;


import ynjh.company.entity.CompanyCharge;

public interface CompanyChargeMapper {
	//充值
	public Integer addMoney(CompanyCharge companyCharge);
	//查询余额
	public Double findById(Integer CompanyId);
	//查询账单
	public Double findAllById(Integer CompanyId);
	//消费
	public Double updateMoney(CompanyCharge companyCharge);
	
}
