<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>注册</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<!-- userLoginIduserPassword,userName,userGender,userEmail,userRealName,userIDCard,userIDImgFace,
userIDImgCon,userCreateDate,userHeadImgPath,userBirthday -->
	<form action="personal/user/addUser" method="post">
		账号：<input type="text" name="userLoginId" /><br/>
		密码：<input type="password" name="userPassword"/><br/>	
		<input type="submit" value="注册"/>
		<input type="reset" value="重置"/>
	</form>
</body>
</html>