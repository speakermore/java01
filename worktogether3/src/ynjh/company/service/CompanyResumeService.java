package ynjh.company.service;

import java.util.List;

import ynjh.company.entity.CompanyResume;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Work;

public interface CompanyResumeService {
	//查询
	public List<CompanyResume> findAllResume(Integer companyRecruitId);
	//查询想详细信息
	public CompanyResume findById(Integer Id);
	//修改简历状态
	public Integer updateCmpResumeStatus(Integer id,Integer cmprAction);
	//查询项目经验
	public List<Project> findProject(Integer resumeId);
	//查询工作经历
	public List<Work> findWork(Integer resumeId);
	//查询教育经历
	public List<Education> findEducation(Integer resumeId);
	
}
