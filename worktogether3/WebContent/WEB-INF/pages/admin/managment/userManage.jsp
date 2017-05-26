<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ynjh.common.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<!-- Bootstrap -->
<%@include file="../header.jsp"%>
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<script type="text/jscript" src="admin/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="admin/js/bootstrap.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
/*查询用户表单样式效果*/
.wide-row {
	margin: 15px;
}
/*进入页面隐藏提示框*/
#mag_result_info {
	display: none;
}

</style>
</head>
<body>
	<%@include file="../menu.jsp"%>
	<c:set var="USER_STATUS" value="${CommonStatus.USER_STATUS}"></c:set>
	<div class="container">
			<div class="col-sm-11">
				<div class="row" style="background-color: #FFFFFF;">
					<div class="wide-row">
						<form class="form-inline" action="admin/findUserByLoginId" method="post">
							<div class="form-group">
								<label for="input-loginId">查询用户</label>
								<input type="text" name="userLoginId" class="form-control" id="input-loginId" placeholder="请输入要查找的登录账号"/>
							</div>
							<button type="submit" class="btn btn-default">查询</button>
							<span style="color:red;">${resultInfo}</span>
						</form>
					</div>
					<form id="user_list" action="admin/personalMag" onsubmit="return false" method="post">
						<input id="userStatus" type="hidden"
							name="userStatus" />
						<div class="col-sm-12">
							<p id="mag_result_info" role="alert" class="alert alert-warning"><i class="glyphicon glyphicon-ok"></i>提交成功！</p>
							<table class="table table-hover table-striped">
								<c:if test="${users==null }">
									<jsp:forward page="/admin/userMag" />
								</c:if>
								<thead>
									<tr>
										<th><a id="a_select_all" href="javascript:select_all()">全选</a></th>
										<th>账号</th>
										<th>昵称</th>
										<th>账号状态</th>
									</tr>
								</thead>
								<c:forEach items="${users}" var="user">
									<tr>
										<td><input name="id" type="checkbox"
											value="${user.id}" /></td>
										<td>
												${user.userLoginId}</td>
										<td>${user.userName}</td>
										<td <c:if test="${user.userStatus==2}">style="color:red;"</c:if> >${USER_STATUS[user.userStatus]}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="col-sm-2 col-sm-offset-1"><button class="btn btn-default" onclick="check(2)"><span class="glyphicon glyphicon-ban-circle" aria-hidden="true" ></span>禁用</button></div>
						<div class="col-sm-2 col-sm-offset-5"><button class="btn btn-default" onclick="check(1)"><span class="glyphicon glyphicon-ok" aria-hidden="true" ></span>解除禁用</button></div>
					</form>
				</div>
			</div>
		</div>
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
	//禁用或解禁用户
	//status:用户状态：1代表可正常使用，2代表已被禁用
	var check = function(status) {
		$("#userStatus").val(status);
		submitUserMag();
	};
	
	//jaxa方法，完成对服务器端调用及客户端对状态描述字段的修改
	var submitUserMag=function(){
		var userStatus=$("#userStatus").val();
		$.ajax({
			type:"POST",
			url:"admin/personalMag",
			data:$("#user_list").serialize(),
			dataType:"json",
			success:function(data){
				//默认样式
				$("#mag_result_info").css("display","none");
				$("#mag_result_info").removeClass();
				$("#mag_result_info").addClass("alert alert-warning");
				$("#mag_result_info").html("<i class=\"glyphicon glyphicon-ok\"></i>提交成功！");
				if(data){//提交成功
					$("#mag_result_info").slideDown(1000);
				
					//更改提交状态
					var inputData=$("input[type='checkbox']");
					for(var i=0;i<inputData.length;i++){
						if(inputData[i].checked==true){
							if(userStatus==2){
								$($("input[type='checkbox']")[i].parentNode.parentNode).children().last().css("color","red");
								$($("input[type='checkbox']")[i].parentNode.parentNode).children().last().html("禁用");
							}else{
								$($("input[type='checkbox']")[i].parentNode.parentNode).children().last().css("color","black");
								$($("input[type='checkbox']")[i].parentNode.parentNode).children().last().html("正常");
							}
							
						}
					}
				}else{//提交失败
					//失败样式
					$("#mag_result_info").removeClass();
					$("#mag_result_info").addClass("alert alert-danger");
					$("#mag_result_info").html("<i class=\"glyphicon glyphicon-remove\"></i>提交失败或未勾选用户！");
					$("#mag_result_info").slideDown(1000);
				}
			}
		});
	}
</script>
<%@include file="../footer.jsp"%>
</html>