package ynjh.company.service.impl.companyinformation;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ynjh.company.dao.companyinformation.CompanyArticleMapper;
import ynjh.company.service.CompanyArticleService;
import ynjh.personal.entity.Article;

@Service
public class CompanyArticleServiceImpl implements CompanyArticleService{
	private Logger logger=Logger.getLogger(getClass());

	@Resource
	private CompanyArticleMapper companyArticleMapper;
	
	@Override
	public int addArticle(Article article) {
		int result=-1;
		try {
			return companyArticleMapper.addArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("添加企业文章失败！");
		}
		return result;
	}

	@Override
	public List<Article> findAll(Integer page) {
		return null;
	}

	@Override
	public Article findById(Integer articleId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateStatus(Integer articleId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateArtContent(Integer articleId, String articleContent) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLike(Integer articleId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateRead(Integer articleId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
