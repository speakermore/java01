package ynjh.personal.service.impl.commentarticle;

import java.util.List;
/**
 * @author 胡林飞
 *操作文章评论
 */

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.personal.dao.commentarticle.CommentArticleMapper;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.service.CommentArticleService;
@Service
public class CommentArticleServiceImpl implements CommentArticleService {
	@Resource
	private CommentArticleMapper commentArticleMapper;
	/**
	 * 写文章评论
	 * @return Integer 成功1 失败2
	 * @param commentArticle 评论文章对象
	 */
	@Override
	public Integer writeUserCommentArticle(CommentArticle commentArticle) {
		return commentArticleMapper.addUserCommentArticle(commentArticle);
	}
/**
 * 删除评论
 * @return Integer成功1 失败2
 * @param id 文章评论ID
 */
	@Override
	public Integer deleteUserCommentArticle(Integer id) {
		return commentArticleMapper.deleteUserCommentArticle(id);
	}
	/**
	 * 查看评论内容
	 * @return List<CommentArticle> 评论列表
	 * @param articleId 文章ID
	 */
	@Override
	public List<CommentArticle> findUserCommentArticle(Integer articleId) {
		return commentArticleMapper.selectUserCommentArticle(articleId);
	}


}
