package ynjh.company.service;

import java.util.List;

import ynjh.personal.entity.Article;

public interface CompanyArticleService {
	public int addArticle(Article article);
	public List<Article> findAll(Integer page);
	public Article findById(Integer id);
	public int updateStatus(Integer id,Integer articleStatus);
	public int updateArtContent(Integer id,String articleContent);
	public int updateLike(Integer id);
	public int updateRead(Integer id);
	public int findMaxPage();
	
}
