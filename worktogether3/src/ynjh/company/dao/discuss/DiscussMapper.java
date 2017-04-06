package ynjh.company.dao.discuss;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Discuss;

public interface DiscussMapper {
	//�������
	public Integer addDiscuss(Discuss discuss);
	//�޸�״̬
	public Integer updateDiscussStatus(@Param("id")Integer id,@Param("discussStatus")Integer discussStatus);
	//����id�ҵ�����
	public Discuss findById(Integer id);
	//��ѯ��������
	public List<Discuss> findAll(@Param("page")Integer page);
}
