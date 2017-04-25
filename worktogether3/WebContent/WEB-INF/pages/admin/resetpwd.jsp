<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员密码重置</title>
<!-- Bootstrap -->
<%@include file="loginheader.jsp" %>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				
			</div>
			<div class="col-md-4">
				<div class="page-header"><h3>请填写需要重置密码的管理员帐号</h3></div>
				<div>
					<form action="admin/forgetpwd" method="post">
					  <div class="form-group">
					    <label for="admin_login">登录名</label>
					    <input type="password" class="form-control" id="admin_login" name="adminLoginId" placeholder="请输入管理员登录名">
					    <span id="helpBlock" class="help-block">没有此管理员</span>

					  </div>
					  <div class="form-group">
					  	<img id="validateCode" alt="validateCode " src="http://localhost:8080/worktogether3/admin/codeValidate?time=<%=new Date().getTime()%>" />
					  	<a class="btn btn-default" href="javascript:void(0)" role="button" class="btn btn-primary btn-sm">看不清，换一张</a>

					  </div>
					  <div class="form-group">
					    <label for="validate">验证码</label>
					    <input type="password" class="form-control" id="validate" name="validateCode" placeholder="请输入验证码">
					  </div>
						<div class="col-md-offset-10">
							<button type="submit" class="btn btn-default">确定</button>
						</div>
					  	
					</form>
				</div>
			</div>
		
		</div>
	</div>
	<script type="text/javascript">
	
		$(function(){
			$("#validateCode+a").click(function(){
				$("img").attr("src","http://localhost:8080/worktogether3test/admin/codeValidate?time="+new Date().getTime());
			}); 
		})
	</script>
		
	</body>
	</html>