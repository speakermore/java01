package ynjh.personal.dao.commentarticle;

import java.util.List;

import ynjh.personal.entity.CommentArticle;


public interface CommentArticleMapper {
	/**
	 * 写文章评论
	 */
	public Integer addUserCommentArticle(CommentArticle commentArticle);
	/**
	 * 删除评价
	 */
	public Integer deleteUserCommentArticle(Integer id);
	/**
	 * 查看指定文章的评论，按时间降序排序
	 * @param articleId 文章主键id
	 * @return 符合条件的评论CommentArticle实体类集合
	 */
	public List<CommentArticle> findCommentByArticleId(Integer articleId);
	
}
