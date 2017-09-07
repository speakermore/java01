package ynjh.company.service;

import java.util.List;
import java.util.Map;

import ynjh.company.entity.CompanyResume;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Work;

public interface CompanyResumeService {
	/**
	 * 牟勇：根据企业招聘信息主键查询都有哪些简历投递过来<br />
	 * 应聘信息封装于Map中，有姓名，性别，毕业院校，专业，期望待遇，电话
	 * @param cmpRecId 企业招聘信息主键
	 * @return 符合条件的应聘信息列表，包含Map的List集合
	 */
	public List<Map<String, Object>> findApplyList(Integer cmpRecId);
	//查询详细信息
	public CompanyResume findById(Integer Id);
	/**
	 * 牟勇：修改应聘信息的阅读状态，以便个人用户了解企业对自己投递的简历作了如何的处理<br />
	 * 1.尚未阅读 2.接受简历 3.拒绝简历4.已阅读<br />
	 * @param id 应聘信息的主键
	 * @param cmprAction 阅读状态值
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer updateCmpResumeStatus(Integer id,Integer cmprAction);
	//查询项目经验
	public List<Project> findProject(Integer resumeId);
	//查询工作经历
	public List<Work> findWork(Integer resumeId);
	//查询教育经历
	public List<Education> findEducation(Integer resumeId);
	/**
	 * 牟勇：添加应聘信息<br />
	 * @param companyResume 应聘信息实体
	 * @return 如果大于0表示成功，否则表示失败
	 */
	public Integer addCompanyResume(CompanyResume companyResume);
	/**
	 * 牟勇：检查应聘信息是否存在，用于确定个人用户是否投递过简历，如果投递过，则不能再次投递
	 * @param recruitId 招聘信息主键
	 * @param resumeId 简历主键
	 * @return 大于0表示存在应聘信息，否则表示不存在
	 */
	public Integer isCompanyResumeExist(Integer recruitId,Integer resumeId);
	/**
	 * 牟勇：用户于企业用户登录后的首页显示数据，最近已投递的简历<br />
	 * 查询已投递简历Id，简历的用户姓名，职位名称<br />
	 * 按时间降序排序<br />
	 * 查询最近6个月<br />
	 * @param companyId 企业主键
	 * @return 指定企业的
	 */
	public List<Map<String, Object>> findNewlyApply(Integer companyId);
	
}
