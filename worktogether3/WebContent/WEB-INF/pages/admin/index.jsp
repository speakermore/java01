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
<title>管理员后台</title>

<%@include file="header.jsp"%>
</head>
<body>

	<div><%@include file="menu.jsp"%></div>
	<div class="container">
		<!-- 首页主体内容 -->
		<div class="row">
			<div class="col-sm-offset-1">
				<div class="row">
					<!-- 待审核简历 -->
					<div class="col-sm-12">
						<section class="panel">
							<blockquote>最新待审核简历:</blockquote>
							<c:if test="${resumeList5==null}">
								<jsp:forward page="/indexResume" />
							</c:if>
							<table class="table table-hover table-striped">
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
								<tbody>
									<!-- 加入显示数组 -->
									<c:set var="genders" value="${CommonStatus.SEX }"></c:set>
									<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
									<c:set var="USER_TYPE" value="${CommonStatus.USER_TYPE }"></c:set>
									<c:forEach items="${resumeList5}" var="res" varStatus="status">

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
								</tbody>
							</table>
							<div class="col-md-offset-11">
								<a href="admin/findAuditResume/0">更多...</a>
							</div>
						</section>
					</div>
				</div>
				<!-- 待审核简历结束 -->
				<div class="row">
					<!-- 待审核文章 -->
					<div class="col-sm-12">
						<section class="panel">
							<blockquote>最新待审核文章:</blockquote>
							<c:if test="${articleList5==null}">
								<jsp:forward page="/indexArticle" />
							</c:if>
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>文章标题</th>
										<th>作者id</th>
										<th>作者姓名</th>
										<th>作者类型</th>
										<th>创建时间</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${articleList5}" var="arti">

										<tr>
											<td><a title="点击查看详情"
												href="admin/findAuditArticleById?id=${arti.id}">${arti.articleTitle}
											</a></td>
											<td>${arti.usersId}</td>
											<c:if test="${arti.articleUsersType==2 }">
												<td>${arti.userName}</td>
											</c:if>
											<c:if test="${arti.articleUsersType==1 }">
												<td>${arti.companyName}</td>
											</c:if>
											<td>${USER_TYPE[arti.articleUsersType]}</td>
											<td><fmt:formatDate value="${arti.articleTime}"
													pattern="yyyy年MM月dd日" /></td>
											<td>${AUDIT_STATUS[arti.articleStatus] }</td>
											<td><a title="点击查看详情"
												href="admin/findAuditResumeById?id=${arti.id}">详情</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-offset-11">
								<a href="admin/findAuditResume/0">更多...</a>
							</div>
						</section>
					</div>
				</div>
				<!-- 待审核文章结束 -->
				<div class="row">
					<!-- 待审核用户评价 -->
					<div class="col-sm-12">
						<blockquote>最新待审核用户评价:</blockquote>
						<section class="panel">
							<c:if test="${discussList5==null}">
								<jsp:forward page="/indexDiscuss" />
							</c:if>
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>评论者</th>
										<th>被评论者</th>
										<th>内容</th>
										<th>星级</th>
										<th>评论时间</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${discussList5}" var="disc"
										varStatus="status">

										<tr>
											<td>${disc.discussUserName}</td>
											<c:if test="${disc.discussUsersType==2 }">
												<td>${disc.userName}</td>
											</c:if>
											<c:if test="${disc.discussUsersType==1 }">
												<td>${disc.companyName}</td>
											</c:if>
											<td>${disc.discussContent}</td>
											<td>${disc.discussLevel}</td>
											<td><fmt:formatDate value="${disc.discussTime}"
													pattern="yyyy年MM月dd日" /></td>
											<td>${AUDIT_STATUS[disc.discussStatus]}</td>
										</tr>

									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-offset-11">
								<a href="admin/findAuditResume/0">更多...</a>
							</div>
						</section>
					</div>
				</div>
				<!-- 待审核用户评价 -->
			</div>
			<!-- 首页主体内容结束 -->
		</div>
		<div><%@include file="footer.jsp"%></div>
	</div>
	<!-- end of container-fluid -->
</body>
</html>