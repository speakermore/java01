package ynjh.company.dao.offer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Offer;

public interface CompanyOfferMapper {
	public Integer addOffer(Offer offer);
	public Integer updateOfferAction(@Param("id")Integer id,@Param("offerAction")Integer offerAction);
	public List<Offer> findCompanyOffers(Integer id);
	public List<Offer> findUserOffers(Integer id);
	public Offer findCompanyOffer(Integer id);
	public Offer findUserOffer(Integer id);
	public List<Offer> findAll(@Param("page")Integer page);
	public int getMaxRecord();
}
