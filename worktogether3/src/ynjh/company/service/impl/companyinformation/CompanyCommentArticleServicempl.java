package ynjh.company.service.impl.companyinformation;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.company.dao.companyinformation.CompanyCommentArticleMapper;
import ynjh.company.service.CompanyCommentArticleService;
import ynjh.personal.entity.CommentArticle;
@Service
public class CompanyCommentArticleServicempl implements CompanyCommentArticleService{

	@Resource
	private CompanyCommentArticleMapper ccArticleMapper;
	@Override
	public int addArticle(CommentArticle commentArticle) {
		
		return ccArticleMapper.addCommentArticle(commentArticle);
	}

	@Override
	public List<CommentArticle> findAll(Integer articleId) {
		
		return ccArticleMapper.findAll(articleId);
	}

	@Override
	public CommentArticle findById(Integer id) {
		
		return ccArticleMapper.findById(id);
	}

	@Override
	public int updateStatus(Integer id,Integer commentArticleStatus) {
		
		return ccArticleMapper.updateCommentStatus(id, commentArticleStatus);
	}

	@Override
	public int updateLike(Integer id) {
		
		return ccArticleMapper.updateCommentLikeNum(id);
	}

	@Override
	public int getMaxpage() {
		if(ccArticleMapper.getMaxCommentCount()<=0){
			return 1;
		}else{
			return (ccArticleMapper.getMaxCommentCount()+(5-1))/5;
		}
		
	}

}
