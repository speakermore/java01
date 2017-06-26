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
		h3{
			font-size:21px;
			margin-bottom:10px;
		}
	</style>
</head>
<body>
	<c:if test="${admin==null }">
		<%@include file="../../nav.jsp"%>
	</c:if>
	<c:if test="${admin!=null }">
		<%@include file="../menu.jsp"%>
	</c:if>
	<div class="container">
		<div class="row">
			<h3 class="text-center">${news.newsTitle }</h3>
		</div>
		<article class="row">
			<div class="col-md-offset-2">
				${news.newsContent}
			</div>
		</article>
	</div>
	
	<script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js"> </script>
	<script type="text/javascript" src="thirdpart/ckeditor/config.js"></script>
	<script type="text/javascript" src="thirdpart/ckeditor/adapters/jquery.js"></script>
	<!-- end of container-fluid -->
</body>
</html>