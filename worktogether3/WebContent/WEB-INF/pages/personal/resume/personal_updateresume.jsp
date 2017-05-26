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
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="col-md-1 column"></div>
				<div class="col-md-10 column ">
					<div class="alert alert-success alert-dismissable">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">×</button>
						<h4>注意!</h4>
						简历写完需要审核通过后才能投递. <a href="personal/user/gotoIndex"
							class="alert-link">返回首页</a>
					</div>
					<%@include
						file="/WEB-INF/pages/personal/resume/personal_updateresume_index.jsp"%>
				</div>
				<div class="col-md-1 column"></div>
			</div>
		</div>
	</div>
</body>
</html>