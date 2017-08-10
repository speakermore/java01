package ynjh.company.dao.companyrecruit;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import ynjh.company.entity.CompanyRecruit;


public interface CompanyRecruitMapper {
	//添加招聘信息
	public int addCompanyRecruit(CompanyRecruit companyRecruit);
	
	/**
	 * 牟勇：根据企业主键id查询招聘岗位(cmpRecTitle)，月薪(cmpRecWage)，招聘人数(cmpRecPeople)，招聘发布的时间(cmpRecTime)，状态(cmpRecStatus)及应聘的人数统计(resumeNumber)<br />
	 * @param page 当前页码，从1开始，如果为null，则不分页
	 * @param companyId 企业的主键id
	 * @return 包括符合条件的Map集合，Map的键就是上面写的英文
	 */
	public List<Map<String, Object>> findRecruitInfoByCompanyId(@Param("page")Integer page,@Param("companyId")Integer companyId);
	/**
	 * 牟勇：根据id修改招聘信息状态<br />
	 * 招聘信息状态(cmpRecStatus)：1.待审 2.审核通过 3.审核不通过 4.删除/隐藏 5.停止招聘<br/>
	 * @param cmpRecStatus 招聘信息的状态值，数字
	 * @param id 招聘信息主键
	 * @return 大于0表示修改成功，否则表示失败
	 */
	public Integer updateCmpRecStatus(@Param("cmpRecStatus")Integer cmpRecStatus,@Param("id")Integer id);
	//根据id修改招聘信息
	public Integer updateRecruit(CompanyRecruit companyRecruit);
	
	/**
	 * 牟勇：根据主键查询招聘信息，除了companyrecruit表的全部信息外，还输出企业全称与简称
	 * @param id 招聘表主键
	 * @return 符合条件的CompanyRecruit实体对象
	 */
	public CompanyRecruit findById(Integer id);
	//得到最大页码数
	public int getMaxRecordCount();
	//得到未阅读简历个数
	public int getResumeCount(Integer companyRecruitId);
	/**
	 * 查询招聘信息id
	 * @return
	 */
	public Integer findCompanyRecruitId();
	
	/**
	 * 牟勇：根据招聘岗位名称进行查询招聘信息，支持模糊查询。
	 * 查询距今天6个月以内的招聘信息
	 * 返回值包括公司全称，公司简称，岗位名称，学历，工作经验要求等companyRecruit表中的全部信息
	 * @param cmpRecTitle 对应岗位表中的标准岗位名称
	 * @return 匹配岗位名称的公司招聘信息
	 */
	public List<CompanyRecruit> findByCmpRecTitle(String cmpRecTitle);
	/**
	 * 牟勇：查询指定企业是否还有招聘<br />
	 * 查询CompanyRecruit表中指定companyId的cmpRecStatus是2(审核通过，正在招聘中)的记录条数<br />
	 * @param companyId 企业的主键
	 * @return 审核状态为2的记录条数。返回0表示所有招聘信息的审核状态均不是2，没有处于招聘状态
	 */
	public Integer countRecruitByCompanyId(Integer companyId);
}
