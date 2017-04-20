<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js"> </script>
    <title>${art.articleTitle }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet" />
	<link href="css/lrtk.css" rel="stylesheet" type="text/css" />
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
  	<%@include file="/WEB-INF/pages/nav.jsp" %>
	<div class="container">
		<div class="col-sm-9 column wt-hby-left">
			<div class="row clearfix">
				<div class="col-sm-12 column">
					<div class="row clearfix">
						<div class="col-sm-11 column">
							<h2>${art.articleTitle }</h2>
							<br />
							<div class="wt-hby-artdetail">
								${art.articleContent }
							</div>
						</div>
					</div>
					<br />
					<table class="table">
						<tr>
							<th>发布时间：${art.articleTime }</th>
   							<th><a href="company/artanddis/article/like/${art.id }">赞</a>：${art.articleLikeNum }</th>
   							<th>阅读量：${art.articleReadNum }</th>
						</tr>
					</table>
					<br />
					<table class="table wt-hby-article">
						<thead>
							<tr>
								<th>评论内容</th>
   								<th>评论时间</th>
   								<th>点赞</th>
   								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${comments==null }">
   								<jsp:forward page="company/artanddis/comment/findcomment/1"></jsp:forward>
   							</c:if>
   							<c:forEach items="${comments }" var="comment">
	   							<tr>
			   						<td>${comment.commentArticleContent }</td>
			   						<td>${comment.commentArticleTime }</td>
			   						<td><a href="company/artanddis/comment/likecomment/${comment.id}">赞</a>：${comment.commentArticleLikeNum }</td>
			   						<c:if test="${comment.usersId==user.id }">
			   							<td><a href="company/artanddis/comment/deletecomment/${comment.id}">删除</a></td>
			   						</c:if>
	   							</tr>
   							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<c:if test="${userId==user.id }">
				<form action="company/artanddis/comment/add_companycomment" method="post">
			    	<textarea class="ckeditor" name="discussContent" rows="10" cols="100"></textarea><br />
			    	<input type="submit" value="评论文章" class="btn btn-warning" />
			    	<div class=" col-sm-9 column"></div>
   				</form>
			</c:if>
   			<div>
   				<div class=" col-sm-5 column"></div>
   				<a href="#" class="cd-top">返回顶部</a>
   			</div>
		</div>
		<div class="col-sm-2 column wt-hby-right">
			此处为广告广告广告
			广告未招租
		</div>
	</div>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/lrtk.js"></script> 
  </body>

</html>
