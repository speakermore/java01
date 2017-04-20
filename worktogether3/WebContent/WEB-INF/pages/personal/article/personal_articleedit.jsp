<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"  src="ckeditor/ckeditor.js"></script>
<title>修改文章内容</title>
		<link rel="stylesheet" type="text/css" href="css/personal/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/personal/main.css"/>
</head>
<body>
<%@include file="/WEB-INF/pages/personal/common/header.jsp" %>
	<form action="personal/article/updateArticle" method="post">
	标题：<b>${article.articleTitle}</b><br />
	<input type="hidden" name="id" value="${article.id}" />
	<textarea class="ckeditor" name="articleContent" >${article.articleContent}</textarea><br />
	<input class="btn btn-success" type="submit" value="提交修改" />
	</form>
</body>
</html>