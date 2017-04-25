package ynjh.personal.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.Work;
/**
 * 
 *  @author 刘志浩
 * 操作简历接口
 *
 */
public interface ResumeService {
	//添加简历
	public Integer addResume(Resume resume);	
	// 修改简历
	public Integer updateResume(Resume resume);	
	// 根据id查询简历（审查接口）(所有)
	public List<Resume> selectResumeUserId(Integer page,Integer userId);	
	// 根据id查询简历（审查接口）详细
	public Resume selectResumeById(Integer id);
	 // 删除简历
	public Integer deleteResumeById(Integer id);
	
	// 恢复简历
	public Integer renewResumeById(Integer id);
	//////////////////////////////////
	//教育记录添加
	public Integer addEducation(Education education);
	//教育记录修改
	public Integer updateEducation(Education education);
	// 教育记录查询
	public List<Education> findEducation(Integer resumeId);
	// 教育记录删除
	public Integer deleteEducation(Integer id);
	//工作记录添加
	public Integer addWork(Work work);
	// 工作记录修改
	public Integer updateWork(Work work);
	// 工作记录查询
	public List<Work> findWork(Integer resumeId);
	// 工作记录删除
	public Integer deleteWork(Integer id);
	// 项目记录添加
	public Integer addProject(Project project);
	// 项目记录修改
	public Integer updateProject(Project project);
	// 项目记录查询
	public List<Project> findProject(Integer resumeId);
	// 项目记录删除
	public Integer deleteProject(Integer id);
	//////////////////////////////////////////
	//查询此ID的未删除的简历数量
	public Integer getMaxResumeById(Integer userId);

	 // 查询此ID的删除的简历数量
	public Integer getMaxEducationDeleteById(Integer userId);
	 // 查询此ID的删除的简历数量
	public Integer getMaxWorkDeleteById(Integer userId);
	 // 查询此ID的删除的简历数量
	public Integer getMaxProjectDeleteById(Integer userId);
	 // 查看教育记录已删除记录
	public List<Education> findEducationByDelete(Integer page,Integer userId);
	 // 查看工作记录已删除记录
	public List<Work> findWorkByDelete(Integer page,Integer userId);
	 // 查看项目记录已删除记录
	public List<Project> findProjectByDelete(Integer page,Integer userId);
	 // 恢复教育被删记录
	public Integer renewEducationByDelete(Integer id);
	 // 恢复工作被删记录
	public Integer renewWorkByDelete(Integer id);
	 // 恢复项目被删记录
	public Integer renewProjectByDelete(Integer id);
}
