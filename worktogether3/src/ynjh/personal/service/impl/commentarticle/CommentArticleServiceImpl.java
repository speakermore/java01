package ynjh.personal.service.impl.commentarticle;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.personal.dao.commentarticle.CommentArticleMapper;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.service.CommentArticleService;
@Service
public class CommentArticleServiceImpl implements CommentArticleService {
	@Resource
	private CommentArticleMapper commentArticleMapper;
	@Override
	public Integer writeUserCommentArticle(CommentArticle commentArticle) {
		return commentArticleMapper.addUserCommentArticle(commentArticle);
	}

	@Override
	public Integer deleteUserCommentArticle(Integer id) {
		return commentArticleMapper.deleteUserCommentArticle(id);
	}

	@Override
	public List<CommentArticle> findUserCommentArticle(Integer id) {
		return commentArticleMapper.selectUserCommentArticle(id);
	}

}
