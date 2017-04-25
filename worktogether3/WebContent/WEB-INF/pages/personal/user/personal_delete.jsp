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
								<li class="active"><a href="#panel-one" data-toggle="tab">删除的教育记录</a></li>
								<li><a href="#panel-two" data-toggle="tab">删除的工作经历</a></li>
								<li><a href="#panel-three" data-toggle="tab">删除的项目经历</a></li>
								<li class="dropdown pull-right"><a href="#"
									data-toggle="dropdown" class="dropdown-toggle">管理<strong
										class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href="#">修改个人密码</a></li>
										<li><a href="personal/user/findById?id=${user.id }">修改个人资料</a></li>
										<li><a href="personal/user/addUserReal">完善资料</a></li>
										<li><a href="personal/user/addUserOther">实名认证</a></li>
										<li><a href="#">查看个人信息</a></li>
										<li><a href="personal/resume/createResume">新建简历</a></li>
										<li><a href="personal/common/deleteRecord?userId=${user.id }">查看删除记录</a></li>
									</ul></li>
							</ul>
							<!-- 下拉列表结束 -->
							<!-- 主要内容开始 -->
							<div class="tab-content">
								<div class="tab-pane active" id="panel-one">
									<%@include file="/WEB-INF/pages/personal/user/personal_articledel_index.jsp"%>
								</div>
								<div class="tab-pane" id="panel-two">
									<%@include file="/WEB-INF/pages/personal/user/personal_articledel_index.jsp"%>
								</div>
								<div class="tab-pane" id="panel-three">
									<%@include file="/WEB-INF/pages/personal/user/personal_articledel_index.jsp"%>
								</div>
							</div>
							<!-- 主要内容结束 -->
						</div>
					</div>
					<div class="col-md-1 column"></div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>