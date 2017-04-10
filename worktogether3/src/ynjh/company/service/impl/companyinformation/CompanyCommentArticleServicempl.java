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
	public List<CommentArticle> findAll(Integer page) {
		if(page==null){
			page=1;
		}
		if(page!=null&&page<1){
			page=1;
		}
		int maxpage=getMaxpage();
		if(page!=null&&page>maxpage){
			page=maxpage;
		}
		return ccArticleMapper.findAll(page);
	}

	@Override
	public CommentArticle findById(Integer id) {
		
		return ccArticleMapper.findById(id);
	}

	@Override
	public int updateStatus(Integer id) {
		
		return ccArticleMapper.updateCommentStatus(id, 4);
	}

	@Override
	public int updateLike(Integer id) {
		
		return ccArticleMapper.updateCommentLikeNum(id);
	}

	@Override
	public int getMaxpage() {
		
		return (ccArticleMapper.getMaxCommentCount()+(5-1))/5;
	}

}
