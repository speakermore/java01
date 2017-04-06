package ynjh.company.service.impl.companyinformation;

import java.util.List;

import ynjh.company.service.ArticleService;
import ynjh.personal.entity.Article;

public class ArticleServiceImpl implements ArticleService{

	@Override
	public int addArticle(Article article) {
		return 0;
	}

	@Override
	public List<Article> findAll(Integer page) {
		return null;
	}

	@Override
	public Article findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateStatus(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateArtContent(Integer id, String articleContent) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLike(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRead(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
