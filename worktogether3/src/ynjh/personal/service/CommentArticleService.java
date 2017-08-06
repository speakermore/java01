package ynjh.personal.service;

import java.util.List;

import ynjh.personal.entity.CommentArticle;
/**
 * @author 胡林飞
 * 
 */
public interface CommentArticleService {	
		// 写文章评论
		public Integer addComment(CommentArticle commentArticle);
		// 删除评价
		public Integer deleteUserCommentArticle(Integer id);
		/**
		 * 牟勇：根据文章id查询所有的评论<br />
		 * 评论必须通过审核<br />
		 * 评论按时间降序排列
		 * @param articleId 文章id
		 * @return 符合条件的CommentArticle实体类集合
		 */
		public List<CommentArticle> findCommentByArticleId(Integer articleId);

}
