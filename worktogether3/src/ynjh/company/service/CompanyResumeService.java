package ynjh.company.service;

import java.util.List;

import ynjh.company.entity.CompanyResume;

public interface CompanyResumeService {
	//查询
	public List<CompanyResume> findAllResume(Integer companyId);
	//最大页码数
	public int findMaxPage();
	//查询想详细信息
	public CompanyResume findById(Integer Id);
	//修改简历状态
	public Integer updateCmpResumeStatus(Integer id,Integer cmprAction);
	
}
