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
	public List<CompanyCharge> findAllById(Integer companyId,Integer page) {
		if(page==null){
			page=1;
		}
		
		if(page<1){
			page=1;
		}
		int maxPage=getMaxPage(companyId);
		if(page>maxPage){
			page=maxPage;
		}
		
		
		return companyChargeMapper.findAllById(companyId, page);
	}

	@Override
	public Integer getMaxPage(Integer companyId) {
		return (companyChargeMapper.getMaxRecordCount(companyId)+4)/5;
	}




}
