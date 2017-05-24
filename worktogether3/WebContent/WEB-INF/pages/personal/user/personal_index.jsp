<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
<title>个人用户-首页</title>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<input type="hidden" id="getuserid" value="${user.id }" />
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-1 column"></div>
			<div class="col-md-10 column ">
				<div class="col-md-4 column ">
					<!-- 主页个人信息左边 -->
					<%@include file="/WEB-INF/pages/personal/common/user_right.jsp"%>
				</div>
				<div class="col-md-8 column ">
					<!-- 主页个人信息右边 -->
					<%@include file="/WEB-INF/pages/personal/user/personal_user.jsp"%>
				</div>
			</div>
			<div class="col-md-1 column"></div>
		</div>
	</div>
</body>
</html>