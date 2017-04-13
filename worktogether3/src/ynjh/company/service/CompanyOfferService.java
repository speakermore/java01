package ynjh.company.service;

import java.util.List;

import ynjh.company.entity.Offer;

public interface CompanyOfferService {
	//添加新的面试邀请
	public int addOffer(Offer offer);
	//查询所有
	public List<Offer> findAll(Integer page);
	//根据id查询
	public Offer findById(Integer id);	
	//修改岗位
	public int updateOfferJob(Integer id,String offerJob);
	//修改详细信息
	public int updateOfferContent(Integer id,String offerContent);
	//修改状态
	public int updateOfferStatus(Integer id,Integer offerStatus);
}
