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
	public int findCompanyRecruitId();
	//恢复效果更改状态为未通过
	public int recover(Integer id);
	//查询工作
	public List<CompanyJob> findJobs();
}
