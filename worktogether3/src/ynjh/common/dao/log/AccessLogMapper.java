package ynjh.common.dao.log;

import ynjh.common.entity.AccessLog;

/**
 * 用于监视用户访问流量的日志Mapper
 * @author 牟勇
 *
 */
public interface AccessLogMapper {
	/**
	 * 添加访问日志到数据库
	 * @param log 实体类，记录用户访问信息
	 * @return
	 */
	public Integer addAccessLog(AccessLog log);
}
