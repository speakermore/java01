package ynjh.company.service;

/**
 * 
 * @author 黄冰雁
 *
 */
import ynjh.company.entity.LikeNum;

public interface LikeNumService {
	public int addLike(LikeNum likeNum);
	public LikeNum findByArt(Integer articleId,Integer usersId);
	public LikeNum findByCommentArt(Integer commentArticleId,Integer usersId);
}
