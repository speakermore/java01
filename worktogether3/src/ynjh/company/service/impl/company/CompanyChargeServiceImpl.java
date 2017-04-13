package ynjh.company.service.impl.company;

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

}
