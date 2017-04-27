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
<title>管理员后台-简历审核</title>

<div><%@include file="header.jsp"%></div>
</head>
<body>
	<div class="container-fluid">
		<div><%@include file="menu.jsp"%></div>
		<div class="col-md-offset-2">
			<div class="row">
				<div class="col-sm-10">
					<div class="row" style="background-color: #FFFFFF;">
						<div class="col-sm-12">
							<h1>待审核简历:</h1>
							<section class="panel">
								<div class="panel-body">
									<table class="table table-hover table-striped">
										<c:if test="${resume==null}">
											<jsp:forward page="/admin/findAuditResume/1" />
										</c:if>
										<thead>
											<tr>
												<th>用户id</th>
												<th>简历标题</th>
												<th>用户姓名</th>
												<th>用户性别</th>
												<th>创建时间</th>
												<th>状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<c:set var="genders" value="${CommonStatus.SEX }"></c:set>
										<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
										<c:forEach items="${resume}" var="res">
											<tr>
												<td>${res.userId}</td>
												<td><a title="点击查看详情"
													href="admin/findAuditResumeById?id=${res.id}">${res.resumeTitle}
												</a></td>
												<td>${res.resumeName}</td>
												<td>${genders[res.resumeGender]}</td>
												<td><fmt:formatDate value="${res.resumeCreateDate}"
														pattern="yyyy年MM月dd日" /></td>
												<td>${AUDIT_STATUS[res.resumeStatusThree] }</td>
												<td><a title="点击查看详情"
													href="admin/findAuditResumeById?id=${res.id}">详情</a></td>
											</tr>
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
	</div>
	<!-- end of container-fluid -->
	<div><%@include file="footer.jsp"%></div>
</body>
</html>
