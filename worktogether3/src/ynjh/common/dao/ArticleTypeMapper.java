package ynjh.common.dao;

import java.util.List;

import ynjh.common.entity.ArticleType;

/**
 * 文章类型的Dao接口
 * @author 牟勇
 *
 */
public interface ArticleTypeMapper {
	/**
	 * 查询所有管理员会用到的资讯类型
	 * @return 符合条件的ArticleType实体集合
	 */
	public List<ArticleType> findNewsTypeForAdmin();
	/**
	 * 查询所有个人用户会用到的文章类型
	 * @return 符合条件的ArticleType实体集合
	 */
	public List<ArticleType> findArticleTypeForPersonal();
}
