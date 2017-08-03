package ynjh.company.service;

/**
 * 
 * @author 黄冰雁
 *
 */
import ynjh.company.entity.LikeNum;

public interface LikeNumService {
	public int addLike(LikeNum likeNum);
	/**
	 * 牟勇：查询指定文章是否被指定用户点赞过
	 * @param articleId 文章主键id
	 * @param usersId 用户主键id
	 * @return 如果是0，则表示没有点赞过，如果是1则表示点过了
	 */
	public Integer islikeNum(Integer articleId,Integer usersId);
	public LikeNum findByCommentArt(Integer commentArticleId,Integer usersId);
}
