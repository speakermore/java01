<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改文章内容</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<script type="text/javascript"  src="thirdpart/ckeditor/ckeditor.js"></script>
</head>
<body>
	<form action="personal/article/updateArticle" method="post">
	<b>标题：<input name="articleTitle" value="${article.articleTitle }" /></b><br />
	<input type="hidden" name="id" value="${article.id}" />
	关键字<input name="articleKey" value="${article.articleKey }" /><br />
	<textarea class="ckeditor" name="articleContent" >${article.articleContent}</textarea><br />
	<input type="submit" value="提交修改" />
	</form>
</body>
</html>