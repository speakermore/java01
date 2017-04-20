<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>实名认证</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<form action="personal/user/addUserReal" method="post">
		<input type="hidden" name="userLoginId" value="${user.userLoginId }"  />
		真实姓名：<input type="text" name="userRealName"/><br/>
		身份证号码：<input type="text" name="userIDCard"/><br/>
		身份证正面图片：<input type="text" name="userIDImgFace"/><br/>
		身份证反面图片：<input type="text" name="userIDImgCon"/><br/>
		<input type="submit" value="完成"/>
		<input type="reset" value="重置"/>
</form>
</body>
</html>