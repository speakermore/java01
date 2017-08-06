package ynjh.personal.service;

import java.util.List;
/**
 * @author 胡林飞
 * 
 */

import ynjh.personal.entity.Article;

public interface ArticleService {
	/**
	 * 添加文章
	 * @param article 文章对象，可以是个人用户发表的文章，也可以是企业用户发表的文章
	 * @return Integer,大于0表示成功，否则表示失败
	 */
	public Integer addArticle(Article article);
	//删除文章
	public Integer deleteUserArticle(Integer id);
	/**
	 * 牟勇：个人文章列表
	 * @param page 页数,如果不分页可以设置为null
	 * @param userId 用户ID 
	 * @return 符合条件的Article实体集合
	 */
	public List<Article> findUserArticle(Integer page,Integer id);
	
	public Article findArticleById(Integer id);
	//修改文章内容
	public Integer updateArticleContent(Article article);
	//文章阅读数
	public Integer updateReadNum(Integer id);
	/**
	 * 牟勇：更新文章点赞+1
	 * 并对点赞进行了记录，对likenum表进行了数据的添加
	 * @param articleId 文章主键
	 * @param userId 用户主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer updateLikeNum(Integer articleId,Integer userId);
	
	// 恢复文章
	public Integer renewArticle(Integer id);
	// 获取未删除的
	public Integer getMaxArticleById(Integer usersId);
	/**
	 * 通过userId查看最新文章(详细)
	 */
	public Article findNewlyArticleByUserId(Integer userId);
	/**
	 * 牟勇：根据文章id查询点赞数
	 * @param articleId 文章主键id
	 * @return 点赞数
	 */
	public Integer findLikeNumByArticleId(Integer articleId);
	/**
	 * 牟勇：取消点赞。点赞数减1，并删除likeNum中的记录数据
	 * @param articleId 文章主键
	 * @param userId 用户主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer cancelLikeNum(Integer articleId,Integer userId);
}
