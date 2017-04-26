<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.*"
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
<title>管理员后台</title>

<%@include file="header.jsp"%>
</head>
<body>
	<div class="container-fluid">
	<div><%@include file="menu.jsp"%></div>
	<div class="col-md-offset-2">
		<div class="row">
			<div class="col-sm-10">
				<div class="row" style="background-color:#FCFCFC ;">
					<div class="col-sm-12">						
							<section class="panel">
							<blockquote>待审核简历:</blockquote>
							<c:if test="${resumeList5==null}">
								<jsp:forward page="/indexResume"/>
							</c:if>
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										
										<th>用户id</th>
										<th>简历标题</th>
										<th>用户姓名</th>
										<th>用户性别</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<!-- 加入显示数组 -->
									<c:set var="genders" value="${CommonStatus.SEX }"></c:set>
									<c:forEach items="${resumeList5}" var="res" varStatus="status">
										
											<tr>
												<td>${res.userId}</td>
												<td><a title="点击查看详情" href="admin/findAuditResumeById?id=${res.id}">${res.resumeTitle} </a></td>
												<td>${res.resumeName}</td>
												<td>${genders[res.resumeGender]}</td>
												<td><fmt:formatDate value="${res.resumeCreateDate}" pattern="yyyy年MM月dd日"/></td>
												<td><a title="点击查看详情" href="admin/findAuditResumeById?id=${res.id}">详情</a></td>
											</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-offset-11"><a href="admin/findAuditResume/0">更多...</a></div>
						</section>
					</div>
					<div class="col-sm-12">						
						  
							<section class="panel">
							<blockquote>待审核文章:</blockquote>
							<c:if test="${articleList5==null}">
								<jsp:forward page="/indexArticle"/>
							</c:if>
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>文章标题</th>
										<th>作者</th>
										<th>作者类型</th>
										<th>关键字</th>
										<th>创建时间</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${articleList5}" var="arti" varStatus="status">
										
											<tr >
												<td><a href="admin/findAuditArticleById?id=${arti.id}">${arti.articleTitle} </a></td>
												<td>${arti.usersId}</td>
												<td>${arti.articleUsersType}</td>
												<td>${arti.articleKey}</td>
												<td><fmt:formatDate value="${arti.articleTime}" pattern="yyyy年MM月dd日"/></td>
											</tr>
										
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-offset-11"><a href="admin/findAuditResume/0">更多...</a></div>
						</section>
					<div class="col-sm-12">						
						  <blockquote>待审核评论:</blockquote>
							<section class="panel">
							<c:if test="${discussList5==null}">
								<jsp:forward page="/indexDiscuss"/>
							</c:if>
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>被评论人</th>
										<th>内容</th>
										<th>评论人</th>
										<th>星级</th>
										<th>评论时间</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${discussList5}" var="disc" varStatus="status">
										
											<tr>
												<td><a href="admin/findAuditResumeById?id=${disc.id}">${disc.discussUsersType} </a></td>
												<td>${disc.discussContent}</td>
												<td>${disc.discussUsersId}</td>
												<td>${disc.discussLevel}</td>
												<td><fmt:formatDate value="${disc.discussTime}" pattern="yyyy年MM月dd日"/></td>
											</tr>
										
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-offset-11"><a href="admin/findAuditResume/0">更多...</a></div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div><%@include file="footer.jsp"%></div>
	</div><!-- end of container-fluid -->
</body>
</html>