<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>公司资质审核</title>

<!-- Bootstrap -->
<div><%@include file="../header.jsp"%></div>
</head>
<body>
	<div><%@include file="../menu.jsp"%></div>
	<div class="col-sm-offset-2">
		<div class="contianer">
			<div class="page-header">
				<h1>${auditComIntro.companyName}<small>${auditComIntro.companySimpleName}</small></h1>
			</div>
		</div><!-- end of contianer -->
	</div>
	<div><%@include file="../footer.jsp" %></div>
</body>
</html>					