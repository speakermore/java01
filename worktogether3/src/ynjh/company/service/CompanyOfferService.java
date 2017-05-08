package ynjh.company.service;

import java.util.List;

import ynjh.company.entity.Offer;

public interface CompanyOfferService {
	public int addOffer(Offer offer);
	public int updateOfferAction(Integer id,Integer offerAction);
	
	public List<Offer> findCompanyOffers(Integer companyId,Integer page);
	public int findCompanyOffersPage(Integer companyId);
	public Offer findCompanyOffer(Integer id);
	
	public List<Offer> findUserOffers(Integer userId,Integer page);
	public int findUserOffersPage(Integer userId);
	public Offer findUserOffer(Integer id);
}
