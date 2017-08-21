package ynjh.company.service.impl.companyResume;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.company.dao.companyResume.CompanyResumeMapper;
import ynjh.company.entity.CompanyResume;
import ynjh.company.service.CompanyResumeService;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Work;
@Service
public class CompanyResumeServiceImpl implements CompanyResumeService {
	//private Logger logger=Logger.getLogger(this.getClass());
	@Resource
	private CompanyResumeMapper companyResumeMapper;
	@Override
	public List<Map<String, Object>> findApplyList(Integer cmpRecId){
		return companyResumeMapper.findCompanyResumeBycmpRecId(cmpRecId);
	}
	@Override
	public CompanyResume findById(Integer id){
		return companyResumeMapper.findById(id);
	}
	@Override
	public Integer updateCmpResumeStatus(Integer id,Integer cmprAction){
		return companyResumeMapper.updatecmprActionById(id, cmprAction);
	}
	@Override
	public List<Project> findProject(Integer resumeId){
		return companyResumeMapper.findProject(resumeId);
	}
	@Override
	public List<Work> findWork(Integer resumeId){
		return companyResumeMapper.findWork(resumeId);
	}
	@Override
	public List<Education> findEducation(Integer resumeId){
		return companyResumeMapper.findEducation(resumeId);
	}
	@Override
	public Integer addCompanyResume(CompanyResume companyResume) {
		
		return companyResumeMapper.addCompanyResume(companyResume);
	}
	@Override
	public Integer isCompanyResumeExist(Integer recruitId, Integer resumeId) {
		
		return companyResumeMapper.countCompanyResumeByRecruitIdAndResumeId(recruitId,resumeId);
	}
}