package ynjh.company.service;

import java.util.List;

import ynjh.personal.entity.Discuss;
/**
 * 
 * @author 黄冰雁
 *
 */
public interface CompanyDiscussService {
	//添加评论
	public int addDiscuss(Discuss discuss);
	//查询所有评论
	public List<Discuss> findAll(Integer discussBySendId);
	//根据id查询所有评论
	public Discuss findById(Integer id);
	//根据id查询更改评论状态
	public int updateStatus(Integer id,Integer discussStatus);
}
