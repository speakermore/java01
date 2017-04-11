package ynjh.company.service.impl.company;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import ynjh.company.dao.company.CompanyIntrodutionMapper;
import ynjh.company.entity.CompanyIntrodution;
import ynjh.company.service.CompanyIntService;

@Controller
public class CompanyIntServiceImpl implements CompanyIntService {
@Resource
CompanyIntrodutionMapper companyIntMapper;
	@Override
	public Integer updateCompanyInt(CompanyIntrodution companyInt) {
		Integer temp=null;
		if(companyIntMapper.findById(companyInt.getCompanyId())==null){
			temp=companyIntMapper.addCompanInt(companyInt);
		}else{
			temp=companyIntMapper.updateCompanyInt(companyInt.getCompanyId());
		}
		return temp;
	}
	@Override
	public CompanyIntrodution findById(Integer id) {
		
		return companyIntMapper.findById(id);		
}
}