<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>个人用户-首页</title>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
<style type="text/css">
table {
	margin: 20px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<input type="hidden" id="getuserid" value="${user.id }" />
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-1 column"></div>
					<div class="col-md-10 column ">
						<div class="tabbable" id="tabs">
							<!-- 下拉列表开始 -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#panel-one" data-toggle="tab">个人中心</a></li>
								<li><a href="#panel-two" data-toggle="tab">简历中心</a></li>
								<li><a href="#panel-three" data-toggle="tab">文章中心</a></li>
								<li class="dropdown pull-right"><a href="#"
									data-toggle="dropdown" class="dropdown-toggle">管理<strong
										class="caret"></strong></a> <%@include
										file="/WEB-INF/pages/personal/common/selectformanage.jsp"%></li>
							</ul>

							<!-- 下拉列表结束 -->
							<!-- 主要内容开始 -->
							<div class="tab-content">
								<div class="tab-pane active" id="panel-one">
									<div class="col-md-7 column ">
										<%@include
											file="/WEB-INF/pages/personal/user/personal_user.jsp"%>
									</div>
									<div class="col-md-5 column ">
										<%@include
											file="/WEB-INF/pages/personal/common/user_right.jsp"%>
									</div>
								</div>
								<div class="tab-pane" id="panel-two">
									<div class="alert alert-success alert-dismissable">
										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h4>注意!</h4>
										简历写完需要审核通过后才能投递. <a href="personal/user/gotoIndex"
											class="alert-link">点我返回首页</a>|<a
											href="personal/resume/createResume">点我创建新的简历</a>
									</div>
									<%@include
										file="/WEB-INF/pages/personal/user/personal_resume_index.jsp"%>
								</div>
								<div class="tab-pane" id="panel-three">
									<div class="alert alert-success alert-dismissable">
										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h4>注意!</h4>
										文章写完需要审核通过后才能投递. <a href="personal/user/gotoIndex"
											class="alert-link">点我返回首页</a>|<a
											href="personal/article/add_article">点我创建新的文章</a>
									</div>
									<%@include
										file="/WEB-INF/pages/personal/user/personal_article_index.jsp"%>
								</div>
							</div>
							<!-- 主要内容结束 -->
						</div>
					</div>
					<!-- 	<div class="col-md-4 column ">
						
					</div> -->
					<div class="col-md-1 column"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>