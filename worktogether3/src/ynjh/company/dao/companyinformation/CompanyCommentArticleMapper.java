package ynjh.company.dao.companyinformation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.CommentArticle;


public interface CompanyCommentArticleMapper {
	//�������
	public Integer addCommentArticle(CommentArticle comArticle);
	//�޸ĵ�����
	public Integer updateCommentLikeNum(Integer id);
	//�޸�״̬
	public Integer updateCommentStatus(@Param("id")Integer id,@Param("commentArticleStatus")Integer commentArticleStatus);
	//����id�ҵ���������
	public CommentArticle findById(Integer id);
	//��ѯ������������
	public List<CommentArticle> findAll(@Param("page")Integer page);
}
