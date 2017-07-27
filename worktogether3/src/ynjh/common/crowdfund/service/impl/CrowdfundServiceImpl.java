package ynjh.common.crowdfund.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import ynjh.common.crowdfund.dao.crowdfund.CrowdfundMapper;
import ynjh.common.crowdfund.entity.Crowdfund;
import ynjh.common.crowdfund.entity.CrowdfundDemand;
import ynjh.common.crowdfund.service.CrowdfundService;
@Service
public class CrowdfundServiceImpl implements CrowdfundService {
	@Resource
	CrowdfundMapper crowdfundMapper;
	/**
	 * 技术众筹--添加众筹项目
	 */
	@Override
	public int addCrowdfund(Crowdfund cf) {
		
		return crowdfundMapper.addCrowdfund(cf);
	}
	/**
	 * 技术众筹--删除众筹项目
	 */
	@Override
	public int deleteCrowdfund(int id) {
		
		return crowdfundMapper.deleteCrowdfund(id);
	}
	/**
	 * 技术众筹--更改众筹项目
	 */
	@Override
	public int updateCrowdfund(Crowdfund cf) {
		
		return crowdfundMapper.updateCrowdfund(cf);
	}
	/**
	 * 技术众筹--获取全部众筹信息
	 */
	@Override
	public List<Crowdfund> findCrowdfundAll(int page) {
		
		return crowdfundMapper.findCrowdfundAll(page);
	}
	/**
	 * 技术众筹--模糊查询用户想找的众筹信息
	 */
	@Override
	public List<Crowdfund> wantFindCrowdfundAll(@Param("crowdfundWantFind") String crowdfundWantFind) {
		
		return crowdfundMapper.wantFindCrowdfundAll(crowdfundWantFind);
	}
	/**
	 * 技术众筹--众筹信息推送
	 */
	@Override
	public List<Crowdfund> getCrowdfundJob(String interesting) {
		
		return crowdfundMapper.getCrowdfundJob(interesting);
	}
	/**
	 * 技术众筹--获取单个众筹项目信息
	 */
	@Override
	public Crowdfund findCrowdfundOnly(int id) {
		
		return crowdfundMapper.findCrowdfundOnly(id);
	}
	/**
	 * 技术众筹--获取所有众筹信息数量(分页)
	 */
	@Override
	public int crowdfundCount() {
		
		return crowdfundMapper.crowdfundCount();
	}
	/**
	 * 技术众筹获取按条件获取众筹信息数量(分页)
	 */
	@Override
	public int crowdfundCountJob( String crowdfundWantFind) {
		
		return crowdfundMapper.crowdfundCountJob(crowdfundWantFind);
	}
	/**
	 * 技术众筹--获取众筹ID
	 */
	@Override
	public int findPublisherId(Crowdfund cf){
		return crowdfundMapper.findPublisherId(cf);
	}
	/**
	 * 技术众筹--获取我发布的众筹信息
	 */
	@Override
	public List<Crowdfund> findMyCrowdfundOnly(Integer publisherId){
		return crowdfundMapper.findMyCrowdfundOnly(publisherId);
	}
	/**
	 * 技术众筹--众筹审核
	 */
	@Override
	public List<Crowdfund> checkCrowdfund(){
		return crowdfundMapper.checkCrowdfund();
	}

}
