package ynjh.common.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.sun.javafx.collections.MappingChange.Map;
import ynjh.common.dao.MyCommonResumeMapper;
import ynjh.common.service.MyCommonResumeService;

@Service
public class MyCommonResumeServiceImpl implements MyCommonResumeService {
	
	@Resource
	MyCommonResumeMapper myCommonResumeMapper;
	
	@Override
	public List<Map<String, Object>> findByResumeTitle5(String resumeTitle) {
		return myCommonResumeMapper.findByResumeTitle("%"+resumeTitle+"%", 0, 5);
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

}