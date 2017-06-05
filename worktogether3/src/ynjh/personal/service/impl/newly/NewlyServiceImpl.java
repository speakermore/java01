package ynjh.personal.service.impl.newly;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.company.entity.Offer;
import ynjh.personal.dao.newly.NewlyMapper;
import ynjh.personal.entity.ArticleByFollow;
import ynjh.personal.entity.CommentArticle;
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
	public Offer findNewlyFaceByUserId(Integer userId) {
		return newlyMapper.findNewlyFaceByUserId(userId);
	}

	/**
	 * 查看关注者最新发布文章消息
	 * 
	 * @author 刘志浩
	 */
	@Override
	public List<ArticleByFollow> findNewlyArticleByFollow(Integer userId) {
		int maxNum = getByFollowIdCount(userId);
		if (maxNum > 0) {
			return newlyMapper.findNewlyArticleByFollow(maxNum, userId);
		} else {
			return null;
		}

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
	public List<CommentArticle> findNewlyCommentArticleByUserId(Integer userId) {
		return newlyMapper.findNewlyCommentArticleByUserId(userId);
	}
	
}
