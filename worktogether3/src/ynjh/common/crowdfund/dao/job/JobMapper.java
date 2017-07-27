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
	int addJob(Job job);
	//修改岗位信息
	int updateJob(Job job);
	//删除岗位信息
	int deleteJob(@Param("id") Integer id);
	//查询一级岗位信息
	List<Job> findJob1();
	//根据一级岗位信息查询二级岗位
	List<Job> findJob2(@Param("jobParentId") Integer jobParentId);
}
