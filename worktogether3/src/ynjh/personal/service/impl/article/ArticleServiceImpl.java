package ynjh.personal.service.impl.article;

import java.util.ArrayList;
import java.util.List;


import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ynjh.personal.dao.article.ArticleMapper;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.User;
import ynjh.personal.service.ArticleService;
/**
 * @author 胡林飞
 *操作文章
 */
@Service
public class ArticleServiceImpl implements ArticleService {
	private Logger logger=Logger.getLogger(this.getClass());
	@Resource
	private ArticleMapper articleMapper;
	@Override
	/**
	 * 写文章
	 * @return Integer
	 * @param article 文章对象
	 */
	public Integer writeUserArticle(Article article) {
		int result=-1;
		try {
			result=articleMapper.addUserArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("gggggggggggg");
		}
		return result;
	}
	/**
	 * 删除文章
	 * @return Integer
	 * @param id 用户id
	 */
	@Override
	public Integer deleteUserArticle(Integer id) {
		return articleMapper.deleteUserArticle(id);
	}
	/**
	 * 个人文章列表
	 * @return  List<Article>返回文章列表
	 * @param page 页数
	 * @param id 用户ID 
	 */
	@Override
	public List<Article> findUserArticle(Integer page,Integer userId) {
		if (page==null) {
			page=1;
		}
		if(page<1){
			page=1;
		}
		int maxPage=getMaxArticleById(userId);
		if(page>maxPage){
			page=maxPage;
		}
		return articleMapper.selectUserArticle((page-1)*5,userId);
	}
	/**
	 * 修改文章内容
	 * @return Integer 大于0跳转成功
	 * @param article  文章对象
	 */
	@Override
	public Integer updateArticleContent(Article article) {
		return articleMapper.updateArticleContent(article);
	}
	/**
	 * 阅读数
	 * @return Integer 返回阅读数
	 * @param id 文章id
	 */
	@Override
	public Integer updateReadNum(Integer id) {
		return articleMapper.updateReadNum(id);
	}
	/**
	 * 点赞数
	 * @return Integer 返回点赞数
	 * @param id 文章id
	 */
	@Override
	public Integer updateLikeNum(Integer id) {
		return articleMapper.updateLikeNum(id);
	}
	/**
	 * 获得最大记录数
	 * @return Integer返回最大记录数
	 * @param usersId  用户ID
	 */
	@Override
	public Integer getMaxArticleById(Integer usersId) {
		if (articleMapper.getMaxRecord(usersId)<=0) {
			return 1;
		}else {
			return (articleMapper.getMaxRecord(usersId)+5-1)/5;
		}
	}
	/**
	 * 查看文章详情
	 * @return Article 文章对象
	 * @param id 文章id
	 */
	@Override
	public Article findArticleById(Integer id) {
		return articleMapper.selectArticleById(id);
	}
	
	/**
	 * 恢复已删除文章
	 * @return Integer 成功1 失败2
	 * @param id 文章ID
	 */
	@Override
	public Integer renewArticle(Integer id) {
		return articleMapper.renewArticle(id);
	}
	/**
	 * 通过userId查看最新文章(详细)
	 */
	@Override
	public Article findNewlyArticleByUserId(Integer userId) {
		return articleMapper.findNewlyArticleByUserId(userId);
	}
	
}
