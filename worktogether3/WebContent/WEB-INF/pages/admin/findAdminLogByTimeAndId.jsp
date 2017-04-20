<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- <form action="findAdminLogByTimeAndId" method="post">
操作人ID<input type="text" value="" name="userLoginId"/><br/>
开始时间<input type="text" value="" name="beginTime"/><br/>
结束时间<input type="text" value="" name="endTime"/><br/>
<input type="hidden" name="page" value="0" />
<input type="submit" value="查询"/>
</form> -->
<form action="findAdminLogByTimeAndId" method="post">
		<div class="form-group">
			<label for="beginTime">开始时间</label> <input type="text" value=""
				name="beginTime">
		</div>
		<div class="form-group">
			<label for="endTime">结束时间</label> <input type="text" value=""
				name="endTime">
		</div>
		<div class="form-group">
			<label for="userLoginId">操作人ID</label> <input type="text" value=""
				name="userLoginId">
		</div>
		<input type="hidden" name="page" value="0" />
		<button type="submit" class="btn btn-default">查询</button>
	</form>
</body>
</html>