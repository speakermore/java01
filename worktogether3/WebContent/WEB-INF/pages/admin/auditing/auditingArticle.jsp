<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class=" col-md-10 col-md-offset-2">
		<div class="sub-header">
			<strong></strong>
		</div>
		<div class="col-md-2">
			<span class="glyphicon glyphicon-star-empty" aria-hidden="true">
			</span>文章标题：
		</div>
		<div class="col-md-10">
			<div class="info_title">${article.articleTitle}</div>
		</div>
		<div class="col-md-2">
			<span class="glyphicon glyphicon-user" aria-hidden="true"> </span>作者信息：
		</div>
		<div class="col-md-10">${article.usersId}&nbsp;${article.userName}</div>
		<div class="col-md-2">
			<span class="glyphicon glyphicon-time" aria-hidden="true"> </span>发布时间：
		</div>
		<div class="col-md-10">
			<div>
				<fmt:formatDate value="${article.articleTime}"
					pattern="yyyy年MM月dd日	HH时mm分ss秒" />
			</div>
		</div>
		<div class="col-md-2">
			<span class="glyphicon glyphicon-asterisk" aria-hidden="true">
			</span>关键字：
		</div>
		<div class="col-md-10">
			<div>${article.articleKey}</div>
		</div>
		<div class="col-md-2">
			<span class="glyphicon glyphicon-check" aria-hidden="true"> </span>审核情况：
		</div>
		<div class="col-md-10">
			<div class="col-md-3" >
				<c:if test="${article.articleStatus==2}">
					<div class="alert alert-success" role="alert">
					<span class="glyphicon glyphicon-ok-circle" aria-hidden="true" ></span>
						&nbsp;通过
					</div>
				</c:if>
				<c:if test="${article.articleStatus==3}">
					<div class="alert alert-danger" role="alert">
					<span class="glyphicon glyphicon-ban-circle" aria-hidden="true" ></span>
						&nbsp;未能通过审核
					</div>
				</c:if>
				<c:if test="${article.articleStatus==1}">
					<div class="alert alert-info" role="alert">
					<span class="glyphicon glyphicon-question-sign" aria-hidden="true" ></span>
						&nbsp;待审核
					</div>
				</c:if>
				<c:if test="${article.articleStatus==4}">
					<div class="alert alert-warning" role="alert">
					<span class="glyphicon glyphicon-remove-circle" aria-hidden="true" ></span>
						&nbsp;文章已删除
					</div>
				</c:if>
			</div>
		</div>
		<div class="col-md-12">
			<span class="glyphicon glyphicon-list-alt" aria-hidden="true">
			</span>正文内容：
		</div>
		<div class="col-md-12">
			<div>${article.articleContent}</div>
		</div>
		<!-- end of content -->
		<div class="col-md-12">&nbsp;</div>
		<div class="col-md-12 col-md-offset-1">
			<div class="col-md-6">
				<a class="btn btn-default" href="admin/auditArticle/${article.id}/2"
					class="btn btn-default"> <span class="glyphicon glyphicon-ok"
					aria-hidden="true"> </span> 通过审核
				</a>
			</div>
			<div class="col-md-6">
				<a href="admin/auditArticle/${article.id}/3" class="btn btn-default">
					<span class="glyphicon glyphicon-remove" aria-hidden="true">
				</span> 不能通过审核
				</a>
			</div>
		</div>
		<!-- end of auditing -->
	</div>
	<!--左侧边栏结束--> <!--右侧边栏--> <!--<div class="col-sm-4" style="border: 1px solid black;">1列</div><!--右侧边栏结束-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> <script
		src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script> <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/admin/bootstrap.min.js"></script> </from>
	<div><%@include file="../footer.jsp"%></div>
</body>
</html>
