package ynjh.company.dao.discuss;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Discuss;

public interface CompanyDiscussMapper {
	//增加评论
	public Integer addDiscuss(Discuss discuss);
	//修改评论状态״̬
	public Integer updateDiscussStatus(@Param("id")Integer id,@Param("discussStatus")Integer discussStatus);
	//根据id查询评论
	public Discuss findById(Integer id);
	//查询所有评论
	public List<Discuss> findAll(Integer discussBySendId);
}
