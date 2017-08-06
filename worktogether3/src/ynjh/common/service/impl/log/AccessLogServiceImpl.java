package ynjh.common.service.impl.log;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.common.dao.log.AccessLogMapper;
import ynjh.common.entity.AccessLog;
import ynjh.common.service.log.AccessLogService;


@Service
public class AccessLogServiceImpl implements AccessLogService {
	@Resource
	private AccessLogMapper accessLogMapper;
	@Override
	public Integer addAccessLog(AccessLog log) {
		return accessLogMapper.addAccessLog(log);
	}

}
