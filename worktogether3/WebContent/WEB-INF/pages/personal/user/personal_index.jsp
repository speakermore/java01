<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>个人用户-首页</title>
</head>
<body>
	<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-1 column"></div>
					<div class="col-md-6 column ">
						<div class="tabbable" id="tabs">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#panel-one" data-toggle="tab">个人中心</a></li>
								<li><a href="#panel-two" data-toggle="tab">简历中心</a></li>
								<li><a href="#panel-three" data-toggle="tab">文章中心</a></li>
								<li class="dropdown pull-right"><a href="#"
									data-toggle="dropdown" class="dropdown-toggle">管理<strong
										class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href="#">修改个人密码</a></li>
										<li><a href="personal/user/findById?id=${user.id }">修改个人资料</a></li>
										<li><a href="#">完善资料</a></li>
										<li><a href="#">实名认证</a></li>
										<li><a href="#">查看个人信息</a></li>
										<li><a href="personal/resume/createResume">新建简历</a></li>
										<li><a href="#panel-element-two ">教育记录</a></li>
										<li><a href="#panel-element-three ">工作经历</a></li>
										<li><a href="#panel-element-four ">项目经历</a></li>
									</ul></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="panel-one">
									<p>
										<%@include
											file="/WEB-INF/pages/personal/user/personal_user.jsp"%>
									</p>
								</div>
								<div class="tab-pane" id="panel-two">
									<p>
									<div class="alert alert-success alert-dismissable">
										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h4>注意!</h4>
										简历写完需要审核通过后才能投递. <a href="personal/user/gotoIndex"
											class="alert-link">点我返回首页</a>|<a href="personal/resume/createResume">点我创建新的简历</a>
									</div>
									<%@include file="/WEB-INF/pages/personal/user/personal_resume_index.jsp"%>
									</p>

								</div>
								<div class="tab-pane" id="panel-three">
									<p><div class="alert alert-success alert-dismissable">
										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h4>注意!</h4>
										文章写完需要审核通过后才能投递. <a href="personal/user/gotoIndex"
											class="alert-link">点我返回首页</a>|<a href="personal/article/add_article">点我创建新的文章</a>
									</div>
									<%@include file="/WEB-INF/pages/personal/user/personal_article_index.jsp"%>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 column ">
						<%@include file="/WEB-INF/pages/personal/common/user_right.jsp"%>
					</div>
					<div class="col-md-1 column"></div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>