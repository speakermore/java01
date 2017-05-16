package ynjh.company.service.impl.company;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import ynjh.company.dao.company.CompanyMapper;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyDetailImg;
import ynjh.company.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Resource
	private CompanyMapper companyMapper;
	
	@Override
	public Integer addCompany(Company company) {
		return companyMapper.addCompany(company);
	}

	@Override
	public Integer updateCompany(Company company) {
		return companyMapper.updateCompanyById(company);
	}

	@Override
	public Company login(String companyLoginId, String companyPassword) {
		return companyMapper.findByloginIdAndPassword(companyLoginId, companyPassword);
	}

	@Override
	public Company findCompany(Integer id) {
		return companyMapper.findById(id);
	}

	@Override
	public Integer addCompanyDetailId(Integer companyId, String companyDetailImg,Integer companyDetailDiscInt) {
		String companyDetailDisc="";
		switch(companyDetailDiscInt){
		case 0:companyDetailDisc="大门";
			break;
		case 1:
			companyDetailDisc="前台";
			break;
		case 2:
			companyDetailDisc="办公区";
			break;
		case 3:
			companyDetailDisc="会议室";
			break;
		case 4:
			companyDetailDisc="休息区";
			break;
		case 5:companyDetailDisc="其他";
			break;
		default:
		}
		
		return companyMapper.addCompanyDetailImg(companyId, companyDetailImg,companyDetailDisc);
	}

	@Override
	public List<CompanyDetailImg> findDetailImg(Integer companyId) {
		
		return companyMapper.findDetailImg(companyId);
	}

	@Override
	public Integer updatePassword(Integer id, String newPassword) {
		
		return companyMapper.updatePassword(id, newPassword);
	}

	
	
}
