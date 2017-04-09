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
	 * 查看评价
	 */
	public List<CommentArticle>	selectUserCommentArticle(Integer id);		
}
