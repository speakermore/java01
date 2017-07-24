package ynjh.personal.service;

import java.util.List;
/**
 * @author 胡林飞
 * 
 */

import ynjh.personal.entity.Article;

public interface ArticleService {
	//写文章
	public Integer writeUserArticle(Article article);
	//删除文章
	public Integer deleteUserArticle(Integer id);
	/**
	 * 牟勇：个人文章列表
	 * 
	 * @param page 页数,如果不分页可以设置为null
	 * @param userId 用户ID 
	 * @return 符合条件的Article实体集合
	 */
	public List<Article> findUserArticle(Integer page,Integer id);
	//查看文章
	public Article findArticleById(Integer id);
	//修改文章内容
	public Integer updateArticleContent(Article article);
	//文章阅读数
	public Integer updateReadNum(Integer id);
	//文章点赞数
	public Integer updateLikeNum(Integer id);
	
	// 恢复文章
	public Integer renewArticle(Integer id);
	// 获取未删除的
	public Integer getMaxArticleById(Integer usersId);
	/**
	 * 通过userId查看最新文章(详细)
	 */
	public Article findNewlyArticleByUserId(Integer userId);
	
	
}
