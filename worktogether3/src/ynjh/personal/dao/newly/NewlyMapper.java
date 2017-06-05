package ynjh.personal.dao.newly;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.Offer;
import ynjh.personal.entity.ArticleByFollow;
import ynjh.personal.entity.CommentArticle;
/**
 * 最新消息mapper
 * @author 刘志浩
 *
 */
public interface NewlyMapper {

	//查看最新发布面试消息 
	public Offer findNewlyFaceByUserId(Integer userId);
	//查看关注者最新发布文章消息
	public List<ArticleByFollow> findNewlyArticleByFollow(@Param("maxNum")Integer maxNum,@Param("userId")Integer userId);
	//查看被关注者发布文章消息的数量
	public Integer getByFollowIdCount(Integer userId);
	//查看最新评论
	public List<CommentArticle>  findNewlyCommentArticleByUserId(Integer userId);
}
