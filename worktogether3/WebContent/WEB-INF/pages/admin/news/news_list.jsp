<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page autoFlush="true" buffer="1024kb"%>

<!-- 牟勇：资讯显示列表 -->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员后台-资讯列表</title>

<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
h3 {
	font-size: 21px;
	margin-bottom: 10px;
}
/* 因为左侧被菜单挡住，所以左侧留空 */
.container {
	margin-left: 120px;
}
</style>
</head>
<body>

	<%@include file="../menu.jsp"%>
	<div class="container">
		<section class="panel">
			<div class="panel-title">
				<h3>资讯列表|（<a href="admin/news/add">添加新闻资讯</a>）</h3>
			</div>
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>资讯标题</th>
						<th>发表人</th>
						<th>发表时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${newses}" var="news" varStatus="status">

						<tr>
							<td>
								<c:if test="${news.adminId==admin.id }">
									<a title="点击可以进行编辑" href="admin/news/update/${news.id }">${news.newsTitle}</a>
								</c:if>
								<c:if test="${news.adminId!=admin.id }">
									${news.newsTitle}
								</c:if>
							</td>
							<td>${news.adminName}</td>
							<td>${news.newsDate}</td>
							<c:set value="${CommonStatus.NEWS_STATUS}" var="NEWS_STATUS"></c:set>
							<td>${NEWS_STATUS[news.newsStatus]}</td>
							<td>
								<c:if test="${news.newsStatus!=10 }">
									<a title="置顶" href="admin/news/stick/${news.id}">置顶</a>
								</c:if>
								<c:if test="${news.newsStatus==10 }">
									<a title="取消置顶" href="admin/news/unstick/${news.id}">取消置顶</a>
								</c:if>
								<c:if test="${news.newsStatus!=2 }">
									<a title="禁用" href="admin/news/stop/${news.id}">禁用</a>
								</c:if> 
								<c:if test="${news.newsStatus==2 }">
									<a title="启用" href="admin/news/normal/${news.id}">启用</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</div>
	<%@include file="../footer.jsp"%>
	<script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js"> </script>
	<script type="text/javascript" src="thirdpart/ckeditor/config.js"></script>
	<script type="text/javascript"
		src="thirdpart/ckeditor/adapters/jquery.js"></script>

	<script type="text/javascript">
	    $(document).ready(function(){  
	    		CKEDITOR.replace('newsContent',{
	    		    filebrowserImageUploadUrl: '../../ckeditor/upload?Type=Images'
	    		}); 
	    });
    </script>
	<!-- end of container-fluid -->
</body>
</html>