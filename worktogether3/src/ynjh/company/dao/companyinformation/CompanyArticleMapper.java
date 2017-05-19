package ynjh.company.dao.companyinformation;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import ynjh.personal.entity.Article;


public interface CompanyArticleMapper {
	//增加文章
	public Integer addArticle(Article article);
	//修改文章内容
	public Integer updateArtContent(@Param("id")Integer id,@Param("articleContent")String articleContent);
	//修改文章状态״̬
	public Integer updateStatus(@Param("id")Integer id,@Param("articleStatus")Integer articleStatus);
	//修改阅读量
	public Integer updateReadNum(Integer id);
	//修改点赞数
	public Integer updateLikeNum(Integer id);
	//查询所有文章
	public List<Article> findAll(@Param("page")Integer page,@Param("usersId")Integer usersId);
	//按照id查询文章
	public Article findById(Integer id);
	//最大的页数
	public int getMaxRecordCount();
}
