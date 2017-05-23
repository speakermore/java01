package ynjh.company.dao.company;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.LikeNum;

public interface LikeNumMapper {
	public Integer addLikeNum(LikeNum likeNum);
	public LikeNum findByArticle(@Param("articleId") Integer articleId,@Param("usersId")Integer usersId);
	public LikeNum findByCommentArticle(@Param("commentArticleId") Integer commentArticleId,@Param("usersId")Integer usersId);
}
