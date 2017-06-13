<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>热门文章</title>

<%@include file="header.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<div><%@include file="menu.jsp"%></div>
		<div class="col-md-offset-2">
			<div class="row">
				<div class="col-sm-10">
					<div class="row" style="background-color: #FFFFFF;">
						<div class="col-sm-12">
							<section class="panel">
								<div class="panel-body">
									<table class="table table-hover table-striped">
										<c:if test="${personBestArticle==null}">
											<jsp:forward page="/admin/findBestArticle" />
										</c:if>
										<thead>
											<tr>
												<th>排名</th>
												<th>标题</th>
												<th>作者</th>
												<th>提交时间</th>
												<th>阅读量</th>
											</tr>
										</thead>
										<% int number=1; %>
										<c:forEach items="${personBestArticle}" var="article">
											<tr>
												<td><%=number++%></td>
												<td>${article.articleTitle}</td>
												<td>${article.userName}</td>
												<td><fmt:formatDate value="${article.articleTime}"
														pattern="yyyy年MM月dd日" /></td>
												<td>${article.articleReadNum}</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end of container-fluid -->
	<div><%@include file="footer.jsp"%></div>
</body>
</html>