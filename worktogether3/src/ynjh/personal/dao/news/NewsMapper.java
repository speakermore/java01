package ynjh.personal.dao.news;

import java.util.List;

import ynjh.company.entity.CompanyRecruit;

public interface NewsMapper {

	//根据被关注的公司ID查询公司最新动态！
	public List<CompanyRecruit> findNewsCompanyRecruit();
	//根据被关注用户ID查询XX用户发表的最新文章
	//根据用户ID查询最新
	//根据用户ID查询文章的评论
	//根据用户ID查询文章ID
}
