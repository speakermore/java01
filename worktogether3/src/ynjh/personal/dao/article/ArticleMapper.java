package ynjh.personal.dao.article;

import java.util.List;

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
	 * 查看文章
	 */
	public List<Article> selectUserArticle(Integer id);
}
