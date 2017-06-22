package ynjh.admin.service.news.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.admin.dao.news.NewsMapper;
import ynjh.admin.entity.News;
import ynjh.admin.service.news.NewsService;

@Service
public class NewsServiceImpl implements NewsService {
	@Resource
	NewsMapper newsMapper;
	 
	@Override
	public int addNews(News news) {
		
		news.setNewsDate(new Timestamp(System.currentTimeMillis()));
		//设置状态为1.正常
		news.setNewsStatus(1);
		return newsMapper.addNews(news);
	}

	@Override
	public int updateNews(News news) {
		news.setNewsDate(new Timestamp(System.currentTimeMillis()));
		//设置状态为1.正常
		news.setNewsStatus(1);
		return newsMapper.updateNews(news);
	}

	@Override
	public int deleteNews(Integer id) {
		return newsMapper.deleteNews(id);
	}

	@Override
	public List<News> findAll() {
		return newsMapper.findAll();
	}

	@Override
	public List<News> findTop10ByCreateDate() {
		return newsMapper.findTop10ByCreateDate();
	}

	@Override
	public News findById(Integer id) {
		return newsMapper.findById(id);
	}

	@Override
	public int addClick(Integer id) {
		return newsMapper.addClick(id);
	}

	@Override
	public int addLike(Integer id) {
		return newsMapper.addLike(id);
	}

}
