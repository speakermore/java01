<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="tabbable" id="tabs">
	<!-- 下拉列表开始 -->
	<ul class="nav nav-tabs">
		<li class="active"><a href="#panel-one" data-toggle="tab">删除的教育记录</a></li>
		<li><a href="#panel-two" data-toggle="tab">删除的工作经历</a></li>
		<li><a href="#panel-three" data-toggle="tab">删除的项目经历</a></li>
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