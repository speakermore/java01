<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>用户前台-发表文章</title>
</head>
<body>
	<%@include file="/WEB-INF/pages/personal/common/header.jsp" %>
   <form role="form" class="form-horizontal" action="personal/article/add_article" method="post">
		<div class="form-group">
			<label for="userLoginId" class="col-sm-2 control-label">文章标题：</label>
			<div class="col-sm-5">
				<input class="form-control" name="articleTitle"/>
			</div>
		</div>
		<div class="form-group">
			<label for="userPassword" class="col-sm-2 control-label">关键字：</label>
			<div class="col-sm-5">
				<input class="form-control" name="articleKey" />
			</div>
		</div>
		<div class="form-group">
			<label for="userPassword" class="col-sm-2 control-label">文章内容：</label>
			<div class="col-sm-5">
				<textarea class="form-control ckeditor" name="articleContent" ></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5">
				<input class="btn btn-success" type="submit" value="发表" />
			</div>
		</div>
		
	</form>
  </body>
</html>