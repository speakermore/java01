package ynjh.company.dao.company;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.LikeNum;

public interface LikeNumMapper {
	public Integer addLikeNum(LikeNum likeNum);
	/**
	 * 牟勇：查询指定文章是否被指定用户点赞过
	 * @param articleId 文章主键id
	 * @param usersId 用户主键id
	 * @return 如果是0，则没有点赞，如果是1，则点赞过
	 */
	public Integer countLikeNumByUserIdAndArticleId(@Param("articleId") Integer articleId,@Param("usersId")Integer usersId);
	public LikeNum findByCommentArticle(@Param("commentArticleId") Integer commentArticleId,@Param("usersId")Integer usersId);
	/**
	 * 牟勇：根据用户主键和文章主键删除点赞记录
	 * @param articleId  文章主键
	 * @param userId 用户主键
	 * @return 大于0表示成功，否则失败
	 */
	public Integer deleteLikeNum(@Param("articleId")Integer articleId,@Param("userId")Integer userId);
}
