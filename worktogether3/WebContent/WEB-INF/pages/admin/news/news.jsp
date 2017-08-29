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
<meta name="keywords" content="相职网,云南相职网,招聘网,招聘,软件开发,软件人才,软件公司,Java,网络招聘" />
<meta name="keywords" content="最新资讯,${news.newsTitle }">
<meta name="referrer" content="always" />
<meta name="robots" content="noindex,follow" />
<meta name="description" content="相职网-专业提供软件人力资源解决方案"/>
<title>相职网-最新资讯-${news.newsTitle }</title> 

<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
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
					<div class="col-sm-3">
						<!-- 主页个人信息左边 -->
						<%@include file="../../personal/common/user_right.jsp"%>
					</div>
				</c:if>
				<!-- 企业用户从1开始编码，到1234567889截止 -->
				<c:if test="${user.id<1234567890 }">
					<div class="col-sm-3">
						<!-- 主页企业信息左边 -->
						<%@include file="../../company/menu.jsp"%>
					</div>
				</c:if>
			</c:if>
			<div class="col-sm-9">
				<div id="my-content" class="row">
				<div class="row">
					<h3 class="text-center">${news.newsTitle }</h3>
				</div>
				<article class="row">
					<div class="col-sm-offset-2">${news.newsContent}</div>
				</article>
				</div>
			</div>
		</div>
	</div><!-- end of container-fluid -->
	<%@include file="/WEB-INF/pages/copyright.jsp" %>
</body>
</html>