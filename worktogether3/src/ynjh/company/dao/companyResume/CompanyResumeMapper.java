package ynjh.company.dao.companyResume;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.company.entity.CompanyResume;

public interface CompanyResumeMapper {
	public List<CompanyResume> findAllResume(@Param("companyId")Integer companyId);
	public int getResumeCount();
	public int getMaxRecordCount();
	public CompanyResume findById(Integer id);
}
