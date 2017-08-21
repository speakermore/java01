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
	//查询一级岗位信息
	public List<Job> findJob1();
	//根据一级岗位信息查询二级岗位
	public List<Job> findJob2(@Param("jobParentId") Integer jobParentId);
	/**
	 * 牟勇：查询所有的岗位类型，每个一级岗位均包含一个二级岗位的集合
	 * @return 符合要求的Job实体类集合
	 */
	public List<Job> findAllJobIncludeJob2();
}
