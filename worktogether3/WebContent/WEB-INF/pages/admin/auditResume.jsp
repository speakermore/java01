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
			<div class="col-sm-10" style="border: 1px solid black">
				<div class="row" style="background-color: #CCCCCC;">
					<div class="col-sm-12">
						
						  <h1>待审核简历:</h1>
						<section class="panel">
							<heading class="panel-heading"> 
							<c:if test="${resume==null}">
								<jsp:forward page="/admin/findAuditResume/1"/>
							</c:if>
							<c:forEach items="${resume}" var="res">
								<ul class="clean">
									<tr>
										<li><a href="admin/findAuditResumeById?id=${res.id}">
												${res.resumeTitle} </a></li>
									</tr>
								</ul>
							</c:forEach>
							<tr>
								<td colspan="5"><c:if test="${curPage==null }">
										<c:set var="curPage" value="1"></c:set>
									</c:if><a href="admin/findAuditResume/1">首页</a> <c:if test="${curPage>1 }">

										<a href="admin/findAuditResume/${curPage-1 }">上一页</a>
									</c:if> <c:if test="${curPage<maxPage}">
										<a href="admin/findAuditResume${curPage+1 }">下一页</a>

									</c:if><a href="admin/findAuditResume/${maxPage }">尾页</a></td>
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
