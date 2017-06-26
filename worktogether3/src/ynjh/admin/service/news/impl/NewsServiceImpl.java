package ynjh.admin.service.news.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.admin.dao.news.NewsMapper;
import ynjh.admin.entity.News;
import ynjh.admin.service.news.NewsService;

/**
 * 新闻资讯的Service
 * @author 牟勇
 *
 */
@Service
public class NewsServiceImpl implements NewsService {
	@Resource
	NewsMapper newsMapper;
	 
	@Override
	public int addNews(News news) {
		
		news.setNewsDate(new Timestamp(System.currentTimeMillis()));
		//设置状态为9.正常
		news.setNewsStatus(9);
		return newsMapper.addNews(news);
	}

	@Override
	//修改新闻资讯
	public int updateNews(News news) {
		news.setNewsDate(new Timestamp(System.currentTimeMillis()));
		//设置状态为9.正常
		news.setNewsStatus(9);
		return newsMapper.updateNews(news);
	}

	@Override
	//删除资讯
	public int deleteNews(Integer id) {
		return newsMapper.deleteNews(id);
	}

	@Override
	//资讯列表
	public List<News> findAll() {
		return newsMapper.findAll();
	}

	@Override
	//最新资讯
	public List<News> findTop10ByCreateDate() {
		//查找前10篇新闻资讯
		return newsMapper.findTop10ByCreateDate();
	}

	@Override
	//按主键查找对象
	public News findById(Integer id) {
		return newsMapper.findById(id);
	}

	@Override
	//点击数累积
	public int addClick(Integer id) {
		return newsMapper.addClick(id);
	}

	@Override
	//点赞
	public int addLike(Integer id) {
		return newsMapper.addLike(id);
	}

	@Override
	//置顶
	public int stick(Integer id,Integer status) {
		//把状态更改为10（置顶）
		return newsMapper.updateStatus(id,status);
	}

}
