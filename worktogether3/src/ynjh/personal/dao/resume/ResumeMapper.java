package ynjh.personal.dao.resume;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.CompanyResume;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.ForeignKeyEducation;
import ynjh.personal.entity.ForeignKeyProject;
import ynjh.personal.entity.ForeignKeyWork;
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
	public List<Resume> findResumeByUserId(@Param("page")Integer page,@Param("userId")Integer userId);
	/**
	 * 根据id查询简历（单个）
	 */
	public Resume findResumeById(Integer id);
	/**
	 * 查询简历(一人只有一份简历时使用)
	 */
	public Resume findResumeByOneUserId(Integer userId);
	/**
	 * 根据userId查询最新简历（单个）
	 */
	public Resume findNewlyResumeByUserId(Integer userId);
	
	/***
	 * 删除简历
	 */
	public Integer deleteResumeById(Integer id);
	
	
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
	 * 查看教育记录已删除记录
	 */
	public List<ForeignKeyEducation> findEducationByDelete(@Param("page")Integer page,@Param("userId")Integer userId);
	/**
	 * 查看工作记录已删除记录
	 */
	public List<ForeignKeyWork> findWorkByDelete(@Param("page")Integer page,@Param("userId")Integer userId);
	/**
	 * 查看项目记录已删除记录
	 */
	public List<ForeignKeyProject> findProjectByDelete(@Param("page")Integer page,@Param("userId")Integer userId);
	/**
	 * 恢复教育被删记录
	 */
	public Integer renewEducationByDelete(Integer id);
	/**
	 * 恢复工作被删记录
	 */
	public Integer renewWorkByDelete(Integer id);
	/**
	 * 恢复项目被删记录
	 */
	public Integer renewProjectByDelete(Integer id);
	
	/**
	 * 分页
	 * @param userId
	 * @return
	 */
	/**
	 * 查询此ID的简历数量
	 */
	public Integer getMaxResumeById(Integer userId);
	
	
	/**
	 * 查询此ID的删除的简历数量
	 */
	public Integer getMaxEducationDeleteById(Integer userId);
	/**
	 * 查询此ID的删除的简历数量
	 */
	public Integer getMaxWorkDeleteById(Integer userId);
	/**
	 * 查询此ID的删除的简历数量
	 */
	public Integer getMaxProjectDeleteById(Integer userId);
	
	/**
	 * 结束
	 */
	
	/**
	 * 更换头像
	 */
	public Integer changeResumeHeadImg(@Param("resumeId")Integer resumeId,@Param("resumeHeadImg")String resumeHeadImg);
	
	/**
	 * 投递简历
	 */
	public Integer sendResumeToCompany(CompanyResume companyresume);
}
