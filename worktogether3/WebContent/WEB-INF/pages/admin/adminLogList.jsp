<%@page import="ynjh.admin.entity.AdminLog"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员简历审核</title>
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="thirdpart/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

<script
	src="thirdpart/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script
	src="thirdpart/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Bootstrap -->
<%@include file="../admin/header.jsp"%>
</head>
<body>
	<div><%@include file="../admin/menu.jsp"%></div>
	<div class="col-sm-offset-1">
	<a style="font-weight: bold; font-size: 25px;">管理员访问操作记录表:</a>
	<form action="admin/adminLog" method="post">
		<div class="col-sm-2">
			<label for="beginTime">开始时间</label> <input size="16" type="text" id="datetimeStart" readonly
			class="form_datetime" name="beginTime">
		</div>
		<div class="col-sm-2">
			<label for="endTime">结束时间</label> <input size="16" type="text"
			id="datetimeEnd" readonly class="form_datetime" name="endTime">
		</div>
		
		<div class="col-sm-2 form-group">
			<label for="adminDo">操作类型</label> 
			<select name="adminDo"  class="form-control">
				<option value="0">全部操作类型</option>
				<option value="1" selected="selected">审核操作</option>
				<option value="2">禁用用户</option>
				<option value="3">密码重置</option>
				<option value="4">信息维护</option>
				<option value="5">登录 退出</option> 
			</select>
		</div>
		<div class="col-sm-2">
			<label for="userLoginId">操作人ID</label> <input type="number" value=""
				name="userLoginId">
		</div>
		<input type="hidden" name="page" value="0" />
		<button type="submit" class="btn btn-primary btn-lg">查询</button>
		
	</form>
	
	<table class="table table-striped">

		<thead>
			<tr>
				<th>操作对象id</th>
				<th>操作类型</th>
				<th>操作人id</th>
				<th>操作对象类型</th>
				<th>时间</th>
			</tr>
		</thead>
		<tbody>
			<%
				List<AdminLog> newsList = (List<AdminLog>) request.getAttribute("adminLogs");
				if (newsList != null) {
					int i = 0;
					for (AdminLog adm : newsList) {
						i++;
			%>
			<tr <%if (i % 2 == 0) {%> class="admin-list-td-h2" <%}%>>
				<td><%=adm.getAdminAid()%></td>
				<td><%=adm.getAdminDo()%></td>
				<td><%=adm.getAdminLoginId()%></td>
				<td><%=adm.getAdminTargetType()%></td>
				<td><%=adm.getAdminTime()%></td>

				<%
					}
					}
				%>
			
		</tbody>
	</table>
	<script type="text/javascript">
		 $('.date').datetimepicker({
		 language: 'zh-CN',//显示中文
		 format: 'yyyy-mm-dd',//显示格式
		 minView: "month",//设置只显示到月份
		 initialDate: new Date(),//初始化当前日期
		 autoclose: true,//选中自动关闭
		 todayBtn: true//显示今日按钮
		 }) 

		$("#datetimeStart").datetimepicker({
			format : 'yyyy-mm-dd hh:ii:ss',
			language : 'zh-CN',
			autoclose : true,
			todayHighlight:true
			
		}).on(
				"click",
				function() {
					$("#datetimeStart").datetimepicker("setEndDate",
							$("#datetimeEnd").val())
				});

		$("#datetimeEnd").datetimepicker({
			format : 'yyyy-mm-dd hh:ii:ss',
			language : 'zh-CN',
			autoclose : true,
			todayHighlight:true
		}).on(
				"click",
				function() {
					$("#datetimeEnd").datetimepicker("setStartDate",
							$("#datetimeStart".val()))
				});
	</script>
	<div><%@include file="../admin/footer.jsp"%></div>
</body>
</html>