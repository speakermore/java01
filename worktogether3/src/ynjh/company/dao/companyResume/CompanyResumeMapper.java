package ynjh.company.dao.companyResume;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.CompanyResume;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Work;

public interface CompanyResumeMapper {
	public List<CompanyResume> findAllResume(@Param("companyRecruitId")Integer companyRecruitId);
	public CompanyResume findById(Integer id);
	public Integer updateCmpResumeStatus(@Param("id")Integer id,@Param("cmprAction")Integer cmprAction);
	public List<Project> findProject(Integer resumeId);
	public List<Work> findWork(Integer resumeId);
	public List<Education> findEducation(Integer resumeId);
}
