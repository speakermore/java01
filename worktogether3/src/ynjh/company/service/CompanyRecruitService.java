package ynjh.company.service;



import java.util.List;

import ynjh.company.entity.CompanyJob;
import ynjh.company.entity.CompanyRecruit;

public interface CompanyRecruitService {
	//添加
	public int addCompanyRecruit(CompanyRecruit companyRecruit);
	//查询
	public List<CompanyRecruit> findAll(Integer page,Integer companyId);
	//根据id查询
	public CompanyRecruit findById(Integer id);
	//隐藏
	public int hidden(Integer id);
	//页码最大值
	public int findMaxPage(); 
	//根据id修改
	public int updateCompanyRecruit(CompanyRecruit companyRecruit);
	//招聘信息状态
	public int updateCmpRecStatus(Integer id,Integer cmpRecStatus);
	//简历数
	public int findCount(Integer companyRecruitId);
	//查询招聘信息ID
	public Integer findCompanyRecruitId();
	//恢复效果更改状态为未通过
	public int recover(Integer id);
	//查询工作
	public List<CompanyJob> findJobs();
	/**
	 * 模糊查找我感兴趣的招聘信息，用于个人用户首页的显示
	 * 招聘信息必须是通过审核的
	 * 按招聘信息的发表时间排序
	 * @param userId 个人用户id
	 * @return 符合个人用户简历岗位信息的招聘信息集合
	 */
	public List<CompanyRecruit> findMyIntrestRecruit(Integer userId);
}
