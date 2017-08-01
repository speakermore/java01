package ynjh.common.service;
/**
 * 文章类型的service接口
 * @author 牟勇
 *
 */

import java.util.List;

import ynjh.common.entity.ArticleType;

public interface ArticleTypeService {
	/**
	 * 查询管理员使用的资讯类型
	 * @return
	 */
	public List<ArticleType> findNewsTypeForAdmin();
	/**
	 * 查询个人用户使用的资讯类型
	 * @return
	 */
	public List<ArticleType> findArticleTypeForPersonal();
}
