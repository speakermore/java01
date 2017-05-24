<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ynjh.common.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>审核个人企业互评</title>
<%@include file="../header.jsp"%>
<style>
	#comment_result_info{
		display:none;
	}
</style>
</head>
<body>
	<%@include file="../menu.jsp"%>
	<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
	<div class="col-sm-offset-2">
		<div class="container">
			<div class="col-sm-11">
				<div class="row" style="background-color: #FFFFFF;">
					<form id="audit_discuss" action="admin/auditDiscuss" onsubmit="return false" method="post">
						<input id="discussStatus" type="hidden"
							name="discussStatus" />
						<div class="col-sm-12">
							审核个人企业互评：
							<p id="comment_result_info" role="alert" class="alert alert-warning"><i class="glyphicon glyphicon-ok"></i>提交成功！</p>
							<table class="table table-hover table-striped">
								<c:if test="${discuss==null }">
									<jsp:forward page="/admin/findAuditCommentsCompanyAndPeople/1" />
								</c:if>
								<thead>
									<tr>
										<th><a id="a_select_all" href="javascript:select_all()">全选</a></th>
										<th>评论内容</th>
										<th>评论时间</th>
										<th>审核</th>
									</tr>
								</thead>
								<c:forEach items="${discuss}" var="dis">
									<tr>
										<td><input name="id" type="checkbox"
											value="${dis.id}" /></td>
										<td>
												${dis.discussContent}</td>
										<td>${dis.discussTime}</td>
										<td>${AUDIT_STATUS[dis.discussStatus]}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="col-sm-2 col-sm-offset-1"><button class="btn btn-default" onclick="check(2)"><span class="glyphicon glyphicon-ok" aria-hidden="true" ></span>通过</button></div>
						<div class="col-sm-2 col-sm-offset-5"><button class="btn btn-default" onclick="check(3)"><span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>不通过</button></div>
					</form>
				</div>
			</div>
		</div>
		<!-- end of container -->
	</div>
	<%@include file="../footer.jsp"%>
	<script type="text/javascript"
		src="thirdpart/dist/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript"
		src="thirdpart/dist/js/language/zh_CN.js"></script>
</body>
<script type="text/javascript">

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
	//审核通过或不通过
	//status:传入审核状态：2代表通过审核，3代表审核不通过
	var check = function(status) {
		$("#discussStatus").val(status);
		submitAuditDiscuss();
	};
	
	//jaxa方法，完成对审核状态的服务器端调用及客户端对状态描述字段的修改
	var submitAuditDiscuss=function(){
		var commentStatus=$("#discussStatus").val();
		$.ajax({
			type:"POST",
			url:"admin/auditCommentsCompanyAndPeople",
			data:$("#audit_discuss").serialize(),
			dataType:"json",
			success:function(data){
				//默认样式
				$("#comment_result_info").css("display","none");
				$("#comment_result_info").removeClass();
				$("#comment_result_info").addClass("alert alert-warning");
				$("#comment_result_info").html("<i class=\"glyphicon glyphicon-ok\"></i>提交成功！");
				if(data){//提交成功
					$("#comment_result_info").slideDown(1000);
				
					//更改提交状态
					var inputData=$("input[type='checkbox']");
					for(var i=0;i<inputData.length;i++){
						if(inputData[i].checked==true){
							if(commentStatus==2){
								$($("input[type='checkbox']")[i].parentNode.parentNode).children().last().html("审核通过");
							}else{
								$($("input[type='checkbox']")[i].parentNode.parentNode).children().last().html("审核不通过");
							}
							
						}
					}
				}else{//提交失败
					//失败样式
					$("#comment_result_info").removeClass();
					$("#comment_result_info").addClass("alert alert-danger");
					$("#comment_result_info").html("<i class=\"glyphicon glyphicon-remove\"></i>提交失败或未勾选评论！");
					$("#comment_result_info").slideDown(1000);
				}
			}
		});
	}
</script>
</html>