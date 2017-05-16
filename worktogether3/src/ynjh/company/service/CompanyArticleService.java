package ynjh.company.service;

import java.util.List;

import ynjh.personal.entity.Article;
/**
 * 
 * @author 黄冰雁
 *
 */
public interface CompanyArticleService {
	//增加每日动态
	public int addArticle(Article article);
	//查询所有每日动态
	public List<Article> findAll(Integer page);
	//根据id查询该条动态
	public Article findById(Integer id);
	//根据id查询更改状态
	public int updateStatus(Integer id,Integer articleStatus);
	//根据id查询修改动态内容
	public int updateArtContent(Integer id,String articleContent);
	//根据id查询增加点赞数
	public int updateLike(Integer id);
	//根据id查询增加阅读量
	public int updateRead(Integer id);
	//查询最大页码
	public int findMaxPage();
	
}
