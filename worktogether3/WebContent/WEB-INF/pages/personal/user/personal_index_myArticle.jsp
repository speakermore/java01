<%@ page import="ynjh.common.util.CommonStatus" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
	<article class="col-sm-12">
	<div class="jumbotron">
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">×</button>
			<h4>注意!</h4>
			文章写完需要审核通过后才能发表. <a href="personal/user/gotoIndex" class="alert-link">点我返回首页</a>
		</div>
		<c:if test="${articles==null }">
		<h1 style="font-size: 40px;">亲！你还没有文章！</h1>
		</c:if>
			<table class="table table-striped">
				<tr>
					<td>文章类型</td>
					<td>文章标题</td>
					<td>发表时间</td>
					<td>状态</td>
					<td>文章点击数</td>
					<td>文章点赞数</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${articles}" var="art">
				<tr>
					<td>${art.articleType }</td>
					<td>${art.articleTitle }</td>
					<td><fmt:formatDate value="${art.articleTime }"/></td>
					<td>${AUDIT_STATUS[art.articleStatus]}</td>
					<td>${art.articleReadNum }</td>
					<td>${art.articleLikeNum }</td>
					<td><c:if test="${art.articleStatus==4}">
									<a href="javascript:ajaxPage('redirect:personal/article/gotoUpdateArticle?id=${art.id }')">修改</a>|<a
										href="javascript:if(confirm('你确定真的要恢复这篇文章吗？')){location.href='personal/article/renewArticle?id=${art.id }'}">恢复</a>
								</c:if> <c:if
									test="${art.articleStatus==1||art.articleStatus==2||art.articleStatus==3}">
									<a href="javascript:ajaxPage('redirect:personal/article/gotoUpdateArticle?id=${art.id }')">修改</a>|<a
										href="javascript:if(confirm('你确定真的要删除这篇文章吗？')){location.href='personal/article/deleteUserAricle?id=${art.id }'}">删除</a>
								</c:if></td>
				</tr>
				</c:forEach>
			</table>
		<p>
			<a class="btn btn-primary btn-large" href="javascript:ajaxPage('personal/article/personal_addarticle_index')">点我创建新的文章</a>
		</p>
	</div>
	</article>
