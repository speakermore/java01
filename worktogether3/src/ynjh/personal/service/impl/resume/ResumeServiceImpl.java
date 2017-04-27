package ynjh.personal.service.impl.resume;

import java.util.List;
import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import ynjh.personal.dao.resume.ResumeMapper;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.ForeignKeyEducation;
import ynjh.personal.entity.ForeignKeyProject;
import ynjh.personal.entity.ForeignKeyWork;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.Work;
import ynjh.personal.service.ResumeService;

/**
 * 
 * @author 刘志浩 操作简历信息
 */
@Service
public class ResumeServiceImpl implements ResumeService {
	@Resource
	private ResumeMapper resumeMapper;

	/**
	 * 添加简历基本信息
	 * 
	 * @return Integer 1成功 0失败
	 * @param resume
	 *            简历对象
	 */
	@Override
	public Integer addResume(Resume resume) {
		return resumeMapper.addResume(resume);
	}

	/**
	 * 修改简历基本信息
	 * 
	 * @return Integer 1成功 0失败
	 * @param resume
	 *            简历对象
	 */
	@Override
	public Integer updateResume(Resume resume) {
		return resumeMapper.updateResume(resume);
	}

	/**
	 * 查询用户未删除的简历信息
	 * 
	 * @return List<Resume> 返回简历列表信息
	 * @param page
	 *            当前页码
	 * @param userId
	 *            用户id
	 */
	@Override
	public List<Resume> selectResumeUserId(Integer page, Integer userId) {
		if (page == null) {
			page = 1;
		}
		if (page < 1) {
			page = 1;
		}
		int maxPage = getMaxResumeById(userId);

		if (page > maxPage) {
			page = maxPage;
		}
		return resumeMapper.selectResumeByUserId((page - 1) * 5, userId);
	}

	/**
	 * 查询简历详细信息
	 * 
	 * @return resume 简历对象
	 * @param id
	 *            简历id
	 */
	@Override
	public Resume selectResumeById(Integer id) {
		return resumeMapper.selectResumeById(id);
	}

	/**
	 * 删除简历
	 * 
	 * @return Integer 1成功 0失败
	 * @param id
	 *            简历id
	 */
	@Override
	public Integer deleteResumeById(Integer id) {
		return resumeMapper.deleteResumeById(id);
	}

	

	/**
	 * 恢复被删除的简历
	 * 
	 * @return Integer 1成功 0失败
	 * @param id
	 *            简历id
	 */
	@Override
	public Integer renewResumeById(Integer id) {
		return resumeMapper.renewResumeById(id);
	}

	/**
	 * 添加教育记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param education
	 *            教育记录对象
	 */
	@Override
	public Integer addEducation(Education education) {
		return resumeMapper.addEducation(education);
	}

	/**
	 * 修改教育记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param education
	 *            教育记录对象
	 */
	@Override
	public Integer updateEducation(Education education) {
		return resumeMapper.updateEducation(education);
	}

	/**
	 * 查看用户未被删除的所有教育记录
	 * 
	 * @return List<Education> 教育记录对象列表
	 * @param resumeId
	 *            简历id
	 */
	@Override
	public List<Education> findEducation(Integer resumeId) {
		return resumeMapper.findEducation(resumeId);
	}

	/**
	 * 删除教育记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param id
	 *            教育记录id
	 */
	@Override
	public Integer deleteEducation(Integer id) {
		return resumeMapper.deleteEducation(id);
	}

	/**
	 * 添加工作记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param work
	 *            工作记录对象
	 */
	@Override
	public Integer addWork(Work work) {
		return resumeMapper.addWork(work);
	}

	/**
	 * 修改工作记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param work
	 *            工作记录对象
	 */
	@Override
	public Integer updateWork(Work work) {
		return resumeMapper.updateWork(work);
	}

	/**
	 * 查看此简历未被删除的工作记录
	 * 
	 * @return List<Work> 工作记录对象列表
	 * @param resumeId
	 *            简历id
	 */
	@Override
	public List<Work> findWork(Integer resumeId) {
		return resumeMapper.findWork(resumeId);
	}

	/**
	 * 删除工作记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param id
	 *            工作记录id
	 */
	@Override
	public Integer deleteWork(Integer id) {
		return resumeMapper.deleteWork(id);
	}

	/**
	 * 添加项目记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param project
	 *            项目记录对象
	 */
	@Override
	public Integer addProject(Project project) {
		return resumeMapper.addProject(project);
	}

	/**
	 * 修改项目记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param project
	 *            项目记录对象
	 */
	@Override
	public Integer updateProject(Project project) {
		return resumeMapper.updateProject(project);
	}

	/**
	 * 查看此简历未被删除的工作记录
	 * 
	 * @return List<Project> 项目记录对象
	 * @param resumeId
	 *            简历id
	 */
	@Override
	public List<Project> findProject(Integer resumeId) {
		return resumeMapper.findProject(resumeId);
	}

	/**
	 * 删除工作记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param id
	 *            工作记录id
	 */
	@Override
	public Integer deleteProject(Integer id) {
		return resumeMapper.deleteProject(id);
	}

	/**
	 * 获得未被删除的简历总数
	 * 
	 * @return Integer 1成功 0失败
	 * @param userId
	 *            用户id
	 */
	@Override
	public Integer getMaxResumeById(Integer userId) {
		if (resumeMapper.getMaxResumeById(userId) <= 0) {
			return 1;
		} else {
			return (resumeMapper.getMaxResumeById(userId) + 5 - 1) / 5;
		}
	}

	/**
	 * 获得被删除的教育总数
	 * 
	 * @return Integer 1成功 0失败
	 * @param userId
	 *            用户id
	 */
	@Override
	public Integer getMaxEducationDeleteById(Integer userId) {
		if (resumeMapper.getMaxEducationDeleteById(userId) <= 0) {
			return 1;
		} else {
			return (resumeMapper.getMaxEducationDeleteById(userId) + 5 - 1) / 5;
		}

	}
	/**
	 * 获得被删除的工作总数
	 * 
	 * @return Integer 1成功 0失败
	 * @param userId
	 *            用户id
	 */
	@Override
	public Integer getMaxWorkDeleteById(Integer userId) {
		if (resumeMapper.getMaxWorkDeleteById(userId) <= 0) {
			return 1;
		} else {
			return (resumeMapper.getMaxWorkDeleteById(userId) + 5 - 1) / 5;
		}

	}
	/**
	 * 获得被删除的项目总数
	 * 
	 * @return Integer 1成功 0失败
	 * @param userId
	 *            用户id
	 */
	@Override
	public Integer getMaxProjectDeleteById(Integer userId) {
		if (resumeMapper.getMaxProjectDeleteById(userId) <= 0) {
			return 1;
		} else {
			return (resumeMapper.getMaxProjectDeleteById(userId) + 5 - 1) / 5;
		}

	}
	/**
	 * 获得被删除的教育
	 * 
	 * @return List<Education> 教育对象
	 * @param page 当前页
	 * @param userId 用户id
	 *           
	 */
	@Override
	public List<ForeignKeyEducation> findEducationByDelete(Integer page, Integer userId) {
		if (page == null) {
			page = 1;
		}
		if (page < 1) {
			page = 1;
		}
		int maxPage = getMaxResumeById(userId);

		if (page > maxPage) {
			page = maxPage;
		}
		return resumeMapper.findEducationByDelete((page - 1) * 5, userId);
	}
	/**
	 * 获得被删除的工作
	 * 
	 * @return List<Work> 工作对象
	 * @param page 当前页
	 * @param userId 用户id
	 *           
	 */
	@Override
	public List<ForeignKeyWork> findWorkByDelete(Integer page, Integer userId) {
		if (page == null) {
			page = 1;
		}
		if (page < 1) {
			page = 1;
		}
		int maxPage = getMaxResumeById(userId);

		if (page > maxPage) {
			page = maxPage;
		}
		return resumeMapper.findWorkByDelete((page - 1) * 5, userId);
	}
	/**
	 * 获得被删除的项目
	 * 
	 * @return List<Project> 项目对象
	 * @param page 当前页
	 * @param userId 用户id
	 *           
	 */
	@Override
	public List<ForeignKeyProject> findProjectByDelete(Integer page, Integer userId) {
		if (page == null) {
			page = 1;
		}
		if (page < 1) {
			page = 1;
		}
		int maxPage = getMaxResumeById(userId);

		if (page > maxPage) {
			page = maxPage;
		}
		return resumeMapper.findProjectByDelete((page - 1) * 5, userId);
	}
	/**
	 * 恢复被删的教育记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param id 教育id
	 *            
	 */
	@Override
	public Integer renewEducationByDelete(Integer id) {
		return resumeMapper.renewEducationByDelete(id);
	}
	/**
	 * 恢复被删的工作记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param id 工作id
	 *            
	 */
	@Override
	public Integer renewWorkByDelete(Integer id) {
		return resumeMapper.renewWorkByDelete(id);
	}
	/**
	 * 恢复被删的项目记录
	 * 
	 * @return Integer 1成功 0失败
	 * @param id 项目id
	 *            
	 */
	@Override
	public Integer renewProjectByDelete(Integer id) {
		return resumeMapper.renewProjectByDelete(id);
	}
}
