package ynjh.personal.service.impl.article;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ynjh.personal.dao.article.ArticleMapper;
import ynjh.personal.entity.Article;
import ynjh.personal.service.ArticleService;
@Service
public class ArticleServiceImpl implements ArticleService {
	private Logger logger=Logger.getLogger(this.getClass());
	@Resource
	private ArticleMapper articleMapper;
	@Override
	public Integer writeUserArticle(Article article) {
		int result=-1;
		try {
			result=articleMapper.addUserArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("gggggg");
		}
		return result;
	}
	@Override
	public Integer deleteUserArticle(Integer id) {
		return articleMapper.deleteUserArticle(id);
	}
	@Override
	public List<Article> findUserArticle(Integer id) {
		return articleMapper.selectUserArticle(id);
	}
	@Override
	public Integer updateArticleContent(String articleContent, Integer id) {
		return articleMapper.updateArticleContent(articleContent, id);
	}
	@Override
	public Integer updateReadNum(Integer id) {
		return articleMapper.updateReadNum(id);
	}
	@Override
	public Integer updateLikeNum(Integer id) {
		return articleMapper.updateLikeNum(id);
	}
	@Override
	public Integer getMaxRecord() {
		return articleMapper.getMaxRecord();
	}
	@Override
	public int getMaxRecordCount() {
		return articleMapper.getMaxRecordCount();
	}
	@Override
	public Article findArticleById(Integer id) {
		return articleMapper.selectArticleById(id);
	}
	
}
