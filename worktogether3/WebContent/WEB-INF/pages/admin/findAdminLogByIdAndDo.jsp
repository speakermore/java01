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
<!-- <form action="findAdminLogByIdAndDo" method="post">
管理员id<input type="text" value="" name="userLoginId"/><br/>
操作类型<input type="text" value="" name="adminDo"/><br/>
<input type="hidden" name="page" value="0" />
<input type="submit" value="查询"/>
</form> -->
<form action="admin/findAdminLogByIdAndDo" method="post">
		<div class="form-group">
			<label for="userLoginId">管理员id</label> <input type="text" value=""
				name="userLoginId">
		</div>
		<div class="form-group">
			<label for="adminDo">操作类型</label> <input type="text" value=""
				name="adminDo">
		</div>
		<input type="hidden" name="page" value="0" />
		<button type="submit" class="btn btn-default">查询</button>
	</form>


</body>
</html>