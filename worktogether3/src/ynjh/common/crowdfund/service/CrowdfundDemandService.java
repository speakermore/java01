package ynjh.common.crowdfund.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.common.crowdfund.entity.Crowdfund;
import ynjh.common.crowdfund.entity.CrowdfundDemand;

public interface CrowdfundDemandService {
	//添加需求岗位信息
	int addCrowdfundDemand(CrowdfundDemand cfd);
	//修改需求岗位信息
	int updateCrowdfundDemand(CrowdfundDemand cfd);
	//删除需求岗位信息(动态SQL根据)
	int deleteCrowdfundDemand(CrowdfundDemand cfd);
	//查看需求岗位信息
	List<CrowdfundDemand> listCrowdfundDemand(@Param("crowdfundId") int crowdfundId);
	//查看单个需求岗位信息
	Crowdfund getCrowdfundDemand(@Param("id") int id);
}
