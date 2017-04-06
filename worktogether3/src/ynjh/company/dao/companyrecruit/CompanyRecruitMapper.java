package ynjh.company.dao.companyrecruit;


import java.util.List;

import org.apache.ibatis.annotations.Param;


import ynjh.company.enity.CompanyRecruit;


public interface CompanyRecruitMapper {
	public int addCompanyRecruit(CompanyRecruit companyRecruit);//��
	public List<CompanyRecruit> findAll(Integer page);//��ҳ
	public Integer updateCpmRecTitle(@Param("companyId")Integer companyId,@Param("cpmRecTitle")String cpmRecTitle );//�޸ı���
	public Integer updateCpmRecWage(@Param("companyId")Integer companyId,@Param("cpmRecWage")String CpmRecWage);//�޸�н��
	public Integer updateCpmRecEducation(@Param("companyId")Integer companyId,@Param("cpmRecEducation")String cpmRecEducation);//�޸�ѧ��
	public Integer updateCmpRecExperience(@Param("companyId")Integer companyId,@Param("cmpRecExperience")String CmpRecExperience);//�޸�����
	public Integer updateCmpRecPeople(Integer companyId);//�޸���������
	public Integer updateCmpRecStatus(Integer companyId);//�޸���Ƹ��Ϣ״̬1:���� 2�����ͨ�� 3����˲�ͨ��
	public CompanyRecruit findById(Integer id);
	public int hidden(Integer id);
}
