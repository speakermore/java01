<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.CommonStatus" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 牟勇：菜单重制 -->
<div class="row">
	<div class="col-sm-12">
		<article class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">${user.companySimpleName }</h3>
			</div>
			<div class="panel-body">
				<div class="col-sm-12">
					<a class="thumbnail">
					<img id="headPhoto" class="img-thumbnail" onerror="javascript:this.src='img/head.gif'" src="company/img/${user.companyLoginId }/${user.companyLogo}" title="${user.companySimpleName }" alt="${user.companySimpleName }" />
					</a>
				</div>
				<p class="text-center">${user.companyName }</p>
				<c:set var="RECRUIT_STATUS" value="${CommonStatus.COMPANY_RECRUIT_STATUS }"></c:set>
				<c:set var="CROWDFUND_STATUS" value="${CommonStatus.USER_CROWDFUND_STATUS }"></c:set>
				<c:set var="PARTNER_STATUS" value="${CommonStatus.USER_PARTNER_STATUS }"></c:set>
				
				<p class="row">
						<em class="col-sm-12 text-center ${user.companyIsRecruit==0?"alert alert-info":"alert alert-warning"}" id="recruit-status">${RECRUIT_STATUS[user.companyIsRecruit] }</em>
				</p>
				<p class="row">
						<em class="col-sm-12 text-center ${user.userIsCrowdFund==0?"alert alert-info":"alert alert-warning"}" id="crowdfund-status" >${CROWDFUND_STATUS[user.userIsCrowdFund] }</em>
				</p>
			</div>
		</article>
		<article class="panel-group" id="my-menu">
			<!-- 企业中心 -->
			<section class="panel panel-default">
				<div class="panel-heading">
					 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#my-menu" href="#my-center">企业中心</a>
				</div>
				<div id="my-center" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="nav">
							<li><a href="javascript:ajaxPage('company/artanddis/company_index')">企业首页</a></li>
							<li><a href="javascript:ajaxPage('company/company/company_data_index')">企业信息</a></li>
							<li><a href="javascript:ajaxPage('company/charge/company_charge')">企业余额</a></li>
						</ul>
					</div>
				</div>
			</section>
			<!-- 企业中心结束 -->
			<!-- 文章管理 -->
			<section class="panel panel-default">
				<div class="panel-heading">
					 <a class="panel-title" data-toggle="collapse" data-parent="#my-menu" href="#my-news">文章管理</a>
				</div>
				<div id="my-news" class="panel-collapse collapse">
					<div class="panel-body">
					<ul class="nav">
						<li><a href="javascript:ajaxPage('common/article/common_index_article')">我的文章列表</a></li>
					</ul>
					</div>
				</div>
			</section>
			<!-- 文章管理结束 -->
			<!-- 招聘管理 -->
			<section class="panel panel-default">
				<div class="panel-heading">
					 <a class="panel-title" data-toggle="collapse" data-parent="#my-menu" href="#my-recruit">招聘管理</a>
				</div>
				<div id="my-recruit" class="panel-collapse collapse">
					<div class="panel-body">
					<ul class="nav">
						<li><a href="javascript:ajaxPage('company/cmprs/recruit_add')">我要招聘</a></li>
						<li><a href="javascript:ajaxPage('redirect:company/cmprs/find_all/1')">我的招聘列表</a></li>
					</ul>
					</div>
				</div>
			</section>
			<!-- 招聘管理结束 -->
			<!-- 牟勇：我的众筹 -->
				<section class="panel panel-default">
					<div id="my-crowdfund" class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#myMenu" href="#my_rowdfund">我的众筹</a>
					</div>
					<div id="my_rowdfund" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="nav">
								<li>
									<a href="javascript:ajaxPage('crowdfund/mySendCrowdfund_index')">我发布的众筹</a>
								</li>
								<li>
									<a href="javascript:ajaxPage('crowdfund/myJoinCrowdfund_index')">我申请的众筹</a>
								</li>
							</ul>
						</div>
					</div>
				</section>
				<!-- 牟勇：我的众筹结束 -->
		</article>
	</div>
</div>