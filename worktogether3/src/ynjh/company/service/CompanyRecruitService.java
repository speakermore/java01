package ynjh.company.service;



import java.util.List;

import ynjh.company.entity.CompanyRecruit;

public interface CompanyRecruitService {
	public int addCompanyRecruit(CompanyRecruit companyRecruit);
	public List<CompanyRecruit> findAll(Integer page);
	public CompanyRecruit findById(Integer id);
	public int hidden(Integer id);
	public int findMaxPage(); 
	public int updateCompanyRecruit(CompanyRecruit companyRecruit);
	public int updateCmpRecStatus(Integer id,Integer cmpRecStatus);
	
}
