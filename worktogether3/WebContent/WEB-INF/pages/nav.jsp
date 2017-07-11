<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
h5 a {
	color: #fff;
}
</style>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 work-together-background">
				<h5 style="color: #fff; float: left;">
					相职网&nbsp;&nbsp;<em><small>专业提供软件人力资源解决方案</small></em>
				</h5>
				<!-- 判断是否登录开始 -->
				<h5 class="col-xs-offset-9"></h5>
				<!-- 判断是否登录结束 -->
			</div>
		</div>
		<div class="row">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#work_together_nav">
					<span class="sr-only">切换导航</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img style="margin-left: 10px"
					src="img/21495074072_.pic.png" width="28" height="30" /></a>
			</div>
			<div class="collapse navbar-collapse nav-divider"
				id="work_together_nav">
				<ul class="nav navbar-nav work-together-nav">
					<li><a href="#">首页</a></li>
					<li><a href="personal/user/gotoSoft">软件人才</a></li>
					<li><a href="personal/user/gotoCompany">名企招聘</a></li>
					<li><a href="crowdfund/crowdfundAllList?page=1">技术众筹</a></li>
					<li><a href="#">认证培训</a></li>
					<li><a href="#">合伙创业</a></li>
					<li><a href="#">咨询服务</a></li>
					<li><a href="#">直播</a></li>
					<li><a href="#">关于我们</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right work-together-nav">
					<c:if test="${user==null }">
						<li><a href="personal/user/login" class="hidden-xs">个人用户入口</a></li>
						<li><a href="company/company/company_login" class="hidden-xs">企业用户入口</a></li>
					</c:if>
					<c:if test="${user!=null }">
						<c:if test="${user.id>=1234567890 }">
							<li><a href="personal/common/initIndex?toPage=1&userId=${user.id }">个人中心</a></li>
						</c:if>
						<c:if test="${user.id<1234567890 }">
							<li><a href="company/company/findById/${user.id }">企业中心</a></li>
						</c:if>
						<li><a href="personal/user/logout" class="hidden-xs">退出</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</nav>

