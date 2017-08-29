package ynjh.company.dao.discuss;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Discuss;

public interface CompanyDiscussMapper {
	//增加评论
	public Integer addDiscuss(Discuss discuss);
	//修改评论状态
	public Integer updateDiscussStatus(@Param("id")Integer id,@Param("discussStatus")Integer discussStatus);
	//根据id查询评论
	public Discuss findById(Integer id);
	//查询所有评论
	public List<Discuss> findAll(Integer discussBySendId);
	/**
	 * 牟勇：根据企业主键查找对企业的评价
	 * 评价必须是通过审核的
	 * @param companyId 企业主键
	 * @return 符合条件的Discuss集合
	 */
	public List<Discuss> findDiscussByCompanyId(@Param("companyId")Integer companyId);
}
