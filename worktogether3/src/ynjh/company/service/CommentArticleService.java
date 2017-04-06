package ynjh.company.service;

import java.util.List;

import ynjh.company.enity.CommentArticle;


public interface CommentArticleService {
	public int addArticle(CommentArticle comArt);
	public List<CommentArticle> findAll(Integer page);
	public CommentArticle findById(Integer id);
	public int updateStatus(Integer id);
	public int updateLike(Integer id);
}
