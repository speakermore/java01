<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<body>
	<c:if test="${user==null }">
		${loginInfo }<br />
		<a href="personal/user/login">登录</a>
		<a href="personal/user/addUser">注册</a>

	</c:if>
	<c:if test="${user!=null }">
		<%
			int a = 1;
		%>
		${loginInfo }<br />
		欢迎${user.userName }光临		
		<a href="personal/user/logout">退出</a>
		<a href="personal/user/findById?id=${user.id }">修改</a>
		<a href="personal/user/chargeById?id=${user.id }">充值</a>
		<a href="personal/resume/createResume">写简历</a>
		<a href="personal/article/add_article">写文章</a>
	
	<table>
		<tr>
			<td>简历标题</td>
			<td>创建日期</td>
			<td>操作</td>
		</tr>
		<c:if test="${resumes==null}">
			<jsp:forward page="/personal/resume/findAllResume?userId=${user.id }"></jsp:forward>
		</c:if>
		<c:forEach items="${resumes }" var="resume">
			<tr>
				<td><a href="personal/resume/lookResume?id=${resume.id }">${resume.resumeTitle }</a></td>
				<td>${resume.resumeCreateDate}</td>
				<td><a href="personal/resume/updateResume?id=${resume.id }">修改</a>|<a
						href="javascript:if(confirm('你确定真的要删除吗？')){location.href='personal/resume/deleteResume?id=${resume.id }'}">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	<hr/>
	被删除的简历：
	<table>
		<tr>
			<td>简历标题</td>
			<td>创建日期</td>
			<td>操作</td>
		</tr>
		<c:if test="${resumeBD==null}">
			<jsp:forward page="/personal/resume/findResumeByDelete?userId=${user.id }"></jsp:forward>
		</c:if>
		<c:forEach items="${resumeBD }" var="resume">
			<tr>
				<td><a href="personal/resume/lookResume?id=${resume.id }">${resume.resumeTitle }</a></td>
				<td>${resume.resumeCreateDate}</td>
				<td><a href="javascript:if(confirm('你确定真的要恢复被删的简历吗？')){location.href='personal/resume/renewResume?id=${resume.id }'}">恢复</a></td>
			</tr>
		</c:forEach>
	</table>
	<hr/>
	<table>
		<tr>
			<td>文章标题</td>
			<td>创建日期</td>
			<td>操作</td>
		</tr>
		<c:if test="${articles==null}">
			<jsp:forward page="/personal/article/lookArticleList?usersId=${user.id }"></jsp:forward>
		</c:if>
		<c:forEach items="${articles }" var="art">
			<tr>
				<td><a href="personal/article/lookArticleById?id=${art.id }">${art.articleTitle }</a></td>
				<td>${art.articleTime}</td>
				<td><a href="personal/article/gotoUpdateArticle?id=${art.id }">修改</a>|<a href="javascript:if(confirm('你确定真的要恢复被删的简历吗？')){location.href='personal/article/deleteUserAricle?id=${art.id }'}">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	<hr/>
	被删除的文章：
	<table>
		<tr>
			<td>文章标题</td>
			<td>创建日期</td>
			<td>操作</td>
		</tr>
		<c:if test="${articleBD==null}">
			<jsp:forward page="/personal/article/findArticleByDelete?usersId=${user.id }"></jsp:forward>
		</c:if>
		<c:forEach items="${articleBD }" var="art">
			<tr>
				<td><a href="personal/article/lookArticleById?id=${art.id }">${art.articleTitle }</a></td>
				<td>${art.articleTime}</td>
				<td><a href="javascript:if(confirm('你确定真的要恢复被删的文章吗？')){location.href='personal/article/renewArticle?id=${art.id }'}">恢复</a></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
</body>
</html>