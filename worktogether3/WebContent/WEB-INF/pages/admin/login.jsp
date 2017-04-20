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
   		<div><%@include file="loginheader.jsp" %></div>
   		
   		<!-- Bootstrap -->
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container login" style="width: 970px!important;">

	<div class="rom">
		<div class="col-xs-8 login-box">
			<h4>用户登陆</h4>
			<form class="form-horizontal" action="admin/adminlogin" method="post" role="form">
				<div class="form-group">
					<label for="sliderLock" class="col-xs-2 control-label">解锁验证</label>
					<div class="col-xs-7">
						<div id="slider" class="sliderLock">
							<p>Slide to Unlock</p>
						</div>
						<label class="control-label helplable" for="sliderLock">用鼠标点击箭头向右滑动解锁</label>
					</div>
				</div>
				<div class="form-group">
					<label for="login-name" class="col-xs-2 control-label">登陆名称</label>
					<div class="col-xs-7">
						<input type="text" name="adminLoginId" class="form-control " placeholder="登陆名称">
						<label class="control-label helplable" for="login-name">注册时填写的名称或者电子邮件</label>
					</div>
				</div>
				<div class="form-group">
					<label for="login-pass" class="col-xs-2 control-label">登陆密码</label>
					<div class="col-xs-7">
						<input type="password" name="adminPassword" class="form-control" placeholder="登陆密码">
						<label class="control-label helplable" for="login-pass">注册时填写的名称,忘记密码 <a href="#">点此找回</a></label>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputFile" class="col-xs-2 control-label">验证码</label>
					<img id="validateCode" alt="validateCode " src="http://localhost:8080/worktogether3/admin/codeValidate?time=<%=new Date().getTime()%>" />
					<a href="javascript:void(0)">看不清,换一张</a>
					<div class="col-xs-4">
						<input type="text" name="validateCode" placeholder="请输入验证码" value="">
					</div>						
				</div>
				<div class="form-group">
					<div class="col-xs-offset-2 col-xs-4">
						<button type="submit" class="btn btn-primary btn-block">登 陆</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-xs-4 login-help">
			<h3>管理员登录系统</h3>
			<p class="main"> 是由Zzzz团队开发的后端控制系统，能实现 <strong>用户的管理，企业的合法文章</strong>方便管理员对各类信息的合法管理。在推出后，帮助企业招聘和用户就业取得很大成功，尤其是在
			<small>个人简历的合法和企业信息的全面准确性</small>得到了非常精准的帮助。<a href="http://sc.chinaz.com/jiaoben/">访问Zzzz官方网站</a>
			<h3>注意：</h3> 滑动解锁后才能进行登录！</p>
		</div>
	</div>
</div>

<script type="text/javascript">
/* var changeCode=function(){
	var date=new Date();
	var time=date.getTime();
	$("#validateCode").attr("src","http://localhost:8080/worktogether3/admin/codeValidate?time="+time;);
	
} */
$(function(){
	$("#validateCode+a").click(function(){
		$("img").attr("src","http://localhost:8080/worktogether3/admin/codeValidate?time="+new Date().getTime());
	});
	
	
})
</script>
</body>
</html>