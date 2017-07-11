<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="row clearfix">
		<div class="col-md-12 column">
			
			<div class="panel-group" id="myMenu">
				<!-- 牟勇：个人中心 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#myMenu" href="#my_info">个人中心</a>
					</div>
					<div id="my_info" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="nav">
								<li>
									<a href="javascript:ajaxPage('personal/user/personal_index_myNewly')">我的首页</a>
								</li>
								<li>
									<a href="javascript:ajaxPage('personal/user/personal_register_real')">实名认证</a>
								</li>
								<li>
									<a href="javascript:ajaxPage('personal/user/personal_register_other')">完善信息</a>
								</li>
								<li><a href="javascript:ajaxPage('personal/user/personal_index_myResume')">我的简历</a></li>
								<li><a href="javascript:ajaxPage('personal/user/personal_index_myPassword')">修改密码</a>
								</li>
								<li><a href="javascript:ajaxPage('#')">我屏蔽的企业</a>
								</li>
								<li><a href="javascript:ajaxPage('#')">我的额度</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 牟勇：个人中心结束 -->
				
				<!-- 牟勇：我的关注 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#myMenu" href="#my_focus">我的关注</a>
					</div>
					<div id="my_focus" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="nav">
								<li>
									<a href="javascript:ajaxPage('personal/follow/personal_company_followlist')">我关注的公司</a>
								</li>
								<li>
									<a href="#panel-followMeCompany">关注我的公司</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 牟勇：我的关注结束 -->
				<!-- 牟勇：我的应聘 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#myMenu" href="#my_offer">我的应聘</a>
					</div>
					<div id="my_offer" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="nav">
								<li>
									<a href="javascript:ajaxPage('personal/resume/personal_index_mySendResume')">我投过的简历</a>
								</li>
								<li>
									<a href="javascript:ajaxPage('personal/resume/personal_index_myReceiveOffer')">我收到的邀请</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 牟勇：我的应聘结束 -->
				<!-- 牟勇：我的众筹 -->
				<div class="panel panel-default">
					<div class="panel-heading">
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
				</div>
				<!-- 牟勇：我的众筹结束 -->
				<!-- 牟勇：我的创业 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#myMenu" href="#my_idea">我的创业</a>
					</div>
					<div id="my_idea" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="nav">
								<li><a href="#panel-myReleaseStartup">我发布的创业</a></li>
								<li><a href="#panel-myParticipateStartup">我申请的创业</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 牟勇：我的创业结束 -->
				<!-- 牟勇：我的文章 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#myMenu" href="#my_article">我的文章</a>
					</div>
					<div id="my_article" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="nav">
								<li><a href="javascript:ajaxPage('personal/user/personal_index_myArticle')">我发表的文章</a></li>
								<li><a href="#panel-myParticipateStartup">我看过的文章</a></li>
								<li><a href="#panel-myEvaluate">我的评价</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 牟勇：我的文章结束 -->
			</div>
		</div>
	</div>


<script type="text/javascript">
	var ajaxPage = function(page) {
		$.ajax({
			url : "personal/user/ajax",
			data : "page=" + page,
			type : "POST",
			dataType : "html",
			success : function(data) {
				$("#my-content").html(data);
			}
		});
	}
	var deleteRecord = function(page) {
		$.ajax({
			url : "personal/common/deleteRecord",
			data : "toPage=1&page=" + page,
			dataType : "html",
			success : function(data) {
				$("#my-content").html(data);
			}
		});
	}
</script>
