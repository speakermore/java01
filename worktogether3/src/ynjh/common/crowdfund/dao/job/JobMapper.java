package ynjh.common.crowdfund.dao.job;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.common.crowdfund.entity.Job;

/***
 * @author 何爽
 *岗位接口两级内连接
 */
public interface JobMapper {
	//添加岗位信息
	public int addJob(Job job);
	//修改岗位信息
	public int updateJob(Job job);
	//删除岗位信息
	public int deleteJob(@Param("id") Integer id);
	/**
	 * 牟勇：查询一级岗位信息，所有的一级岗位信息，parentId的值均为null
	 * @return 一级岗位信息集合
	 */
	public List<Job> findJob1();
	
	/**
	 * 牟勇：根据一级岗位名称查询二级岗位
	 * @param jobType 一级岗位的名称
	 * @return 符合条件的所有二级岗位信息
	 */
	public List<Job> findJob2(@Param("jobType") String jobType);
	/**
	 * 牟勇：根据一级岗位id查询二级岗位
	 * @param parentId 一级岗位的id
	 * @return 符合条件的所有二级岗位信息
	 */
	public List<Job> findByParentId(@Param("parentId")Integer parentId);
}
