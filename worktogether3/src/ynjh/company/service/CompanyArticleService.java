package ynjh.company.service;

import java.util.List;

import ynjh.personal.entity.Article;

public interface CompanyArticleService {
	public int addArticle(Article article);
	public List<Article> findAll(Integer page);
	public Article findById(Integer articleId);
	public int updateStatus(Integer articleId);
	public int updateArtContent(Integer articleId,String articleContent);
	public int updateLike(Integer articleId);
	public int updateRead(Integer articleId);
}
