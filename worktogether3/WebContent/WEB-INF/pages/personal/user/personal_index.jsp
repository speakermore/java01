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
				<div class="col-sm-3">
					<!-- 主页个人信息左边 -->
					<%@include file="/WEB-INF/pages/personal/common/user_right.jsp"%>
				</div>
				<div class="col-sm-9">
					<!-- 主页个人信息右边 -->
					<%@include file="/WEB-INF/pages/personal/user/personal_user.jsp"%>
				</div>
		</div>
	</div>
	<%@include file="/WEB-INF/pages/copyright.jsp" %>
</body>
</html>