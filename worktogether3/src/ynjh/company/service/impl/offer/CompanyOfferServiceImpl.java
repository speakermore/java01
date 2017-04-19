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
			logger.warn("新增面试邀请失败");
		}
		return result;
	}

	@Override
	public List<Offer> findAll(Integer page) {
		return companyOfferMapper.findAll(page);
	}

	@Override
	public Offer findById(Integer id) {
		return companyOfferMapper.findById(id);
	}

	@Override
	public int updateOfferJob(Integer id,String offerJob) {
		return companyOfferMapper.updateOfferJob(id, offerJob);
	}

	@Override
	public int updateOfferContent(Integer id,String offerContent) {
		return companyOfferMapper.updateOfferContent(id, offerContent);
	}

	@Override
	public int updateOfferStatus(Integer id,Integer offerStatus) {
		return companyOfferMapper.updateOfferStatus(id, offerStatus);
	}

}
