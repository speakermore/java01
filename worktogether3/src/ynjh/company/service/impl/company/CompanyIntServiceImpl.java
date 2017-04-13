package ynjh.company.service.impl.company;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import ynjh.company.dao.company.CompanyIntroductionMapper;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.service.CompanyIntService;

@Service
public class CompanyIntServiceImpl implements CompanyIntService {
@Resource
CompanyIntroductionMapper companyIntMapper;
	@Override
	public Integer updateCompanyInt(CompanyIntroduction companyInt) {
		return companyIntMapper.updateCompanyInt(companyInt);
	}
	@Override
	public CompanyIntroduction findById(Integer id) {
//		if(companyIntMapper.findById(id)=null){
//			return ;
//		}
		return companyIntMapper.findById(id);		
}
	@Override
	public Integer addCompanyInt(CompanyIntroduction companyInt) {
		return companyIntMapper.addCompanyInt(companyInt);
	}
	
}