<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>完善资料</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<form action="personal/user/addUserOther" method="post">
		<input type="hidden" name="userLoginId" value="${user.userLoginId }"  />
		昵称：<input type="text" name="userName"/><br/>
		性别：男：<input type="radio" name="userGender" value="1" checked="checked"/>
		&nbsp;女：<input name="userGender" type="radio" value="2" ><br/>
		邮箱：<input type="text" name="userEmail"/><br/>
		头像：<input type="text" name="userHeadImgPath"/><br/>
		<!-- 出生日期：<input type="month" name="userBirthday"/><br/> -->
		<input type="submit" value="下一步"/>
		<input type="reset" value="重置"/>
	</form>
</body>
</html>