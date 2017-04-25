<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@include file="header.jsp"%>
</head>
<body>
	<div><%@include file="menu.jsp"%></div>
<div class="col-md-offset-2">
	<!-- <form action="findAdminLogByTime" method="post">
开始时间<input type="text" value="" name="beginTime"/><br/>
结束时间<input type="text" value="" name="endTime"/><br/>
<input type="hidden" name="page" value="0" />
<input type="submit" value="查询"/>
</form> -->
	<form action="admin/adminLogByTime" method="post">
		<div class="form-group">
			<label for="beginTime">开始时间</label> <input type="text" value=""
				name="beginTime">
		</div>
		<div class="form-group">
			<label for="endTime">结束时间</label> <input type="text" value=""
				name="endTime">
		</div>
		<input type="hidden" name="page" value="0" />
		<button type="submit" class="btn btn-default">查询</button>
	</form>
</div>
<%@include file="footer.jsp"%>
</body>
</html>