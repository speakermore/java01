<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关注列表</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<body>
	<table>
		<tr>
			<td>我的关注</td>
			<td>关注日期</td>
			<td>关注者类型</td>
			<td>操作</td>
		</tr>
		<c:if test="${follows==null}">
			<jsp:forward page="/personal/follow/findFollowFan?followId=${follow.id }"></jsp:forward>
		</c:if>
		<c:forEach items="${follows}" var="follow">
			<tr>
				<td><a href="personal/follow/findFollowFan?id=${follow.id }">${follow.followId }</a></td>
				<td>${follow.followDate}</td>
				<td>${follow.followStartType}</td>
				<td>
				<a href="personal/???????id=${follow.id }">发送简历</a>|
				<a href="javascript:if(confirm('确定取消关注吗？')){location.href='personal/follow/deleteFollow?followId=${follow.followId }'}">取消关注</a>
				</td>
			</tr>
		</c:forEach>
</table>
</body>
</html>