package ynjh.personal.dao.commentarticle;

import java.util.List;

public interface CommentArticleMapper {
	/**
	 * 写文章评论
	 */
	public Integer addUserCommentArticle(CommentArticleMapper commentArticle); 
	/**
	 * 删除评价
	 */
	public Integer deleteUserCommentArticle(Integer id);	
	/**
	 * 查看评价
	 */
	public List<CommentArticleMapper>	selectUserCommentArticle(Integer id);		
}
