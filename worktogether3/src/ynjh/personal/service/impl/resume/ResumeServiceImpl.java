package ynjh.personal.service.impl.resume;

import java.util.List;
import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import ynjh.personal.dao.resume.ResumeMapper;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.Work;
import ynjh.personal.service.ResumeService;
@Service
public class ResumeServiceImpl implements ResumeService {
	@Resource
	private ResumeMapper resumeMapper;
	@Override
	public Integer addResume(Resume resume) {
		return resumeMapper.addResume(resume);
	}

	@Override
	public Integer updateResume(Resume resume) {
		return resumeMapper.updateResume(resume);
	}

	@Override
	public List<Resume> selectResumeUserId(Integer page,Integer userId) {
		if (page==null) {
			page=1;
		}
		if(page<1){
			page=1;
		}
		int maxPage=getMaxResumeById(userId);
		if(page>maxPage){
			page=maxPage;
		}
		return resumeMapper.selectResumeByUserId((page-1)*5,userId);
	}

	@Override
	public Resume selectResumeById(Integer id) {
		return resumeMapper.selectResumeById(id);
	}

	@Override
	public Integer deleteResumeById(Integer id) {
		return resumeMapper.deleteResumeById(id);
	}

	@Override
	public List<Resume> selectResumeByDelete(Integer id) {
		return resumeMapper.selectResumeByDelete(id);
	}

	@Override
	public Integer renewResumeById(Integer id) {
		return resumeMapper.renewResumeById(id);
	}

	@Override
	public Integer addEducation(Education education) {
		return resumeMapper.addEducation(education);
	}

	@Override
	public Integer updateEducation(Education education) {
		return resumeMapper.updateEducation(education);
	}

	@Override
	public List<Education> findEducation(Integer resumeId) {
		return resumeMapper.findEducation(resumeId);
	}

	@Override
	public Integer deleteEducation(Integer id) {
		return resumeMapper.deleteEducation(id);
	}

	@Override
	public Integer addWork(Work work) {
		return resumeMapper.addWork(work);
	}

	@Override
	public Integer updateWork(Work work) {
		return resumeMapper.updateWork(work);
	}

	@Override
	public List<Work> findWork(Integer resumeId) {
		return resumeMapper.findWork(resumeId);
	}

	@Override
	public Integer deleteWork(Integer id) {
		return resumeMapper.deleteWork(id);
	}

	@Override
	public Integer addProject(Project project) {
		return resumeMapper.addProject(project);
	}

	@Override
	public Integer updateProject(Project project) {
		return resumeMapper.updateProject(project);
	}

	@Override
	public List<Project> findProject(Integer resumeId) {
		return resumeMapper.findProject(resumeId);
	}

	@Override
	public Integer deleteProject(Integer id) {
		return resumeMapper.deleteProject(id);
	}

	@Override
	public Integer getMaxResumeById(Integer userId) {
		return (resumeMapper.getMaxResumeById(userId)+5-1)/5;
	}

	


	
}
