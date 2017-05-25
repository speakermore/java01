<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<article
	class="col-md-12 work-together-dev-height-2000  work-together-shadow work-together-deep">
	<!--我的信息-->
	<section class="panel">
		<form class="form-horizontal" action="personal/article/updateArticle"
			method="post">
			<div class="form-group">
				<label for="userLoginId" class="col-md-3 control-label">文章标题：</label>
				<div class="col-md-8">
					<input class="form-control" name="articleTitle"
						value="${article.articleTitle}" />
				</div>
			</div>
			<input type="hidden" name="id" value="${article.id}" />
			<div class="form-group">
				<label for="userPassword" class="col-md-3 control-label">文章内容：</label>
				<div class="col-md-8">
					<textarea class="form-control ckeditor" name="articleContent">${article.articleContent}</textarea>
					<br />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-9 col-md-8">
					<input class="btn btn-success" type="submit" value="提交修改" />
				</div>
			</div>
		</form>
	</section>
</article>

