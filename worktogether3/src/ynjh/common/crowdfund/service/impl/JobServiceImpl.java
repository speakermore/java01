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
	@Override
	public int addJob(Job job) {
		
		return jobMapper.addJob(job);
	}

	@Override
	public int updateJob(Job job) {
		
		return jobMapper.updateJob(job);
	}

	@Override
	public int deleteJob(Integer id) {
		
		return jobMapper.deleteJob(id);
	}

	@Override
	public List<Job> findJob1() {
		
		return jobMapper.findJob1();
	}

	@Override
	public List<Job> findJob2(String jobType) {
		
		return jobMapper.findJob2(jobType);
	}

}
