package ynjh.personal.dao.resume;

import java.util.List;

import ynjh.personal.entity.Resume;

public interface RresumeMapper {

	/**
	 * 添加简历
	 */
	public Integer addResume(Resume resume);	
	/**
	 * 修改简历
	 */
	public Integer updateResume(Resume resume);	
	/**
	 * 根据id查询简历（审查接口）
	 */
	public List<Resume>		selectResumeById(Integer id);	
}
