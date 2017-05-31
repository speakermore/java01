<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${personal_article_list!=null }">
	<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">×</button>
		<h4>注意!</h4>
	文章写完需要审核通过后才能发表. <a href="personal/user/gotoIndex" class="alert-link">点我返回首页</a>
	</div>
	<!-- 文章信息主页 -->
	<%@include file="/WEB-INF/pages/personal/user/personal_article_index.jsp"%>
</c:if>
<c:if test="${personal_article_list==null }">
	<div class="jumbotron">
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">×</button>
			<h4>注意!</h4>
			文章写完需要审核通过后才能发表. <a href="personal/user/gotoIndex" class="alert-link">点我返回首页</a>
		</div>
		<h1 style="font-size: 40px;">亲！你还没有文章！</h1>
		<p>
			<a class="btn btn-primary btn-large"
				href="personal/article/add_article">点我创建新的文章</a>
		</p>
	</div>
</c:if>
