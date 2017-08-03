package ynjh.personal.service.impl.newly;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import ynjh.company.entity.Offer;
import ynjh.personal.dao.newly.NewlyMapper;
import ynjh.personal.entity.ArticleByFollow;
import ynjh.personal.service.NewlyService;

/**
 * 最新消息Impl
 * 
 * @author 刘志浩
 *
 */
@Service
public class NewlyServiceImpl implements NewlyService {
	@Resource
	private NewlyMapper newlyMapper;

	/**
	 * 查看最新发布面试消息
	 * 
	 * @author 刘志浩
	 */
	@Override
	public List<Offer> findNewlyFaceByUserId(Integer userId) {
		return newlyMapper.findNewlyFaceByUserId(userId);
	}

	
	@Override
	public List<ArticleByFollow> findNewlyArticleByFollow(Integer userId) {
		return newlyMapper.findNewlyArticleByFollow(userId);
	}

	/**
	 * 查看被关注者发布文章消息的数量
	 * 
	 * @author 刘志浩
	 */
	@Override
	public Integer getByFollowIdCount(Integer userId) {
		return newlyMapper.getByFollowIdCount(userId);
	}
	/**
	 * 查看最新评论
	 */
	@Override
	public List<Map<String, Object>> findNewlyCommentArticleByUserId(Integer userId) {
		return newlyMapper.findNewlyCommentArticleByUserId(userId);
	}
	
}
