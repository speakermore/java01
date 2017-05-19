<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${resume!=null }">
	<div class="alert alert-success alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">×</button>
		<h4>注意!</h4>
		简历写完需要审核通过后才能投递. <a href="personal/user/gotoIndex" class="alert-link">点我返回首页</a>
	</div>
	<!-- 简历信息主页 -->
	<%@include
		file="/WEB-INF/pages/personal/resume/personal_lookresume_index.jsp"%>
</c:if>
<c:if test="${resume==null }">
	<div class="jumbotron">
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">×</button>
			<h4>注意!</h4>
			简历写完需要审核通过后才能投递. <a href="personal/user/gotoIndex" class="alert-link">点我返回首页</a>
		</div>
		<h1 style="font-size: 40px;">亲！你还没有简历！</h1>
		<p>
			<a class="btn btn-primary btn-large"
				href="personal/resume/createResume">点我创建新的简历</a>
		</p>
	</div>
</c:if>