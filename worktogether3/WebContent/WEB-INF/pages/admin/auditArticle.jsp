<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员后台-简历审核</title>
<%@include file="header.jsp"%>
</head>
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
<body>
	<%@include file="menu.jsp"%>
	<div class="col-md-offset-2">
		<div class="row">
			<div class="col-sm-11">
				<div class="row" style="background-color: #FFF;">
					<div class="col-sm-12">
						<h1>文章列表:</h1>
						<section class="panel">
							<div class="panel-body">
								<table class="table table-hover table-striped">
									<c:if test="${article==null}">
										<jsp:forward page="/admin/findAuditArticle/0" />
									</c:if>
									<thead>
										<tr>
											<th>文章标题</th>
											<th>关键字</th>
											<th>作者账号</th>
											<th>作者昵称</th>
											<th>创建时间</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<c:forEach items="${article}" var="art">
										<ul class="clean">
											<tr>
												<td><a title="点击查看内容" href="admin/findAuditArticleById?id=${art.id }">
														${art.articleTitle} </a></td>
												<td>${art.articleKey}</td>
												<td>${art.usersId}</td>
												<td>${art.userName}</td>
												<td>${art.articleTime}</td>
												<td>${AUDIT_STATUS[art.articleStatus]}</td>
												<td><a title="点击查看详情"
													href="admin/findAuditArticleById?id=${art.id}">详情</a></td>
											</tr>
										</ul>
									</c:forEach>
								</table>
							</div>
							<p>
								<c:if test="${curPage==null }">
									<c:set var="curPage" value="1"></c:set>
								</c:if>
								<a href="admin/findAuditResume/1">首页</a>
								<c:if test="${curPage>1 }">
									<a href="admin/findAuditResume/${curPage-1 }">上一页</a>
								</c:if>
								<c:if test="${curPage<maxPage}">
									<a href="admin/findAuditResume${curPage+1 }">下一页</a>
								</c:if>
								<a href="admin/findAuditResume/${maxPage }">尾页</a>
							</p>
						</section>
					</div>

				</div>
			</div>
		</div>
	</div>






	<div><%@include file="footer.jsp"%></div>
</body>
</html>
