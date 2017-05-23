<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="alert alert-success alert-dismissable">
	<button type="button" class="close" data-dismiss="alert"
		aria-hidden="true">×</button>
	<h4>注意!</h4>
	文章写完需要审核通过后才能投递. <a href="personal/user/gotoIndex" class="alert-link">点我返回首页</a>|<a
		href="personal/article/add_article">点我创建新的文章</a>
</div>
<!-- 文章信息主页 -->
<%@include file="/WEB-INF/pages/personal/user/personal_article_index.jsp"%>