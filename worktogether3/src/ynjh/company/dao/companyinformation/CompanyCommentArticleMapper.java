package ynjh.company.dao.companyinformation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.CommentArticle;


public interface CompanyCommentArticleMapper {
	//添加文章评论
	public Integer addCommentArticle(CommentArticle commentArticle);
	//更新文章评论点赞数
	public Integer updateCommentLikeNum(Integer id);
	//更新文章评论状态״̬
	public Integer updateCommentStatus(@Param("id")Integer id,@Param("commentArticleStatus")Integer commentArticleStatus);
	//根据id查询文章评论
	public CommentArticle findById(Integer id);
	//查询所有文章评论
	public List<CommentArticle> findAll(Integer articleId);
	//获取最大页数
	public int getMaxCommentCount();
	
}
