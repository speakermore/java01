package ynjh.company.service.impl.company;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.company.dao.company.CompanyMapper;
import ynjh.company.entity.Company;
import ynjh.company.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Resource
	private CompanyMapper companyMapper;
	
	@Override
	public int addCompany(Company company) {
		return companyMapper.addCompany(company);
	}

	@Override
	public int updateCompany(Integer companyId) {
		return companyMapper.updateCompanyById(companyId);
	}

	@Override
	public Company login(String companyLoginId, String companyPassword) {
		return companyMapper.findByloginIdAndPassword(companyLoginId, companyPassword);
	}

	@Override
	public Company findCompany(Integer companyId) {
		return companyMapper.findById(companyId);
	}
	
}
