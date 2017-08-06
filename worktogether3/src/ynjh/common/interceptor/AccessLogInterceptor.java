package ynjh.common.interceptor;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ynjh.common.dao.log.AccessLogMapper;
import ynjh.common.entity.AccessLog;
import ynjh.common.service.log.AccessLogService;

public class AccessLogInterceptor extends HandlerInterceptorAdapter {
	@Resource
	private AccessLogService accessLogService;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		AccessLog log=new AccessLog(request.getHeader("host"),request.getHeader("user-agent"),request.getRemoteHost(),request.getRequestURL().toString(),request.getMethod(),request.getProtocol(),request.getRemoteAddr(),request.getScheme(),""+request.getRemotePort(),request.getQueryString(),""+request.getLocalPort(),request.getLocalAddr(),request.getLocalName(),new Timestamp(System.currentTimeMillis()));
		accessLogService.addAccessLog(log);
		return super.preHandle(request, response, handler);
	}
	
}
