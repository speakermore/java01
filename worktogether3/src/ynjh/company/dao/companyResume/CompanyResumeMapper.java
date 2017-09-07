package ynjh.company.dao.companyResume;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.CompanyResume;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Work;

public interface CompanyResumeMapper {
	/**
	 * 牟勇：根据岗位主键查询应聘者信息列表<br />
	 * 应聘信息封装于Map中，有应聘信息id,用户id,简历id,头像，登录账号，姓名，性别，毕业院校，期望待遇，专业，电话<br />
	 * 对应英文名：applyId,userId,resumeId,resumeHeadImg,userLoginId,resumeGender,resumeGraduationSchool,resumeWages,resumeMajor,resumePhone<br />
	 * @param cmpRecId 招聘的岗位信息主键
	 * @return 符合条件的岗位信息Map的List集合
	 */
	public List<Map<String, Object>> findCompanyResumeBycmpRecId(@Param("cmpRecId")Integer cmpRecId);
	public CompanyResume findById(Integer id);
	/**
	 * 牟勇：根据应聘的主键，修改应聘信息的状态<br />
	 * 1.尚未阅读 2.接受简历 3.拒绝简历4.已阅读
	 * @param id 应聘信息表的主键
	 * @param cmprAction 状态值
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer updatecmprActionById(@Param("id")Integer id,@Param("cmprAction")Integer cmprAction);
	public List<Project> findProject(Integer resumeId);
	public List<Work> findWork(Integer resumeId);
	public List<Education> findEducation(Integer resumeId);
	/**
	 * 牟勇：应聘
	 * 添加应聘信息
	 * @param companyResume 包含应聘信息的实体类
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer addCompanyResume(CompanyResume companyResume);
	/**
	 * 牟勇：根据招聘信息主键和简历主键统计应聘信息的数量<br />
	 * @param recruitId 招聘信息主键
	 * @param resumeId 简历主键
	 * @return 符合条件的记录数量
	 */
	public Integer countCompanyResumeByRecruitIdAndResumeId(@Param("recruitId")Integer recruitId,@Param("resumeId")Integer resumeId);
	/**
	 * 牟勇：根据企业id查询有哪些人投递了哪些岗位的简历<br />
	 * 查询已投递简历Id，简历的用户姓名，职位名称<br />
	 * 按时间降序排序<br />
	 * 查询最近6个月<br />
	 * @param companyId 企业id
	 * @return 指定企业6个月内收到的相关简历。Map对象的List集合
	 */
	public List<Map<String, Object>> findCompanyResumeByCompanyId(@Param("companyId")Integer companyId);
}
