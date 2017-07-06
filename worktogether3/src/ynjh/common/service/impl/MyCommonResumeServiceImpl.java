package ynjh.common.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ynjh.common.dao.MyCommonResumeMapper;
import ynjh.common.exception.AgeOverFlowException;
import ynjh.common.service.MyCommonResumeService;
import ynjh.common.util.GetAge;

@Service
public class MyCommonResumeServiceImpl implements MyCommonResumeService {
	
	@Resource
	MyCommonResumeMapper myCommonResumeMapper;
	
	@Override
	public List<Map<String, Object>> findByResumeTitle5(String resumeTitle) {
		List<Map<String, Object>> list= myCommonResumeMapper.findByResumeTitle("%"+resumeTitle+"%", 0, 5);
		//将Timestamp的工作时间转换为工作的年限
		list.stream().forEach(m->{
			try {
				m.put("resumeWorks",GetAge.getAgeTools((Timestamp)m.get("resumeWorks")));
			} catch (AgeOverFlowException e) {
				e.printStackTrace();
			}
		});
		return list;
	}

	@Override
	public Integer countByResumeTitle(String resumeTitle) {
		return myCommonResumeMapper.countByResumeTitle("%"+resumeTitle+"%");
	}

	@Override
	public List<Map<String, Object>> findBycmpRecTitle5(String cmpRecTitle) {
		return myCommonResumeMapper.findBycmpRecTitle("%"+cmpRecTitle+"%", 0, 5);
	}

	@Override
	public Integer countBycmpRecTitle(String cmpRecTitle) {
		return myCommonResumeMapper.countBycmpRecTitle("%"+cmpRecTitle+"%");
	}

	@Override
	public List<Map<String, Object>> findByCrowdfundCompany5() {
		return myCommonResumeMapper.findByPublisherIdType(1, 0, 5);
	}

	@Override
	public List<Map<String, Object>> findByCrowdfundPerson5() {
		return myCommonResumeMapper.findByPublisherIdType(1234567891, 0, 5);
	}

	@Override
	public Integer countCrowdfundCompany() {
		
		return myCommonResumeMapper.countByPublisherIdType(1);
	}

	@Override
	public Integer countCrowdfundPersonal() {
		
		return myCommonResumeMapper.countByPublisherIdType(1234567891);
	}

	@Override
	public List<Map<String, Object>> findByCompanyArticle5() {
		
		return myCommonResumeMapper.findByArticleType(1, 0, 5);
	}

	@Override
	public Integer countCompanyArticle() {
		return myCommonResumeMapper.countByArticleType(1);
	}

	@Override
	public List<Map<String, Object>> findByPersonalArticle5() {
		
		return myCommonResumeMapper.findByArticleType(1234567891, 0, 5);
	}

	@Override
	public Integer countPersonalArticle() {
		
		return myCommonResumeMapper.countByArticleType(1234567891);
	}

}