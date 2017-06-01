<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ynjh.common.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>OFFER审核</title>
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
	<div class="col-md-offset-2">
		<div class="container">
			<div class="col-sm-11">
				<div class="row" style="background-color: #FFF;">
					<div class="col-sm-12">
						<h1>OFFER信息：</h1>
						<div class="panel-body">
							<form id="audit_offer" action="admin/auditOffer" onsubmit="return false" method="post">
								<input id="offerStatus" type="hidden"
							name="offerStatus" />
							<p id="comment_result_info" role="alert" class="alert alert-warning"><i class="glyphicon glyphicon-ok"></i>提交成功！</p>
								<table class="table table-hover table-striped">
									<c:if test="${auditOffer==null}">
										<jsp:forward page="/admin/findAuditOffer/1" />
									</c:if>
									<thead>
										<tr>
											<th><a id="a_select_all" href="javascript:select_all()">全选</a></th>
											<th>招聘公司</th>
											<th>岗位</th>
											<th>应聘人</th>
											<th>发送时间</th>
											<th>审核状态</th>
										</tr>
									</thead>
									<c:forEach items="${auditOffer}" var="offer">
										<ul class="clean">
											<tr>
												<td><input name="id" type="checkbox" value="${offer.id}" /></td>
												<td><a title="点击查看详细内容"
													href="#/${offer.id}">
														${offer.companyName} </a></td>
												<td>${offer.offerJob}</td>
												<td>${offer.userRealName}</td>
												<td>${offer.offerSendTime}</td>
												<td>${AUDIT_STATUS[offer.offerStatus]}</td>
											</tr>
										</ul>
									</c:forEach>
								</table>
								<div class="col-sm-2 col-sm-offset-1">
									<button class="btn btn-default" onclick="check(2)">
										<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>通过
									</button>
								</div>
								<div class="col-sm-2 col-sm-offset-5">
									<button class="btn btn-default" onclick="check(3)">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>不通过
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
</body>
<script type="text/javascript">
	//输入审核结果
	var check = function(status){
		$("#offerStatus").val(status);
		submitAuditRecruit();
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
	//完成对审核状态的服务器端调用及客户端对状态描述字段的修改
	var submitAuditRecruit=function(){
		var offerStatus=$("#offerStatus").val();
		$.ajax({
			type:"POST",
			url:"admin/auditRecruitment",
			data:$("#audit_offer").serialize(),
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
							if(offerStatus==2){
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