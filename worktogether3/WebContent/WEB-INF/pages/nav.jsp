<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<li><a href="personal/user/gotoSoft">软件人才</a></li>
				<li><a href="personal/user/gotoCompany">名企招聘</a></li>
				<li><a href="#">技术众筹</a></li>
				<li><a href="#">认证培训</a></li>
				<li><a href="#">自主创业</a></li>
				<li><a href="#">关于我们</a></li>
			</ul>
		</div>
		<!-- 判断是否登录开始 -->
		<c:if test="${user==null }">
			<a href="personal/user/login"
				class="hidden-xs btn btn-default navbar-btn navbar-right">个人登录</a>
				<a href="company/company/"
				class="hidden-xs btn btn-default navbar-btn navbar-right">企业登录</a>
				<a href="personal/user/addUser"
			class="hidden-xs btn btn-default navbar-btn navbar-right">个人注册</a>
			<a href="company/company/add"
			class="hidden-xs btn btn-default navbar-btn navbar-right">企业注册</a>
		</c:if>
		<c:if test="${user!=null }">
			<a href="personal/user/logout"
				class="hidden-xs btn btn-default navbar-btn navbar-right">退出</a>
			<a id="modal-charge" href="#modal-container-charge" role="button"
				class="btn hidden-xs btn btn-default navbar-btn navbar-right"
				data-toggle="modal">充值</a>
			<%-- <a href="personal/user/chargeById?id=${user.id }" --%>
		</c:if>
		
		<!-- 判断是否登录结束 -->
		<!-- <form class="navbar-form navbar-right hidden-xs" role="search">
			<div class="form-group hidden-xs">
				<input class="form-control" name="search" placeholder="软件工程师"
					type="search" />
			</div>
			<button class="btn btn-default">搜索</button>
		</form> -->
	</div>
</nav>
<div class="modal fade" id="modal-container-charge" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="personal/user/chargeMoney" class="form-horizontal"
				method="post">
				<input type="hidden" name="id" value="${user.id }" /><br />
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">充值</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="col-md-3 control-label">用户名：</label>
						<div class="col-md-8">
						<c:if test="${user.id<1234567891 }">
						 <p class="form-control-static">${user.companySimpleName }</p>
						</c:if>
						<c:if test="${user.id>=1234567891 }">
						 <p class="form-control-static">${user.userName }</p>
						</c:if> 
						</div>
					</div>
					<div class="form-group">
						<label for="userMoney" class="col-md-3 control-label">充值金额：</label>
						<div class="col-md-8">
							<input class="form-control" name="userMoney" id="userMoney" />
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-success">保存</button>
				</div>
			</form>
		</div>
	</div>
</div>
