package ynjh.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.common.dao.ArticleTypeMapper;
import ynjh.common.entity.ArticleType;
import ynjh.common.service.ArticleTypeService;
@Service
public class ArticleTypeServiceImpl implements ArticleTypeService {
	@Resource
	ArticleTypeMapper articleTypeMapper;
	@Override
	public List<ArticleType> findNewsTypeForAdmin() {
		return articleTypeMapper.findNewsTypeForAdmin();
	}
	@Override
	public List<ArticleType> findArticleTypeForPersonal() {
		
		return articleTypeMapper.findArticleTypeForPersonal();
	}
	
}
