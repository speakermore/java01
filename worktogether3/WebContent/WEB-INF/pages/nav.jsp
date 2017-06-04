<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-default navbar-fixed-top"
	role="navigation">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-8 work-together-background">
				<h6 style="color:#888">相.<em><small>取人才</small></em>，职.<em><small>载未来</small></em>，网.<em><small>聚英才</small></em></h6>
			</div>
			<div class="col-sm-4 work-together-background">
			<style>
				h6 a{
					color:#fff;
				}
			</style>
			<h6 class="col-sm-offset-3">
		<!-- 判断是否登录开始 -->
		<c:if test="${user==null }">
			<a href="personal/user/login"
				class="hidden-xs">个人用户入口</a>|
			<a href="company/company/company_login"
				class="hidden-xs">企业用户入口</a>
		</c:if>
		<c:if test="${user!=null }">
			<a href="personal/user/logout"
				class="hidden-xs">退出</a>
		</c:if>
		</h6>
		<!-- 判断是否登录结束 -->
		</div>
		</div>
		<div class="row">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#work_together_nav">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><img style="margin-left:10px" src="img/21495074072_.pic.png" width="28" height="30" /></a>
		</div>
		<div class="collapse navbar-collapse nav-divider"
			id="work_together_nav">
			<ul class="nav navbar-nav work-together-nav">
				<li><a href="#">首页</a></li>
				<li><a href="personal/user/gotoSoft">软件人才</a></li>
				<li><a href="personal/user/gotoCompany">名企招聘</a></li>
				<li><a href="crowdfund/crowdfundAllList?page=1">技术众筹</a></li>
				<li><a href="#">认证培训</a></li>
				<li><a href="#">自主创业</a></li>
				<li><a href="#">咨询服务</a></li>
				<li><a href="#">直播</a></li>
				<li><a href="#">关于我们</a></li>
			</ul>
		</div>
	</div>
	</div>
</nav>

