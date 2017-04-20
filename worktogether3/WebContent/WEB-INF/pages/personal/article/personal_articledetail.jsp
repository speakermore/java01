<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>查看文章</title>
</head>
<body>
	<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
	<div class="main">
		<div class="col-md-12 column">
			<h3 align=center>${article.articleTitle}</h3>
			<div align=center>${article.articleTime}</div>
		</div>
		<p align=center>${article.articleContent}</p>
		<div>
			<hr />
		</div>
		<div class="hrr">
			<a href="personal/article/updateLike/${article.id }">赞:${article.articleLikeNum}</a>
			<div class="ppp">点击数：${article.articleReadNum}</div>
		</div>
	</div>

	<div class="comm-add clearfix">
		<div class="ava"></div>
		<textarea class="_textarea" name="Write your text..."
			placeholder="Write your text..."></textarea>
		<button class="_button">发表评论</button>
	</div>
</body>
</html>
