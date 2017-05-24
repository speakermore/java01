package ynjh.company.dao.offer;

import java.util.List;

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
	// 查找当前用户收到的所有offer
	public List<Offer> findUserOffers(@Param("userId")Integer userId,@Param("start")Integer start);
	// 查找当前用户收到的某条offer（根据id查询）
	public Offer findUserOffer(Integer id);
}
