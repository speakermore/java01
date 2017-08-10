package ynjh.company.service;



import java.util.List;
import java.util.Map;

import ynjh.common.crowdfund.entity.Job;
import ynjh.common.entity.UserRecord;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyRecruit;

public interface CompanyRecruitService {
	//添加
	public int addCompanyRecruit(CompanyRecruit companyRecruit);
	/**
	 * 牟勇：根据企业主键id查询招聘岗位(cmpRecTitle)，月薪(cmpRecWage)，招聘人数(cmpRecPeople)，招聘发布的时间(cmpRecTime)，状态(cmpRecStatus)及应聘的人数统计(resumeNumber)<br />
	 * 用于在企业“我的招聘列表”页面上显示
	 * @param page 当前页码，从1开始，如果为null，则不分页
	 * @param companyId 企业的主键id
	 * @return 包括符合条件的Map集合，Map的键就是上面写的英文
	 */
	public List<Map<String, Object>> findRecruitBaseInfo(Integer page,Integer companyId);
	//根据id查询
	public CompanyRecruit findById(Integer id);
	/**
	 * 停止招聘<br />
	 * 修改cmpRecStatus的状态值为5<br />
	 * 记录用户的招聘行为，以便扣费<br />
	 * 记录用户行为，并进行扣费<br />
	 * 扣费之后，判断企业的招聘是不是全停了，如果是全停了，更改企业的招聘状态为停止招聘，并更改session中的用户状态<br />
	 * @param id 招聘信息的主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer stopRecruit(Integer id,Company user);
	//页码最大值
	public int findMaxPage(); 
	//根据id修改
	public int updateRecruit(CompanyRecruit companyRecruit);
	//招聘信息状态
	public int updateCmpRecStatus(Integer id,Integer cmpRecStatus);
	//简历数
	public int findCount(Integer companyRecruitId);
	//查询招聘信息ID
	public Integer findCompanyRecruitId();
	
	/**
	 * 牟勇：开始招聘<br />
	 * 修改companyrecruit表的状态值为2<br />
	 * 修改company表的companyIsRecruit状态为1<br />
	 * 记录用户信息
	 * @param recruitId 招聘信息主键
	 * @param user 保存在session中的用户对象
	 * @return 用户记录对象，方便控制器向客户端显示信息
	 */
	public UserRecord startRecruit(Integer recruitId,Company user);
	/**
	 * 牟勇：查询一级岗位
	 * @return
	 */
	public List<Job> findJobs1();
	/**
	 * 模糊查找我感兴趣的招聘信息，用于个人用户首页的显示
	 * 招聘信息必须是通过审核的
	 * 按招聘信息的发表时间排序
	 * @param userId 个人用户id
	 * @return 符合个人用户简历岗位信息的招聘信息集合
	 */
	public List<CompanyRecruit> findMyIntrestRecruit(Integer userId);
}
