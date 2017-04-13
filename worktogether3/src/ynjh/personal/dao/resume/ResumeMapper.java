package ynjh.personal.dao.resume;

import java.util.List;

import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.Work;

public interface ResumeMapper {

	/**
	 * 添加简历
	 */
	public Integer addResume(Resume resume);	
	/**
	 * 修改简历
	 */
	public Integer updateResume(Resume resume);	
	/**
	 * 根据Userid查询简历(多个)
	 */
	public List<Resume> selectResumeByUserId(Integer userId);
	/**
	 * 根据id查询简历（单个）
	 */
	public Resume selectResumeById(Integer id);
	/***
	 * 删除简历
	 */
	public Integer deleteResumeById(Integer id);
	
	/***
	 * 查新被删除的简历
	 */
	public List<Resume> selectResumeByDelete(Integer userId);
	/***
	 * 恢复简历
	 */
	public Integer renewResumeById(Integer id);
	
	
	/**
	 * 开始
	 * 教育记录添加
	 */
	public Integer addEducation(Education education);
	/**
	 * 教育记录修改
	 */
	public Integer updateEducation(Education education);
	/**
	 * 教育记录查询
	 */
	public List<Education> findEducation(Integer resumeId);
	/**
	 * 教育记录删除
	 */
	public Integer deleteEducation(Integer id);
	
	/**
	 * 工作记录添加
	 */
	public Integer addWork(Work work);
	/**
	 * 工作记录修改
	 */
	public Integer updateWork(Work work);
	/**
	 * 工作记录查询
	 */
	public List<Work> findWork(Integer resumeId);
	/**
	 * 工作记录删除
	 */
	public Integer deleteWork(Integer id);
	/**
	 * 项目记录添加
	 */
	public Integer addProject(Project project);
	/**
	 * 项目记录修改
	 */
	public Integer updateProject(Project project);
	/**
	 * 项目记录查询
	 */
	public List<Project> findProject(Integer resumeId);
	/**
	 * 项目记录删除
	 */
	public Integer deleteProject(Integer id);
	/**
	 * 结束
	 */
	
}