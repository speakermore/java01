package ynjh.common.service.log;

import ynjh.common.entity.AccessLog;

/**
 * 用户完成用户访问记录的Service
 * @author 牟勇
 *
 */
public interface AccessLogService {
	public Integer addAccessLog(AccessLog log);
}
