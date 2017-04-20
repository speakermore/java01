<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/personal/common/guidepackage.jsp"%>
<nav class="navbar navbar-default navbar-fixed-top work-together-background"
	role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#work_together_nav">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><img
				src="img/2fb750d9ad54ad751d401a7a33ac465.jpg" width="28" height="30" /></a>
		</div>
		<div class="collapse navbar-collapse navbar-left"
			id="work_together_nav">
			<ul class="nav navbar-nav">
				<li class="active"><a href="personal/user/gotoIndex">首页</a></li>
				<li><a href="#">软件人才</a></li>
				<li><a href="#">名企招聘</a></li>
				<li><a href="#">技术众筹</a></li>
				<li><a href="#">认证培训</a></li>
				<li><a href="#">自主创业</a></li>
				<li><a href="#">关于我们</a></li>
			</ul>
		</div>
		<c:if test="${user==null }">
			${loginInfo }<br />
			<button type="button"
				class="hidden-xs btn btn-default navbar-btn navbar-right">
				<a href="personal/user/login">登录</a>
			</button>
		</c:if>
		<c:if test="${user!=null }">
			<button type="button"
				class="hidden-xs btn btn-default navbar-btn navbar-right">
				<a href="personal/user/logout">退出</a>
			</button>
			<button type="button"
				class="hidden-xs btn btn-default navbar-btn navbar-right">
				<a href="personal/user/chargeById?id=${user.id }">充值</a>
			</button>
		</c:if>
		<form class="navbar-form navbar-right hidden-xs" role="search">
			<div class="form-group hidden-xs">
				<input class="form-control" name="search" placeholder="软件工程师"
					type="search" />
			</div>
			<button class="btn btn-default">搜索</button>
		</form>
	</div>
</nav>

