package ynjh.personal.dao.resume;

import java.util.List;

import ynjh.personal.entity.Resume;

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
	
}
