package ynjh.personal.dao.article;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Article;

public interface ArticleMapper {
	/**
	 * 写文章
	 */
	public Integer addArticle(Article article);

	/**
	 * 删除文章
	 */
	public Integer deleteUserArticle(Integer id);

	
	/**
	 * 根据用户id查看该用户的所有文章<br />
	 * 如果传入的page为null,不做分页<br />
	 * 按时间降序排序
	 * @param page 当前页号，如果为null，表示不分页
	 * @param usersId 用户主键id，可以是个人用户和企业用户
	 * @return 符合条件的Article集合
	 */
	public List<Article> findArticleByUsersId(@Param("page")Integer page,@Param("usersId")Integer usersId);
	/**
	 * 查看文章(详细)
	 */
	public Article findArticleById(Integer id);
	/**
	 * 通过userId查看最新文章(详细)
	 */
	public Article findNewlyArticleByUserId(Integer userId);
	/**
	 * 修改文章内容
	 */
	public Integer updateArticleContent(Article article);
	
	/**
	 * 更新文章阅读数+1
	 * @param articleId 文章主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer updateReadNum(@Param("articleId")Integer articleId);
	
	/**
	 * 更新文章点赞数+1
	 * @param articleId 文章主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer updateLikeNum(Integer articleId);
	/**
	 * 牟勇：更新文章点赞数-1
	 * @param articleId 文章主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer updateLikeNumMinus(@Param("articleId")Integer articleId);
	/**
	 * 恢复文章
	 */
	public Integer renewArticle(Integer id);

	/**
	 * 根据用户id获取该用户发表的文章总数
	 * @return
	 */
	public int getMaxRecord(Integer usersId);
	/**
	 * 牟勇：根据文章id查询这篇文章的点赞数
	 * @param articleId 文章主键id
	 * @return 指定文章的点赞数
	 */
	public Integer findLikeNumByArticleId(@Param("articleId") Integer articleId);
}
