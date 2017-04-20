<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>欢迎登录</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<form action="personal/user/login" method="post">
		账号：<input type="text" name="userLoginId" /><span style="color:red">${errorInfo }</span><br/>
		密码：<input type="password" name="userPassword"><br/>
		<input type="submit" value="登录"/>
		<input type="reset" value="重置"/>
	</form>
</body>
</html>