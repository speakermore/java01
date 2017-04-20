<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员简历审核</title>

<!-- Bootstrap -->
<div><%@include file="../header.jsp"%></div>
</head>
<body>
	<div><%@include file="../menu.jsp"%></div>
	
	<from action="findAuditArticle">
	<div class="col-sm-7 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <h2 class="sub-header">文章内容</h2>
          <div class="table-responsive">
            <table class="table table-striped">
                <ul>
					<li>文章标题：${article.articleTitle}</li>
					<li>点赞数：${article.articleLikeNum}</li>
					<li>阅读量：${article.articleReadNum}</li>
					<li>发布时间：${article.articleTime}</li>
					<li>信息状态：${article.articleStatus}</li>
					<li>关键字：${article.articleKey}</li>
					<li>文章内容：${article.articleContent}</li>
					<li>用户状态：${article.articleUsersType}</li>
					<div class="">
						<a class="col-sm-offset-1" href="admin/auditarticle?articleStatus=2&id=${article.id}&toPage=../auditingArticle"></a>
						<input  class="btn btn-warning"  type="submit" value="通过审核" />
						<a  class="col-sm-offset-2" href="admin/auditarticle?articleStatus=3&id=${article.id}&toPage=../auditingArticle" ></a>
						<input  class="btn btn-warning"  type="submit" value="拒绝审核" />
					</div>
				</ul>
            </table>
          </div>
        </div>
		<!--左侧边栏结束-->


		<!--右侧边栏-->
		<!--<div class="col-sm-4" style="border: 1px solid black;">1列</div><!--右侧边栏结束-->

	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> <script
		src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script> <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/admin/bootstrap.min.js"></script> </from>
	<div><%@include file="../footer.jsp" %></div>
</body>
</html>					