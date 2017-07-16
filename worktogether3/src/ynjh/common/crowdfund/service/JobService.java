package ynjh.common.crowdfund.service;

import java.util.List;

import ynjh.common.crowdfund.entity.Job;
/**
 * @author 何爽
 *岗位接口
 */
public interface JobService {
	//添加岗位信息
	int addJob(Job job);
	//修改岗位信息
	int updateJob(Job job);
	//删除岗位信息
	int deleteJob(Integer id);
	//查询一级岗位信息
	List<Job> findJob1();
	//根据一级岗位信息查询二级岗位
	List<Job> findJob2(String jobType);
	/**
	 * 牟勇：根据一级岗位id查询二级岗位
	 * @param parentId 一级岗位的id
	 * @return 符合条件的所有二级岗位信息
	 */
	public List<Job> findByParentId(Integer parentId);
	
}
