package ynjh.company.service.impl.companyrecruit;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ynjh.company.dao.companyrecruit.CompanyRecruitMapper;
import ynjh.company.entity.CompanyRecruit;
import ynjh.company.service.CompanyRecruitService;
@Service
public class CompanyRecruitServiceImpl implements CompanyRecruitService {
	private Logger logger=Logger.getLogger(this.getClass());
	@Resource
	private CompanyRecruitMapper companyRecruitMapper;
	@Override
	public int addCompanyRecruit(CompanyRecruit companyRecruit) {
		int result=-1;
		try {
			return companyRecruitMapper.addCompanyRecruit(companyRecruit);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("数据库添加文章失败");
		}
		return result;
	}

	@Override
	public List<CompanyRecruit> findAll(Integer page) {
		if(page==null){
			page=1;
		}
		if(page<1){
			page=1;
		}
		int maxPage=findMaxPage();
		if(page>maxPage){
			page=maxPage;
		}
		return companyRecruitMapper.findAll(page);
	}

	@Override
	public CompanyRecruit findById(Integer id) {
		return companyRecruitMapper.findById(id);
	}
	@Override
	public int hidden(Integer id) {
		return companyRecruitMapper.updateCmpRecStatus(4,id);
}

	@Override
	public int findMaxPage() {	
		return (companyRecruitMapper.getMaxRecordCount()+5-1)/5;
	}

	@Override
	public int updateCompanyRecruit(CompanyRecruit companyRecruit) {
	
		return (companyRecruitMapper.updateCmpRecruit(companyRecruit));
	}

	@Override
	public int updateCmpRecStatus(Integer id, Integer cmpRecStatus) {
		return companyRecruitMapper.updateCmpRecStatus(id, cmpRecStatus);
	}

}
