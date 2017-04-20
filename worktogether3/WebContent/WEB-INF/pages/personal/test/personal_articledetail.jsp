<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${article.articleTitle }</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<script type="text/javascript"  src="thirdpart/ckeditor/ckeditor.js"></script>
</head>
<body>
	
	<h1>${article.articleTitle}</h1>
	<hr />
		${article.articleTitle}
	<div>${article.articleContent}</div>
	<div>
		${article.articleTime}:<a href="">赞</a>:${article.articleLikeNum}:点击:${article.articleReadNum}
	</div>
	<hr />
	<table>
		<c:if test="${commentArticles==null }">
			<jsp:forward
				page="/personal/commentarticle/findcommentarticle?articleId=${article.id }"></jsp:forward>
		</c:if>
		<c:forEach items="${commentArticles }" var="ca">
			<tr>
				<td>${ca.usersId}:</td>
				<td><p>${ca.commentArticleContent}</p></td>
			</tr>
			<tr>
			<td></td>
			<td>${ca.commentArticleTime}/<a href="#">赞</a>：${ca.commentArticleLikeNum }</td>
			</tr>
		</c:forEach>
	</table>
	<hr />
	<form action="personal/commentarticle/addcommentarticle" method="post">
		<%-- <input type="hidden" name="usersId" value="${user.id }"/>
		 --%>
		<input type="hidden" name="articleId" value="${article.id }" />
		<textarea rows="5" cols="5" name="commentArticleContent"
			class="ckeditor"></textarea>
		<input type="submit" value="发表" />
	</form>


	<a href="javascript:history.go(-1)">返回</a>
</body>
</html>