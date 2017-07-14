package ynjh.company.dao.companyrecruit;


import java.util.List;

import org.apache.ibatis.annotations.Param;


import ynjh.company.entity.CompanyJob;
import ynjh.company.entity.CompanyRecruit;


public interface CompanyRecruitMapper {
	//添加招聘信息
	public int addCompanyRecruit(CompanyRecruit companyRecruit);
	//查询所有招聘信息
	public List<CompanyRecruit> findAll(@Param("page")Integer page,@Param("companyId")Integer companyId);
	//根据id修改招聘信息状态
	public Integer updateCmpRecStatus(@Param("cmpRecStatus")Integer cmpRecStatus,@Param("id")Integer id);
	//根据id修改招聘信息
	public Integer updateCmpRecruit(CompanyRecruit companyRecruit);
	//根据id查询到招聘信息
	public CompanyRecruit findById(Integer id);
	//得到最大页码数
	public int getMaxRecordCount();
	//得到未阅读简历个数
	public int getResumeCount(Integer companyRecruitId);
	//查询招聘信息id
	public Integer findCompanyRecruitId();
	//查询工作表
	public List<CompanyJob> findJobs();
	/**
	 * 牟勇：根据招聘岗位名称进行查询招聘信息，支持模糊查询。
	 * 查询距今天6个月以内的招聘信息
	 * 返回值包括公司全称，公司简称，岗位名称，学历，工作经验要求等companyRecruit表中的全部信息
	 * @param cmpRecTitle 对应岗位表中的标准岗位名称
	 * @return 匹配岗位名称的公司招聘信息
	 */
	public List<CompanyRecruit> findByCmpRecTitle(String cmpRecTitle);
}
