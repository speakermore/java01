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

	<%@include file="../menu.jsp"%>
	<div class="container">
		<h3 class="col-md-offset-2">请修改资讯信息|（<a href="admin/news/find_all">返回资讯列表</a>）</h3>
		<form id="add-admin" role="form" class="form-horizontal"
			action="admin/news/update" method="post">
			<input type="hidden" value="${news.id }" name="id" />
			<div class="form-group">
				<label for="newsTitle" class="col-sm-2 control-label">资讯标题：</label>
				<div class="col-sm-8">
					<input id="userName" class="form-control" value="${news.newsTitle }" name="newsTitle"/>
				</div>
			</div>
			<div class="form-group">
				<label for="newsContent" class="col-sm-2 control-label">资讯内容：</label>
				<div class="col-sm-8">
						<textarea class="form-control"  name="newsContent" rows="15" cols="100">${news.newsContent}</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<a href="admin/news/find_all" class="btn btn-primary">返回资讯列表</a>
				</div>
				<div class="col-sm-5">
					<input class="btn btn-success" type="submit" value="提交修改" />
				</div>
			</div>
		</form>
	</div>
	<%@include file="../footer.jsp"%>
	<script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js"> </script>
	<script type="text/javascript" src="thirdpart/ckeditor/config.js"></script>
	<script type="text/javascript" src="thirdpart/ckeditor/adapters/jquery.js"></script>
	
	<script type="text/javascript">
	    $(document).ready(function(){  
	    		CKEDITOR.replace('newsContent',{
	    		    filebrowserImageUploadUrl: '../../../ckeditor/upload?Type=Images'
	    		}); 
	    });
    </script>
	<!-- end of container-fluid -->
</body>
</html>