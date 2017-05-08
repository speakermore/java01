package ynjh.personal.dao.newly;
import ynjh.company.entity.Offer;

public interface NewlyMapper {

	//查看最新发布面试消息 
	public Offer findNewsFaceByUserId(Integer userId);
	
	//根据被关注用户ID查询XX用户发表的最新文章
	//根据用户ID查询最新
	//根据用户ID查询文章的评论
	//根据用户ID查询文章ID
}
