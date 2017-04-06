package ynjh.company.dao.discuss;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.enity.Discuss;

public interface DiscussMapper {
	//添加评论
	public Integer addDiscuss(Discuss discuss);
	//修改状态
	public Integer updateDiscussStatus(@Param("id")Integer id,@Param("discussStatus")Integer discussStatus);
	//根据id找到评论
	public Discuss findById(Integer id);
	//查询所有评论
	public List<Discuss> findAll(@Param("page")Integer page);
}
