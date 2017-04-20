package ynjh.personal.service;

import java.util.List;

import ynjh.personal.entity.Article;

public interface ArticleService {
	public Integer writeUserArticle(Article article);//写文章
	public Integer deleteUserArticle(Integer id);//删除文章
	public List<Article> findUserArticle(Integer page,Integer id);//查看文章
	public Article findArticleById(Integer id);//查看文章
	public Integer updateArticleContent(Article article);//修改文章内容
	public Integer updateReadNum(Integer id);//文章阅读数
	public Integer updateLikeNum(Integer id);//文章点赞数
	/**
	 * 查看文章(删除)
	 */
	public List<Article> selectArticleByDelete(Integer page,Integer usersId);
	/**
	 * 恢复文章
	 */
	public Integer renewArticle(Integer id);
	/**
	 * 获取未删除的
	 * @return
	 */
	public Integer getMaxRecord(Integer usersId);
	/**
	 * 获取删除的
	 */
	public Integer getMaxRecordDelete(Integer usersId);
	
}
