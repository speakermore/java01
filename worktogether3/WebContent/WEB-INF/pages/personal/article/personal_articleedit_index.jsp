<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article class="col-md-12 work-together-dev-height-2000  work-together-shadow work-together-deep">
	<!--我的信息-->
	<section class="panel">
	<form action="personal/article/updateArticle" method="post">
	标题：<b>${article.articleTitle}</b><br />
	<input type="hidden" name="id" value="${article.id}" />
	<textarea class="ckeditor" name="articleContent" >${article.articleContent}</textarea><br />
	<input class="btn btn-success" type="submit" value="提交修改" />
	</form>
	</section>
</article>

