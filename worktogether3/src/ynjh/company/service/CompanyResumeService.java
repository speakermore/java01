package ynjh.company.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.CompanyResume;

public interface CompanyResumeService {
/*	//添加表信息
	public int addCompanyResume(CompanyResume companyResume);*/
	//查询
	public List<CompanyResume> findAllResume(Integer companyId);
	//简历数
	public int findCount();
	//最大页码数
	public int findMaxPage();
	//查询想详细信息
	public CompanyResume findById(Integer Id);
}
