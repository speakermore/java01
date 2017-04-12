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
		return companyRecruitMapper.findAll(page);
	}

	@Override
	public CompanyRecruit findById(Integer id) {
		return companyRecruitMapper.findById(id);
	}

	@Override
	public int hidden(Integer id) {
		return companyRecruitMapper.hidden(id);

}
}

