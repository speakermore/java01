<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"  src="thirdpart/ckeditor/ckeditor.js"></script>
<title>个人用户-发表文章</title>

</head>
<body>
<form action="personal/article/add_article" method="post">
	标题<input name="articleTitle"/><br />
	关键字<input name="articleKey" /><br />
	内容<textarea class="ckeditor" name="articleContent" rows="10" cols="100" ></textarea>
	<input type="submit" value="发表"/>
</form>
</body>
</html>