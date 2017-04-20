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
<title>管理员后台-简历审核</title>

<div><%@include file="header.jsp"%></div>
</head>
<body>
	<div><%@include file="menu.jsp"%></div>
	<div class="col-md-offset-4">
		<div class="row">
			<div class="col-sm-11" style="border: 1px solid black">
				<div class="row" style="background-color: #CCCCCC;">
					<div class="col-sm-12">
						待审核文章：
						<section class="panel">
							<heading class="panel-heading">
							<c:if test="${article==null}">
								<jsp:forward page="/admin/findAuditArticle/page"/>
							</c:if>
							 <c:forEach items="${article}" var="art">
								<ul class="clean">
									<tr>
										<td><a href="admin/findAuditArticleById?id=${art.id }">
												${art.articleTitle} </a></td>
									</tr>

								</ul>
							</c:forEach>
							<tr>
								<td colspan="5"><c:if test="${curPage==null }">
										<c:set var="curPage" value="1"></c:set>
									</c:if><a href="admin/findAuditArticle/1">首页</a> <c:if test="${curPage>1 }">

										<a href="admin/findAuditArticle/${curPage-1 }">上一页</a>
									</c:if> <c:if test="${curPage<maxPage}">
										<a href="admin/findAuditArticle${curPage+1 }">下一页</a>

									</c:if><a href="admin/findAuditArticle/${maxPage }">尾页</a></td>
							</tr>
							</heading>
						</section>
					</div>

				</div>
			</div>
		</div>
	</div>






	<div><%@include file="footer.jsp"%></div>
</body>
</html>
