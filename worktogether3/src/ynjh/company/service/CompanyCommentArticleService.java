package ynjh.company.service;

import java.util.List;

import ynjh.personal.entity.CommentArticle;


public interface CompanyCommentArticleService {
	public int addArticle(CommentArticle comArt);
	public List<CommentArticle> findAll(Integer articleId);
	public CommentArticle findById(Integer id);
	public int updateStatus(Integer id,Integer commentArticleStatus);
	public int updateLike(Integer id);
	public int getMaxpage();
}
