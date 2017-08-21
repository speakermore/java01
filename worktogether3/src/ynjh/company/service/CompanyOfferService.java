package ynjh.company.service;

import java.util.List;
import java.util.Map;

import ynjh.company.entity.Offer;

public interface CompanyOfferService {
	// 发送offer
	public int addOffer(Offer offer);
	// 修改offer的状态
	public int updateOfferAction(Integer id,Integer offerAction);

	// 计算当前公司发出的所有offer所占页数
	public int findCompanyOffersPage(Integer companyId);
	// 查找当前公司发出的所有offer
	public List<Offer> findCompanyOffers(Integer companyId,Integer page);
	// 查找当前公司发出的某条offer（根据id查询）
	public Offer findCompanyOffer(Integer id);

	// 计算当前用户收到的所有offer所占页数
	public int findUserOffersPage(Integer userId);
	/**
	 * 牟勇：查找当前用户收到的所有offer
	 * 取消原来的分页，现在不分页了
	 * 现在改为Map集合
	 * c.companySimpleName,o.offerInvitationTime,o.offerContent,crc.cmpRecTitle
	 * @param userId 用户的id
	 * @return 符合条件的Map集合
	 */
	public List<Map<String, Object>> findUserOffers(Integer userId);
	// 查找当前用户收到的某条offer（根据id查询）
	public Offer findUserOffer(Integer id);
}
