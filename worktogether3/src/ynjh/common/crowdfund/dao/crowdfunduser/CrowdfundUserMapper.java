package ynjh.common.crowdfund.dao.crowdfunduser;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.common.crowdfund.entity.CrowdfundUser;

/**
 * @author 何爽
 *众筹项目参与人信息对照接口
 */
public interface CrowdfundUserMapper {
	//用户参与众筹
	int addCrowdfundUser(CrowdfundUser cfUser);
	//众筹发布者审核
	int updateCrowdfundUser(CrowdfundUser crowdfundUser);
	//根据众筹项目ID或用户ID查看参与用户表
	List<CrowdfundUser> listcfUser(@Param("id") Integer id);
	
}
