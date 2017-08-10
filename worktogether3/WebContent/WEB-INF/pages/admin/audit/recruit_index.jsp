<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ynjh.common.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>招聘信息审核</title>
<style>
	#comment_result_info{
		display:none;
	}
</style>
<%@include file="../header.jsp"%>
</head>
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
<body>
	<div><%@include file="../menu.jsp"%></div>
	<div class="container">
		<div class="col-sm-offset-1 col-sm-11">
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="panel-title">招聘信息审核列表：</h1>
					</div>
					<div class="panel-body">
						<form id="audit_recruit" action="admin/recruit_audit" method="post">
							<input id="recruitStatus" type="hidden" name="recruitStatus" />
							<input type="hidden" name="toPage" value="redirect:/admin/recruit_find_all/1" />
							<p id="comment_result_info" role="alert" class="alert alert-warning"><i class="glyphicon glyphicon-ok"></i>提交成功！</p>
							<table class="table table-hover table-striped">
								<thead>
								<tr class="">
									<th width="5%"><a id="a_select_all" href="javascript:select_all()">全选</a></th>
									<th width="10%">招聘岗位</th>
									<th width="20%">发布企业</th>
									<th>发布时间</th>
									<th>审核</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${companyRecruits}" var="rec">
								<tr>
									<td><input name="recruitId" type="checkbox" value="${rec.id}" /></td>
									<td>
										<a title="点击查看详细内容" href="admin/find_recruit/${rec.id}">${rec.cmpRecTitle} </a>
									</td>
									<td>${rec.companySimpleName }</td>
									<td>${rec.cmpRecTime}</td>
									<td>${AUDIT_STATUS[rec.cmpRecStatus]}</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
							<div class="col-sm-2 col-sm-offset-1">
								<button class="btn btn-success" onclick="check(2)">
									<span class="glyphicon glyphicon-ok"></span>通过
								</button>
							</div>
							<div class="col-sm-2 col-sm-offset-5">
								<button class="btn btn-default" onclick="check(3)">
									<span class="glyphicon glyphicon-remove"></span>不通过
								</button>
							</div>
						</form>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<div><%@include file="../footer.jsp"%></div>
	<script type="text/javascript">
	//输入审核结果
	var check = function(status){
		$("#recruitStatus").val(status);
		$('#audit_recruit').submit();
	}
	//全选或取消
	var select_all = function() {
		var select = $("#a_select_all");
		if (select.html() == "全选") {
			$("input[type='checkbox']").prop("checked", true);
			select.html("取消");
		} else {
			$("input[type='checkbox']").prop("checked", false);
			select.html("全选");
		}

	};
</script>
</body>

</html>