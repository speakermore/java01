<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>
	<c:if test="${company==null }">
		<a href="company/company/companyLogin">登录</a>
		<a href="company/company/add">注册</a>
	</c:if>
	
	<c:if test="${comapny!=null }">
		欢迎${company.name }光临
		<a href="company/logout">退出</a>
		<ul>
			<li><a href="company/charge">充值</a></li>
		</ul>
	</c:if>
	<hr/>
</body>
</html>