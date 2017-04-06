package ynjh.company.dao.companyInformation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.enity.Article;

public interface ArticleMapper {
	//增加文章
	public Integer addArticle(Article article);
	//修改文章内容
	public Integer updateArtContent(@Param("articleId")Integer articleId,@Param("articleContent")String articleContent);
	//修改状态
	public Integer updateStatus(@Param("articleId")Integer articleId,@Param("articleStatus")Integer articleStatus);
	//修改阅读量
	public Integer updateReadNum(Integer articleId);
	//修改点赞数
	public Integer updateLikeNum(Integer articleId);
	//查询所有文章
	public List<Article> findAll(@Param("page")Integer page);
	//根据id查询文章
	public Article findById(Integer articleId);
}
