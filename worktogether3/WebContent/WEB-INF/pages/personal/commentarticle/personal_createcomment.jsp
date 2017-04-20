<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="personal/commentarticle/addcommentarticle" method="post">
		<input type="hidden" name="usersId" value="${user.id }"/>
		<input type="hidden" name="articleId" value="${article.id }"/>
		<textarea rows="5" cols="5" name="commentArticleContent" class="ckeditor"></textarea>
		<input type="submit" value="发表"/>
	</form>
</body>
</html>