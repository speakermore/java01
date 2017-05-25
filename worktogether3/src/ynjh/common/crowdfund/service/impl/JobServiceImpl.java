package ynjh.common.crowdfund.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.common.crowdfund.dao.job.JobMapper;
import ynjh.common.crowdfund.entity.Job;
import ynjh.common.crowdfund.service.JobService;
@Service
public class JobServiceImpl implements JobService {
	@Resource
	JobMapper jobMapper;
	/**
	 * 添加岗位
	 */
	@Override
	public int addJob(Job job) {
		
		return jobMapper.addJob(job);
	}
	/**
	 * 修改岗位
	 */
	@Override
	public int updateJob(Job job) {
		
		return jobMapper.updateJob(job);
	}
	/**
	 * 删除岗位
	 */
	@Override
	public int deleteJob(Integer id) {
		
		return jobMapper.deleteJob(id);
	}
	/**
	 * 查询一级岗位
	 */
	@Override
	public List<Job> findJob1() {
		
		return jobMapper.findJob1();
	}
	/**
	 * 根据一级岗位名称查询二级岗位
	 */
	@Override
	public List<Job> findJob2(String jobType) {
		
		return jobMapper.findJob2(jobType);
	}

}
