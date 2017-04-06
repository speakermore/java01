package ynjh.company.service;

import java.util.List;

import ynjh.personal.entity.Article;



public interface ArticleService {
	public int addArticle(Article article);
	public List<Article> findAll(Integer page);
	public Article findById(Integer id);
	public int updateStatus(Integer id);
	public int updateArtContent(Integer id,String articleContent);
	public int updateLike(Integer id);
	public int updateRead(Integer id);
}
