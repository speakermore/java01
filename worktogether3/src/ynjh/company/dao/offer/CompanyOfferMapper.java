package ynjh.company.dao.offer;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Offer;

public interface CompanyOfferMapper {
	// 发送offer
	public Integer addOffer(Offer offer);
	// 修改offer的状态
	public Integer updateOfferAction(@Param("id")Integer id,@Param("offerAction")Integer offerAction);

	// 计算当前公司发出的所有offer共有几条
	public Integer getCompanyOffersRecord(Integer companyId);
	// 查找当前公司发出的所有offer
	public List<Offer> findCompanyOffers(@Param("companyId")Integer companyId,@Param("start")Integer start);
	// 查找当前公司发出的某条offer（根据id查询）
	public Offer findCompanyOffer(Integer id);

	// 计算当前用户收到的所有offer共有几条
	public Integer getUserOffersRecord(Integer userId);
	/**
	 * 牟勇：查找当前用户收到的所有offer
	 * 收到的offer必须是已经通过审核的
	 * 查询的结果包括公司简称，面试时间，Offer内容，岗位
	 * 对应的字段名：c.companySimpleName,o.offerInvitationTime,o.offerContent,crc.cmpRecTitle
	 * offer必须是6个月内发出的
	 * @param userId 用户的id
	 * @return 所有收到的offer
	 */
	public List<Map<String, Object>> findUserOffers(@Param("userId")Integer userId);
	// 查找当前用户收到的某条offer（根据id查询）
	public Offer findUserOffer(Integer id);
}