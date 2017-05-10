package ynjh.personal.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Offer;
import ynjh.personal.entity.ArticleByFollow;

/**
 * 最新消息service
 * @author 刘志浩
 *
 */
public interface NewlyService {

	// 查看最新发布面试消息
	public Offer findNewlyFaceByUserId(Integer userId);
	//查看关注者最新发布文章消息
	public List<ArticleByFollow> findNewlyArticleByFollow(Integer userId);
	// 查看被关注者发布文章消息的数量
	public Integer getByFollowIdCount(Integer userId);
}
