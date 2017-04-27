<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
header {
	height: 300px;
}

.work-together-margin-top-150 {
	margin-top: 150px;
}

.work-together-dev-height-2000 {
	height: auto;
}

.work-together-sample-1 {
	background-color: white;
}

.panel-footer {
	color: #ababab;
}

span.emotion {
	width: 42px;
	height: 20px;
	padding-left: 20px;
	cursor: pointer
}

span.emotion:hover {
	background-position: 2px -28px
}
</style>

<article
	class="col-md-12 work-together-dev-height-2000  work-together-shadow work-together-deep">
	<!--我的信息-->
	<section class="panel">
		<div class="panel-title">我的信息</div>
		<div class="panel-body">
			<div class="col-sm-5 ">
				<img src="personal/img/head.gif" width="80" height="80" title="我的头像" alt="我的头像"/>
			</div>
			<div class="col-sm-7">
				<!--我的信息左边文字-->
				<c:if test="${user!=null }">
					<c:if test="${user.userRealName!='无' }">
						<div class="row">
							<p class="col-md-12">
								<em>姓名：</em>${user.userRealName }
							</p>
						</div>
					</c:if>
					<c:if test="${user.userRealName=='无' }">
						<div class="row">
							<p class="col-md-12">
								请<a href="personal/user/addUserReal">实名认证</a>
							</p>
						</div>
					</c:if>
					<c:if test="${user.userName!='无' }">
						<div class="row">
							<p class="col-md-12">
								<em>昵称：</em>${user.userName }
							</p>
						</div>
					</c:if>
					<c:if test="${user.userName=='无' }">
						<div class="row">
							<p class="col-md-12">
								请<a href="personal/user/addUserOther">完善信息</a>
							</p>
						</div>
					</c:if>
					<c:if test="${resume!=null }">
						<div class="row">
							<p class="col-md-12">
								<em>职位：</em>${resume.resumeJor }
							</p>
						</div>
					</c:if>
					<c:if test="${resume==null }">
						<div class="row">
							<p class="col-md-12">
								请<a href="personal/resume/createResume">创建简历</a>
							</p>
						</div>
					</c:if>
				</c:if>
				<c:if test="${user==null }">
					<div class="row">
						<p class="col-md-12">
							请<a class="hidden-xs btn btn-default navbar-btn navbar-right"
								href="/personal/user/login">登录</a>
						</p>
					</div>
				</c:if>
			</div>
			<!--我的信息左边文字结束-->
			<br/>
			<div class="col-sm-12">
			系统定期替换鸡汤文</div>
		</div>
	</section>
	<!--我的信息结束-->
	<section class="panel">
		<div class="panel-title">手机App下载</div>
		<div class="panel-body">
			<img src="" width="100" height="100" alt="Android下载" /> <img src=""
				width="100" height="100" alt="iOS下载" />
		</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位1</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位2</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位3</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位4</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位5</div>
	</section>
	<section class="panel">
		<div class="panel-title">职业档案人气</div>
		<div class="panel-body">
			<p>
				你的职位在7天内被访问了<a href="#">0</a>次
			</p>
			<canvas id="myChart" width="230" height="160"
				style="border: 1px solid black;"></canvas>
		</div>
	</section>
</article>
