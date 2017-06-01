<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>个人用户-查看简历</title>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-1"></div>
			<div class="col-md-10 column">
				<%@include file="/WEB-INF/pages/personal/resume/personal_lookresume_index.jsp"%>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>