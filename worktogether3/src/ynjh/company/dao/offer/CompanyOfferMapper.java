package ynjh.company.dao.offer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Offer;

public interface CompanyOfferMapper {
	//添加新的面试邀请
	public Integer addOffer(Offer offer);
	//查询所有
	public List<Offer> findAll(@Param("page")Integer page);
	//根据id查询
	public Offer findById(Integer id);
	//修改岗位
	public Integer updateOfferJob(@Param("id")Integer id,@Param("offerJob")String offerJob);
	//修改详细信息
	public Integer updateOfferContent(@Param("id")Integer id,@Param("offerContent")String offerContent);
	//修改状态
	public Integer updateOfferStatus(@Param("id")Integer id,@Param("offerStatus")Integer offerStatus);
}
