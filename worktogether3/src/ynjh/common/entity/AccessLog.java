package ynjh.common.entity;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 记录用户访问日志，包括主机名，地址，浏览器，请求位置等等，以便将来进行用户访问分析
 * @author 牟勇
 *
 */
public class AccessLog implements Serializable {
	private static final long serialVersionUID = 9137376429998609428L;
	private Integer id;
	//主机名及端口号
	private String host;
	//浏览器类型，操作系统类型
	private String useragent;
	//远程主机名
	private String remoteHost;
	//请求的URL
	private String requestURL;
	//请求方法
	private String method;
	//协议名称及版本
	private String protocol;
	//远程IP
	private String remoteAddr;
	//URL的协议名部分
	private String scheme;
	//远程端口号
	private String remotePort;
	//请求参数
	private String queryString;
	//本地端口号
	private String localPort;
	//本机IP地址
	private String localAddr;
	//本机名
	private String localName;
	private Timestamp accessTime;
	public AccessLog() {
	}
	public AccessLog(String host, String useragent, String remoteHost, String requestURL, String method,
			String protocol, String remoteAddr, String scheme, String remotePort, String queryString, String localPort,
			String localAddr, String localName,Timestamp accessTime) {
		
		this.host = host;
		this.useragent = useragent;
		this.remoteHost = remoteHost;
		this.requestURL = requestURL;
		this.method = method;
		this.protocol = protocol;
		this.remoteAddr = remoteAddr;
		this.scheme = scheme;
		this.remotePort = remotePort;
		this.queryString = queryString;
		this.localPort = localPort;
		this.localAddr = localAddr;
		this.localName = localName;
		this.accessTime=accessTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getUseragent() {
		return useragent;
	}
	public void setUseragent(String useragent) {
		this.useragent = useragent;
	}
	public String getRemoteHost() {
		return remoteHost;
	}
	public void setRemoteHost(String remoteHost) {
		this.remoteHost = remoteHost;
	}
	public String getRequestURL() {
		return requestURL;
	}
	public void setRequestURL(String requestURL) {
		this.requestURL = requestURL;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getProtocol() {
		return protocol;
	}
	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}
	public String getRemoteAddr() {
		return remoteAddr;
	}
	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	public String getRemotePort() {
		return remotePort;
	}
	public void setRemotePort(String remotePort) {
		this.remotePort = remotePort;
	}
	public String getQueryString() {
		return queryString;
	}
	public void setQueryString(String queryString) {
		this.queryString = queryString;
	}
	public String getLocalPort() {
		return localPort;
	}
	public void setLocalPort(String localPort) {
		this.localPort = localPort;
	}
	public String getLocalAddr() {
		return localAddr;
	}
	public void setLocalAddr(String localAddr) {
		this.localAddr = localAddr;
	}
	public String getLocalName() {
		return localName;
	}
	public void setLocalName(String localName) {
		this.localName = localName;
	}
	
	public Timestamp getAccessTime() {
		return accessTime;
	}
	public void setAccessTime(Timestamp accessTime) {
		this.accessTime = accessTime;
	}
	@Override
	public String toString() {
		return "AccessLog [host=" + host + ", useragent=" + useragent + ", remoteHost=" + remoteHost + ", requestURL="
				+ requestURL + ", method=" + method + ", protocol=" + protocol + ", remoteAddr=" + remoteAddr
				+ ", scheme=" + scheme + ", remotePort=" + remotePort + ", queryString=" + queryString + ", localPort="
				+ localPort + ", localAddr=" + localAddr + ", localName=" + localName + ", accessTime=" + accessTime
				+ "]";
	}
	
}
