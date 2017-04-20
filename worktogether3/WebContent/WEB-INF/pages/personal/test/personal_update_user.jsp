<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>
</head>
<body>
	<!-- 修改用户信息：头像、密码、性别、email、出生日期、昵称 -- -->
	<form action="personal/user/updateUser" method="post">
		<input type="hidden" name="id" value="${user.id}" /> 头像：<input
			type="text" name="userHeadImgPath" value="${user.userHeadImgPath }" /><br />
		密码：<input type="password" name="userPassword"
			value="${user.userPassword }" /><br />
		<c:if test="${user.userGender==1 }">
		性别：男：<input type="checkbox" name="userGender" value="1"
				checked="checked" />
		&nbsp;女：<input name="userGender" type="checkbox" value="2" />
			<br />
		</c:if>
		<c:if test="${user.userGender==2 }">
		性别：男：<input type="checkbox" name="userGender" value="1" />
		&nbsp;女：<input name="userGender" type="checkbox" value="2"
				checked="checked" />
			<br />
		</c:if>
		邮箱：<input type="text" name="userEmail" value="${user.userEmail }" /><br />
		昵称：<input type="text" name="userName" value="${user.userName }" /><br />
		<input type="submit" value="修改" /> <input type="reset" value="重置" />
	</form>
	
</body>
</html>