package ynjh.personal.dao.article;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Article;

public interface ArticleMapper {
	/**
	 * 写文章
	 */
	public Integer addUserArticle(Article article);

	/**
	 * 删除文章
	 */
	public Integer deleteUserArticle(Integer id);

	/**
	 * 查看文章(所有)
	 */
	public List<Article> findUserArticle(@Param("page")Integer page,@Param("usersId")Integer usersId);
	/**
	 * 查看文章(详细)
	 */
	public Article selectArticleById(Integer id);
	/**
	 * 通过userId查看最新文章(详细)
	 */
	public Article findNewlyArticleByUserId(Integer userId);
	/**
	 * 修改文章内容
	 */
	public Integer updateArticleContent(Article article);
	/**
	 * 文章阅读数
	 */
	public Integer updateReadNum(Integer id);
	/**
	 * 文章点赞数
	 */
	public Integer updateLikeNum(Integer id);
	/**
	 * 恢复文章
	 */
	public Integer renewArticle(Integer id);

	/**
	 * 获取文章的总数
	 * @return
	 */
	public int getMaxRecord(Integer usersId);
}
