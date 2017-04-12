package ynjh.personal.service;

import java.util.List;

import ynjh.personal.entity.Resume;

public interface ResumeService {
	/**
	 * 添加简历
	 */
	public Integer addResume(Resume resume);	
	/**
	 * 修改简历
	 */
	public Integer updateResume(Resume resume);	
	/**
	 * 根据id查询简历（审查接口）(所有)
	 */
	public List<Resume> selectResumeUserId(Integer userId);	
	/**
	 * 根据id查询简历（审查接口）详细
	 */
	public Resume selectResumeById(Integer id);
	
	/***
	 * 删除简历
	 */
	public Integer deleteResumeById(Integer id);
}
