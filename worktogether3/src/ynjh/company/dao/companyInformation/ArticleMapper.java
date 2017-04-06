package ynjh.company.dao.companyInformation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Article;


public interface ArticleMapper {
	//��������
	public Integer addArticle(Article article);
	//�޸���������
	public Integer updateArtContent(@Param("articleId")Integer articleId,@Param("articleContent")String articleContent);
	//�޸�״̬
	public Integer updateStatus(@Param("articleId")Integer articleId,@Param("articleStatus")Integer articleStatus);
	//�޸��Ķ���
	public Integer updateReadNum(Integer articleId);
	//�޸ĵ�����
	public Integer updateLikeNum(Integer articleId);
	//��ѯ��������
	public List<Article> findAll(@Param("page")Integer page);
	//����id��ѯ����
	public Article findById(Integer articleId);
}
