package ynjh.company.service.impl.offer;

import java.util.List;
import java.util.Map;

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

	// 发送offer
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
	// 修改offer的状态
	@Override
	public int updateOfferAction(Integer id,Integer offerAction) {
		return companyOfferMapper.updateOfferAction(id, offerAction);
	}

	// 计算当前公司发出的所有offer所占页数（10条记录占一页）
	@Override
	public int findCompanyOffersPage(Integer companyId) {
		return (companyOfferMapper.getCompanyOffersRecord(companyId)+4)/5;
	}
	// 查找当前公司发出的所有offer
	@Override
	public List<Offer> findCompanyOffers(Integer companyId,Integer page) {
		return companyOfferMapper.findCompanyOffers(companyId,(page-1)*5);
	}
	// 查找当前公司发出的某条offer（根据id查询）
	@Override
	public Offer findCompanyOffer(Integer id) {
		return companyOfferMapper.findCompanyOffer(id);
	}

	// 计算当前用户收到的所有offer所占页数（10条记录占一页）
	@Override
	public int findUserOffersPage(Integer userId) {
		return (companyOfferMapper.getUserOffersRecord(userId)+9)/10;
	}
	// 查找当前用户收到的所有offer
	@Override
	public List<Map<String, Object>> findUserOffers(Integer userId) {
		return companyOfferMapper.findUserOffers(userId);
	}
	// 查找当前用户收到的某条offer（根据id查询）
	@Override
	public Offer findUserOffer(Integer id) {
		return companyOfferMapper.findUserOffer(id);
	}
}
