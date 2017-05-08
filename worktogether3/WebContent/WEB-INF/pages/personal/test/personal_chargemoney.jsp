<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>充值</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<form action="personal/user/chargeMoney" method="post">
	<input type="hidden" name="id" value="${user.id }" />
	用户名：<input type="text" value="${user.userLoginId }" readonly="readonly"/><br/>
	充值金额：<input type="text" name="userMoney" /><br/>
	<input type="submit" value="充值"/>
	<input type="reset" value="重置"/>
	</form>
</body>
</html>