package ynjh.company.service;

import java.util.List;

import ynjh.company.entity.Offer;

public interface CompanyOfferService {
	public int addOffer(Offer offer);
	public int updateOfferAction(Integer id,Integer offerAction);
	public List<Offer> findCompanyOffers(Integer id);
	public List<Offer> findUserOffers(Integer id);
	public Offer findCompanyOffer(Integer id);
	public Offer findUserOffer(Integer id);
	public List<Offer> findAll(Integer page);
	public int findMaxPage();
}
