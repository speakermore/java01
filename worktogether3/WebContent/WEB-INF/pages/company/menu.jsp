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
						<em class="col-sm-7 text-left" id="recruit-status">${RECRUIT_STATUS[user.companyIsRecruit] }</em>
						<c:if test="${user.companyIsRecruit==0 }">
							<span class="col-sm-5 text-right"><a id="i_want_recruit" class="btn btn-sm btn-success" href="javascript:void(0)" onclick="ajaxStatus(this,'companyIsRecruit',1,10,'recruit-status',${user.id})">我要招聘</a></span>
						</c:if>
						<c:if test="${user.companyIsRecruit==1 }">
							<span class="col-sm-5 text-right"><a id="i_want_recruit" class="btn btn-sm btn-charging" href="javascript:void(0)" onclick="ajaxStatus(this,'companyIsRecruit',0,10,'recruit-status',${user.id})">结束招聘</a></span>
						</c:if>
				</p>
				<p class="row">
						<em class="col-sm-7 text-left" id="crowdfund-status" >${CROWDFUND_STATUS[user.userIsCrowdFund] }</em>
						<c:if test="${user.userIsCrowdFund==0 }">
						<span class="col-sm-5 text-right"><a id="i_want_crowdfund" class="btn btn-sm btn-success" href="javascript:void(0)" onclick="ajaxStatus(this,'userIsCrowdFund',1,10,'crowdfund-status',${user.id})">我要众筹</a></span>
						</c:if>
						<c:if test="${user.userIsCrowdFund==1 }">
						<span class="col-sm-5 text-right"><a id="i_want_crowdfund" class="btn btn-sm btn-charging" href="javascript:void(0)" onclick="ajaxStatus(this,'userIsCrowdFund',0,10,'crowdfund-status',${user.id})">结束众筹</a></span>
						</c:if>
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
							<li><a href="javascript:ajaxPage('company/company/company_data_index')">企业信息</a></li>
							<li><a href="javascript:ajaxPage('company/artanddis/company_index')">企业首页</a></li>
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
						<li><a href="javascript:ajaxPage('common/article/common_index_article')">我发表的文章</a></li>
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
						<li><a href="company/cmprs/companyRecruit/add_companyRecruit ">添加招聘信息</a></li>
						<li><a href="company/cmprs/companyRecruit/">招聘信息列表</a></li>
						<li><a href="offer/company_offer_list/1">发送offer</a></li>
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