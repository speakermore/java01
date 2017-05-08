package ynjh.company.dao.offer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Offer;

public interface CompanyOfferMapper {
	public Integer addOffer(Offer offer);
	public Integer updateOfferAction(@Param("id")Integer id,@Param("offerAction")Integer offerAction);
	
	public List<Offer> findCompanyOffers(@Param("companyId")Integer companyId,@Param("page")Integer page);
	public Integer getCompanyOffersRecord(Integer companyId);
	public Offer findCompanyOffer(Integer id);
	
	public List<Offer> findUserOffers(@Param("userId")Integer userId,@Param("page")Integer page);
	public Integer getUserOffersRecord(Integer userId);
	public Offer findUserOffer(Integer id);	
}
