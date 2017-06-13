<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
   		<meta http-equiv="X-UA-Compatible" content="IE=edge">
   		<meta name="viewport" content="width=device-width, initial-scale=1">
   		<title>管理员登录</title>
   		<%@include file="loginheader.jsp" %>
   	
</head>
<body>
<div class="container login" style="width: 970px!important;">

	<div class="rom">
		<div class="col-xs-8 login-box">
			<h4>用户登录</h4>
			<form class="form-horizontal" action="admin/adminlogin" method="post" role="form">
				<div class="form-group">
					<label for="login-name" class="col-xs-2 control-label">登录名称</label>
					<div class="col-xs-7">
						<input type="text" name="adminLoginId" class="form-control " value="${adminLoginId}" placeholder="登录名称">
						<label class="control-label helplable" for="login-name">注册时填写的名称或者电子邮件</label>
					</div>
				</div>
				<div class="form-group">
					<label for="login-pass" class="col-xs-2 control-label">登录密码</label>
					<div class="col-xs-7">
						<input type="password" name="adminPassword" class="form-control" placeholder="登录密码">
						<label class="control-label helplable" for="login-pass">注册时填写的名称<!-- <a href="admin/forgetpwd">点此找回</a> --></label>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputFile" class="col-xs-2 control-label">验证码</label>
					<img id="validateCode" alt="validateCode " src="admin/codeValidate?time=<%=new Date().getTime()%>" />
					<a href="javascript:void(0)">看不清,换一张</a>
					<div class="col-xs-4">
						<input type="text" name="validateCode" placeholder="请输入验证码" value="">
					</div>						
				</div>
				<div class="form-group">
					<div class="col-xs-offset-2 col-xs-4">
						<button type="submit" class="btn btn-primary">登 录</button>
					</div>
					<div class="col-xs-offset-4 col-xs-8 " style="color:Red;">
						${operatorInfo}
					</div>
				</div>
			</form>
		</div>
		<div class="col-xs-4 login-help">
			<h3>管理员登录系统</h3>
			<p class="main"> 是由Zzzz团队开发的后端控制系统，能实现 <strong>用户的管理，企业的合法文章</strong>方便管理员对各类信息的合法管理。在推出后，帮助企业招聘和用户就业取得很大成功，尤其是在
			<small>个人简历的合法和企业信息的全面准确性</small>得到了非常精准的帮助。<a href="http://sc.chinaz.com/jiaoben/">访问Zzzz官方网站</a>
		</div>
	</div>
</div>
<script type="text/javascript">				
$(function(){
	$("#validateCode+a").click(function(){
		$("img").attr("src","admin/codeValidate?time="+new Date().getTime());
	}); 
})
</script>
</body>
</html>