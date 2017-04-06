package ynjh.company.dao.companyInformation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.enity.CommentArticle;

public interface CommentArticleMapper {
	//添加评论
	public Integer addCommentArticle(CommentArticle comArticle);
	//修改点赞数
	public Integer updateCommentLikeNum(Integer id);
	//修改状态
	public Integer updateCommentStatus(@Param("id")Integer id,@Param("commentArticleStatus")Integer commentArticleStatus);
	//根据id找到文章评论
	public CommentArticle findById(Integer id);
	//查询所有文章评论
	public List<CommentArticle> findAll(@Param("page")Integer page);
}
