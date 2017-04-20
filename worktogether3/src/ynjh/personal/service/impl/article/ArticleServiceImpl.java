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
			logger.warn("gggggggggggg");
		}
		return result;
	}
	@Override
	public Integer deleteUserArticle(Integer id) {
		return articleMapper.deleteUserArticle(id);
	}
	@Override
	public List<Article> findUserArticle(Integer page,Integer id) {
		if (page==null) {
			page=1;
		}
		if(page<1){
			page=1;
		}
		int maxPage=getMaxRecord(id);
		if(page>maxPage){
			page=maxPage;
		}
		return articleMapper.selectUserArticle((page-1)*5,id);
	}
	@Override
	public Integer updateArticleContent(Article article) {
		return articleMapper.updateArticleContent(article);
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
	public Integer getMaxRecord(Integer usersId) {
		return (articleMapper.getMaxRecord(usersId)+5-1)/5;
	}
	
	@Override
	public Article findArticleById(Integer id) {
		return articleMapper.selectArticleById(id);
	}
	@Override
	public List<Article> selectArticleByDelete(Integer page,Integer usersId) {
		if (page==null) {
			page=1;
		}
		if(page<1){
			page=1;
		}
		int maxPage=getMaxRecordDelete(usersId);
		if(page>maxPage){
			page=maxPage;
		}
		return articleMapper.selectArticleByDelete((page-1)*5,usersId);
	}
	@Override
	public Integer renewArticle(Integer id) {
		return articleMapper.renewArticle(id);
	}
	@Override
	public Integer getMaxRecordDelete(Integer usersId) {
		return (articleMapper.getMaxRecordDelete(usersId)+5-1)/5;
	}
	
}
