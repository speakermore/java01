package ynjh.personal.service;

import java.util.List;

import ynjh.personal.entity.CommentArticle;

public interface CommentArticleService {	
		/**
		 * 写文章评论
		 */
		public Integer writeUserCommentArticle(CommentArticle commentArticle);
		/**
		 * 删除评价
		 */
		public Integer deleteUserCommentArticle(Integer id);
		/**
		 * 查看评价
		 */
		public List<CommentArticle> findUserCommentArticle(Integer articleId);

}
