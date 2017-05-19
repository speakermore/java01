package ynjh.company.service.impl.company;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.company.dao.company.LikeNumMapper;
import ynjh.company.entity.LikeNum;
import ynjh.company.service.LikeNumService;
@Service
public class LikeNumServiceImpl implements LikeNumService {

	@Resource
	private LikeNumMapper likeMapper;
	@Override
	public LikeNum findByArt(Integer articleId, Integer usersId) {
		return likeMapper.findByArticle(articleId, usersId);
	}

	@Override
	public LikeNum findByCommentArt(Integer commentArticleId, Integer usersId) {
		return likeMapper.findByCommentArticle(commentArticleId, usersId);
	}

	@Override
	public int addLike(LikeNum likeNum) {
		
		return likeMapper.addLikeNum(likeNum);
	}

}
