package ynjh.company.service.impl.companyrecruit;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ynjh.common.crowdfund.dao.job.JobMapper;
import ynjh.common.crowdfund.entity.Job;
import ynjh.company.dao.companyrecruit.CompanyRecruitMapper;
import ynjh.company.entity.CompanyRecruit;
import ynjh.company.service.CompanyRecruitService;
import ynjh.personal.dao.resume.ResumeMapper;
import ynjh.personal.entity.Resume;
import ynjh.personal.service.ResumeService;
@Service
public class CompanyRecruitServiceImpl implements CompanyRecruitService {
	private Logger logger=Logger.getLogger(this.getClass());
	@Resource
	private CompanyRecruitMapper companyRecruitMapper;
	@Resource
	private ResumeService resumeService;
	@Resource
	private ResumeMapper resumeMapper;
	@Resource
	private JobMapper jobMapper;
	
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
	public List<CompanyRecruit> findAll(Integer page,Integer companyId) {
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
		return companyRecruitMapper.findAll((page-1)*20,companyId);
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
		return (companyRecruitMapper.getMaxRecordCount()+20-1)/20;
	}

	@Override
	public int updateCompanyRecruit(CompanyRecruit companyRecruit) {
	
		return (companyRecruitMapper.updateCmpRecruit(companyRecruit));
	}

	@Override
	public int updateCmpRecStatus(Integer id, Integer cmprAction) {
		return companyRecruitMapper.updateCmpRecStatus(id, cmprAction);
	}
	@Override
	public int findCount(Integer companyRecruitId){	
		return companyRecruitMapper.getResumeCount(companyRecruitId);
	}
	@Override
	public Integer findCompanyRecruitId(){
		return companyRecruitMapper.findCompanyRecruitId();
	}
	@Override
	public int recover(Integer id){
		return companyRecruitMapper.updateCmpRecStatus(1, id);
	}
	@Override
	public List<Job> findJobs1(){
		return jobMapper.findJob1();
	}
	//模糊查找我感兴趣的招聘信息，用于个人用户首页的显示
	@Override
	public List<CompanyRecruit> findMyIntrestRecruit(Integer userId) {
		//查找用户拥有的全部简历集合
		List<Resume> resumes=resumeMapper.findResumeByUserId(null,userId);
		//提取出简历的岗位名称
		List<String> resumeTitles=resumes.stream().map(r->r.getResumeTitle()).collect(Collectors.toList());
		List<List<CompanyRecruit>> originCompanyRecruits=new ArrayList<List<CompanyRecruit>>();
		//循环所有岗位名称，查出所有符合条件的集合
		for(String resume:resumeTitles){
			originCompanyRecruits.add(companyRecruitMapper.findByCmpRecTitle(resume));
			
		}
		//扁平化处理，把多个集合中的招聘信息实体类合并到同一个集合中
		List<CompanyRecruit> companyRecruits=originCompanyRecruits.stream().flatMap(childList->childList.stream()).distinct().collect(Collectors.toList());
		return companyRecruits;
	}
}
