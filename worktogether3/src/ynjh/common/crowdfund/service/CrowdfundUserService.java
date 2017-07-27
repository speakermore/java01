package ynjh.common.crowdfund.service;

import java.util.List;

import ynjh.common.crowdfund.entity.CrowdfundUser;

public interface CrowdfundUserService {
	//用户参与众筹
	int addCrowdfundUser(CrowdfundUser cfUser);
	//众筹发布者审核
	int updateCrowdfundUser(CrowdfundUser crowdfundUser);
	//根据众筹项目ID或用户ID查看参与用户表
	List<CrowdfundUser> listcfUser(Integer id);
}
