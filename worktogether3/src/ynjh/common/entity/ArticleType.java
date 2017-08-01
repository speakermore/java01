package ynjh.common.entity;

import java.io.Serializable;

/**
 * 文章分类
 * @author 牟勇
 *
 */
public class ArticleType implements Serializable {
	private static final long serialVersionUID = -957558423926314590L;
	private Integer id;
	private String articleTypeName;
	private Integer articleTypeOwner;
	public ArticleType() {
	}
	public ArticleType(String articleTypeName, Integer articleTypeOwner) {
		this.articleTypeName = articleTypeName;
		this.articleTypeOwner = articleTypeOwner;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getArticleTypeName() {
		return articleTypeName;
	}
	public void setArticleTypeName(String articleTypeName) {
		this.articleTypeName = articleTypeName;
	}
	public Integer getArticleTypeOwner() {
		return articleTypeOwner;
	}
	public void setArticleTypeOwner(Integer articleTypeOwner) {
		this.articleTypeOwner = articleTypeOwner;
	}
	@Override
	public String toString() {
		return "ArticleType [id=" + id + ", articleTypeName=" + articleTypeName + ", articleTypeOwner="
				+ articleTypeOwner + "]";
	}
}
