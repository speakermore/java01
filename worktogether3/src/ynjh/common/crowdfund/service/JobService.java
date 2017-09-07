package ynjh.common.crowdfund.service;

import java.util.List;

import ynjh.common.crowdfund.entity.Job;
/**
 * @author 何爽
 *岗位接口
 */
public interface JobService {
	//添加岗位信息
	public int addJob(Job job);
	//修改岗位信息
	public int updateJob(Job job);
	//删除岗位信息
	public int deleteJob(Integer id);
	//查询一级岗位信息
	public List<Job> findJob1();
	/**
	 * 根据一级岗位信息查询二级岗位
	 * @param jobParentId  一级岗位主键
	 * @return 属于该一级岗位的二级岗位
	 */
	public List<Job> findJob2(Integer jobParentId);
	/**
	 * 牟勇：用于首页左侧的“职位分类”查询<br />
	 * 每一个一级职位均包含所有的二级职位集合
	 * @return 符合要求的Job实体集合
	 */
	public List<Job> findJob1IncludeJob2();
	
	/**
	 * 牟勇：查询不包含该一级岗位的二级岗位
	 * @param jobParentId 一级岗位主键
	 * @return 不属于该一级岗位的所有二级岗位Job对象集合
	 */
	public List<Job> findJob2NotIncludeParentId(Integer parentId);
}
