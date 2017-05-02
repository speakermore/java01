<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<!-- <base href="http://localhost:8080/worktogether2/"> -->
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<body>
	<c:if test="${company!=null }">
		欢迎${company.companySimpleName}光临
		<a href="company/company/logout">退出</a>
		<ul>
			<li><a href="company/company/findById/${company.id }">查看资料</a>
			<li><a href="company/charge/charge">充值</a></li>
			<li><a href="company/charge/chargeTest">花钱</a></li>
			<li><a href="">发表文章</a></li>
		</ul>
	</c:if>
</body>
</html>