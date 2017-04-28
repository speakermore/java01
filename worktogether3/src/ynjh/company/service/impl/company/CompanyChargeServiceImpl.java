package ynjh.company.service.impl.company;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import ynjh.company.dao.company.CompanyChargeMapper;
import ynjh.company.entity.CompanyCharge;
import ynjh.company.service.CompanyChargeService;

@Service
public class CompanyChargeServiceImpl implements CompanyChargeService {
	@Resource
	CompanyChargeMapper companyChargeMapper;

	@Override
	public Integer addMoney(CompanyCharge companyCharge) {
		return companyChargeMapper.addMoney(companyCharge);
	}

	@Override
	public CompanyCharge findById(Integer companyId) {
		return companyChargeMapper.findById(companyId);
	}

	@Override
	public Integer consumeMoney(CompanyCharge cmpChargeConsume) {
		return companyChargeMapper.consumeMoney(cmpChargeConsume);
	}


	@Override
	public List<CompanyCharge> findAllById(Integer companyId) {
	
		return companyChargeMapper.findAllById(companyId);
	}

	@Override
	public Integer getMaxPage(Integer companyId) {
		return (companyChargeMapper.getMaxRecordCount(companyId)+4)/5;
	}




}
