<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>个人用户-查看简历</title>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
<%@include file="/WEB-INF/pages/nav.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
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
							file="/WEB-INF/pages/personal/resume/personal_lookresume_index.jsp"%>
					</div>
					<%-- <div class="col-md-4 column ">
						<%@include file="/WEB-INF/pages/personal/common/user_right.jsp"%>
					</div> --%>
					<div class="col-md-1 column"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>