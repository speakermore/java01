package ynjh.company.service;

import java.util.List;

import ynjh.personal.entity.CommentArticle;

/**
 * 
 * @author 黄冰雁
 *
 */
public interface CompanyCommentArticleService {
	//增加每日动态评论
	public int addArticle(CommentArticle comArt);
	//查询所有每日动态评论
	public List<CommentArticle> findAll(Integer articleId);
	//根据id查询该条动态评论
	public CommentArticle findById(Integer id);
	//修改评论状态
	public int updateStatus(Integer id,Integer commentArticleStatus);
	//增加评论点赞数
	public int updateLike(Integer id);
	//查询最大页码
	public int getMaxpage();
}
