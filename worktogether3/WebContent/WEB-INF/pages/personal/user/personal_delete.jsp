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
										class="caret"></strong></a> <%@include
										file="/WEB-INF/pages/personal/common/selectformanage.jsp"%></li>
							</ul>
							<!-- 下拉列表结束 -->
							<div class="alert alert-success alert-dismissable">
										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h4>注意!</h4>
										恢复后的教育记录、工作经历和项目记录需要重新审核. <a href="personal/user/gotoIndex"
											class="alert-link">点我返回首页</a>
							</div>
							<!-- 主要内容开始 -->
							<div class="tab-content">
								<div class="tab-pane active" id="panel-one">
									<%@include
										file="/WEB-INF/pages/personal/user/personal_education_index.jsp"%>
								</div>
								<div class="tab-pane" id="panel-two">
									<%@include
										file="/WEB-INF/pages/personal/user/personal_work_index.jsp"%>
								</div>
								<div class="tab-pane" id="panel-three">
									<%@include
										file="/WEB-INF/pages/personal/user/personal_project_index.jsp"%>
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