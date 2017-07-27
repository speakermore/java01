package ynjh.common.crowdfund.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.common.crowdfund.entity.Crowdfund;

public interface CrowdfundService {
	//添加众筹项目
	int addCrowdfund(Crowdfund cf);
	//删除众筹项目
	int deleteCrowdfund(int id);
	//更改众筹项目
	int updateCrowdfund(Crowdfund cf);
	//获取全部众筹信息
	List<Crowdfund> findCrowdfundAll(int page);
	//模糊查询用户想找的众筹信息
	List<Crowdfund> wantFindCrowdfundAll(@Param("crowdfundWantFind") String crowdfundWantFind);
	//众筹信息推送
	List<Crowdfund> getCrowdfundJob(String interesting);
	//获取单个众筹项目信息
	Crowdfund findCrowdfundOnly(int id);
	//获取所有众筹信息数量(后台分页)
	int crowdfundCount();
	//获取按条件获取众筹信息数量(用户端分页)
	int crowdfundCountJob(String crowdfundWantFind);
	//获取众筹ID
	int findPublisherId(Crowdfund cf);
	//我参与的众筹
	List<Crowdfund> findMyCrowdfundOnly(Integer publisherId);
	//待审核信息
	List<Crowdfund> checkCrowdfund();
}
