package ynjh.company.service.impl.companyinformation;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.company.dao.companyinformation.CompanyArticleMapper;
import ynjh.company.service.CompanyArticleService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;

@Service
public class CompanyArticleServiceImpl implements CompanyArticleService{

	@Resource
	private CompanyArticleMapper companyArticleMapper;
	
	@Override
	public int addArticle(Article article) {
		
		return companyArticleMapper.addArticle(article);
	}

	@Override
	public List<Article> findAll(Integer page) {
		if (page==null) {
			page=1;
		}
		if (page!=null&&page<1) {
			page=1;
		}
		int maxPage=findMaxPage();
		if (page!=null&&page>maxPage) {
			page=maxPage;
		}
		return companyArticleMapper.findAll((page-1)*10);
	}

	@Override
	public Article findById(Integer id) {
		
		
		
		return companyArticleMapper.findById(id);
	}

	@Override
	public int updateStatus(Integer id,Integer articleStatus) {
		
		return companyArticleMapper.updateStatus(id, articleStatus);
	}

	@Override
	public int updateArtContent(Integer id, String articleContent) {
		
		return companyArticleMapper.updateArtContent(id, articleContent);
	}

	@Override
	public int updateLike(Integer id) {
		
		return companyArticleMapper.updateLikeNum(id);
	}

	@Override
	public int updateRead(Integer id) {
		
		return companyArticleMapper.updateReadNum(id);
	}

	@Override
	public int findMaxPage() {
		
		return (companyArticleMapper.getMaxRecordCount()+(10-1))/10;
	}

}
