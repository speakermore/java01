package ynjh.common.crowdfund.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.common.crowdfund.dao.crowdfunduser.CrowdfundUserMapper;
import ynjh.common.crowdfund.entity.CrowdfundUser;
import ynjh.common.crowdfund.service.CrowdfundUserService;
@Service
public class CrowdfundUserServiceImpl implements CrowdfundUserService {
	@Resource
	CrowdfundUserMapper crowdfundUserMapper;
	/**
	 * 技术众筹--添加岗位
	 */
	@Override
	public int addCrowdfundUser(CrowdfundUser cfUser) {
		
		return crowdfundUserMapper.addCrowdfundUser(cfUser);
	}
	/**
	 * 技术众筹--修改岗位信息
	 */
	@Override
	public int updateCrowdfundUser(CrowdfundUser crowdfundUser) {
		
		return crowdfundUserMapper.updateCrowdfundUser(crowdfundUser);
	}
	/**
	 * 技术众筹--查询岗位
	 */
	@Override
	public List<CrowdfundUser> listcfUser(Integer id) {
		
		return crowdfundUserMapper.listcfUser(id);
	}

}
