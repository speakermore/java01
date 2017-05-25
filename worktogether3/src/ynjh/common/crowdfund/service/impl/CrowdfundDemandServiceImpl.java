package ynjh.common.crowdfund.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.common.crowdfund.dao.crowdfunddemand.CrowdfundDemandMapper;
import ynjh.common.crowdfund.entity.Crowdfund;
import ynjh.common.crowdfund.entity.CrowdfundDemand;
import ynjh.common.crowdfund.service.CrowdfundDemandService;
@Service
public class CrowdfundDemandServiceImpl implements CrowdfundDemandService {
	@Resource
	CrowdfundDemandMapper crowdfundDemandMapper;
	/**
	 * 众筹--添加需求岗位
	 */
	@Override
	public int addCrowdfundDemand(CrowdfundDemand cfd) {
		
		return crowdfundDemandMapper.addCrowdfundDemand(cfd);
	}

	/**
	 * 众筹--更改需求岗位
	 */
	@Override
	public int updateCrowdfundDemand(CrowdfundDemand cfd) {
		
		return crowdfundDemandMapper.updateCrowdfundDemand(cfd);
	}
	
	
	/**
	 * 众筹--删除需求岗位
	 */
	@Override
	public int deleteCrowdfundDemand(CrowdfundDemand cfd) {
		
		return crowdfundDemandMapper.deleteCrowdfundDemand(cfd);
	}
	
	
	/**
	 * 众筹--根据项目查询需求岗位
	 */
	@Override
	public List<CrowdfundDemand> listCrowdfundDemand(int crowdfundId) {
		
		return crowdfundDemandMapper.listCrowdfundDemand(crowdfundId);
	}

	/**
	 * 众筹--查看单个需求岗位
	 */
	@Override
	public Crowdfund getCrowdfundDemand(int id) {
		
		return crowdfundDemandMapper.getCrowdfundDemand(id);
	}

}
