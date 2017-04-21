package ynjh.company.service.impl.offer;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ynjh.company.dao.offer.CompanyOfferMapper;
import ynjh.company.entity.Offer;
import ynjh.company.service.CompanyOfferService;

@Service
public class CompanyOfferServiceImpl implements CompanyOfferService {
	private Logger logger=Logger.getLogger(this.getClass());
	
	@Resource
	private CompanyOfferMapper companyOfferMapper;
	
	@Override
	public int addOffer(Offer offer) {
		int result=-1;
		try {
			return companyOfferMapper.addOffer(offer);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("发送面试邀请失败");
		}
		return result;
	}
	
	@Override
	public int updateOfferAction(Integer id,Integer offerAction) {
		return companyOfferMapper.updateOfferAction(id, offerAction);
	}

	@Override
	public List<Offer> findCompanyOffers(Integer id) {
		return companyOfferMapper.findCompanyOffers(id);
	}
	
	@Override
	public List<Offer> findUserOffers(Integer id) {
		return companyOfferMapper.findUserOffers(id);
	}
	
	@Override
	public Offer findCompanyOffer(Integer id) {
		return companyOfferMapper.findCompanyOffer(id);
	}
	
	@Override
	public Offer findUserOffer(Integer id) {
		return companyOfferMapper.findUserOffer(id);
	}

	@Override
	public List<Offer> findAll(Integer page) {
		return companyOfferMapper.findAll((page-1)*5);
	}
	
	@Override
	public int findMaxPage() {		
		return (companyOfferMapper.getMaxRecord()+5-1)/5;
	}
}
