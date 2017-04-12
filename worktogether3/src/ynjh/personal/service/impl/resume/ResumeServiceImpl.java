package ynjh.personal.service.impl.resume;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.personal.dao.resume.ResumeMapper;
import ynjh.personal.entity.Resume;
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
	public List<Resume> selectResumeUserId(Integer userId) {
		return resumeMapper.selectResumeByUserId(userId);
	}

	@Override
	public Resume selectResumeById(Integer id) {
		return resumeMapper.selectResumeById(id);
	}

	@Override
	public Integer deleteResumeById(Integer id) {
		return resumeMapper.deleteResumeById(id);
	}


	
}
