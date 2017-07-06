<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page autoFlush="true" buffer="1024kb"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员后台-添加资讯</title>

<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
h3 {
	font-size: 21px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<!-- 如果不是管理员在登录，则显示前端的导航菜单 -->
	<c:if test="${admin==null }">
		<div><%@include file="../../nav.jsp"%></div>
	</c:if>
	<!-- 如果管理员已经登录了，加载工作菜单 -->
	<c:if test="${admin!=null }">
		<%@include file="../menu.jsp"%>
	</c:if>
	<div class="container">
		<div class="row">
			<!-- 如果用户已经登录，则加载左侧的工具栏 -->
			<c:if test="${user!=null }">
				<!-- 个人用户id从1234567890开始编码 -->
				<c:if test="${user.id>=1234567890 }">
					<div class="col-md-4 column ">
						<!-- 主页个人信息左边 -->
						<%@include file="../../personal/common/user_right.jsp"%>
					</div>
				</c:if>
				<!-- 企业用户从1开始编码，到1234567889截止 -->
				<c:if test="${user.id<1234567890 }">
					<div class="col-md-4 column ">
						<!-- 主页企业信息左边 -->
						<%@include file="../../company/menu.jsp"%>
					</div>
				</c:if>
			</c:if>
			<div class="col-md-8">
				<div class="row">
					<h3 class="text-center">${news.newsTitle }</h3>
				</div>
				<article class="row">
					<div class="col-md-offset-2">${news.newsContent}</div>
				</article>
			</div>
		</div>
	</div><!-- end of container-fluid -->

	<script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js"> </script>
	<script type="text/javascript" src="thirdpart/ckeditor/config.js"></script>
	<script type="text/javascript"
		src="thirdpart/ckeditor/adapters/jquery.js"></script>
	<%@include file="../footer.jsp"%>
</body>
</html>