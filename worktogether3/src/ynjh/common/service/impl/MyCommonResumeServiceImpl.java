package ynjh.common.service.impl;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ynjh.common.dao.MyCommonResumeMapper;
import ynjh.common.exception.AgeOverFlowException;
import ynjh.common.service.MyCommonResumeService;
import ynjh.common.util.LiuZhiHaoDateTimeUtil;

@Service
public class MyCommonResumeServiceImpl implements MyCommonResumeService {
	@Resource
	MyCommonResumeMapper myCommonResumeMapper;
	
	@Override
	public List<Map<String, Object>> findByResumeTitle5(String resumeTitle) {
		String[] reTitles=Arrays.stream(resumeTitle.split(",")).map(title->"%"+title+"%").toArray(size -> new String[size]);
		String[] reTitlesWithOutPercent=resumeTitle.split(",");
		List<Map<String, Object>> list= myCommonResumeMapper.findByResumeTitle((String[])reTitles, 0, 5);
		//将Timestamp的工作时间转换为工作的年限
		//将求职意向岗位保留匹配的一项
		list.stream().forEach(m->{
			try {
				m.put("resumeWorks",LiuZhiHaoDateTimeUtil.getAgeTools((Timestamp)m.get("resumeWorks")));
			} catch (AgeOverFlowException e) {
				e.printStackTrace();
			}
			for(String rTitle:reTitlesWithOutPercent){
				if(((String)m.get("resumeTitle")).contains(rTitle)){
					m.put("resumeTitle", rTitle);
					break;
				}
			}
		});
		return list;
	}

	@Override
	public Integer countByResumeTitle(String resumeTitle) {
		String[] reTitles=Arrays.stream(resumeTitle.split(",")).map(title->"%"+title+"%").toArray(size -> new String[size]);
		return myCommonResumeMapper.countByResumeTitle(reTitles);
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