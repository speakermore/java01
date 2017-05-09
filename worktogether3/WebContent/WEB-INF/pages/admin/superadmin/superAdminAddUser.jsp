<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--html开始  -->
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加管理员</title>
    <!-- Bootstrap -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%@include file="header.jsp" %>
  </head>
  <body>
  <div class="container">
  	<h3 class="col-md-offset-2">请填写新管理员信息</h3>
    <form role="form" class="form-horizontal" action="superAdmin/addAdmin" method="post">
		<div class="form-group">
			<label for="userName" class="col-sm-2 control-label">管理员名字：</label>
			<div class="col-sm-5">
				<input class="form-control" name="adminName" value="${superAdm.adminName }" />
			</div>
		</div>
		<div class="form-group">
			<label for="userLoginId" class="col-sm-2 control-label">管理员账号：</label>
			<div class="col-sm-5">
				<input class="form-control" id="adminLoginId" name="adminLoginId" value="" />
			</div>
			<div id="adminLoginId_info">&nbsp;</div>
		</div>
		<div class="form-group">
			<label for="adminPassword" class="col-sm-2 control-label">管理员密码：</label>
			<div class="col-sm-5">
				<input type="password" class="form-control" name="adminPassword" value="" />
			</div>
		</div>
		<div class="form-group">
			<label for="adminPasswordRepeat" class="col-sm-2 control-label">重复密码：</label>
			<div class="col-sm-5">
				<input type="password" class="form-control" name="adminPasswordRepeat" value="" />
			</div>
		</div>
		<div class="form-group">
			<label for="adminEmail" class="col-sm-2 control-label">管理员邮箱：</label>
			<div class="col-sm-5">
				<input class="form-control" name="adminEmail" value="" />
			</div>
		</div>
		<div class="form-group">
			<label for="adminTel" class="col-sm-2 control-label">管理员电话：</label>
			<div class="col-sm-5">
				<input class="form-control" name="adminTel" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5">
				<input class="btn btn-success" type="submit" value="提交用户信息" />
			</div>
		</div>
	</form>
	</div>
	<div><%@include file="superAdminHome.jsp" %></div>
	<div><%@include file="footer.jsp" %></div>
  </body>
  <script type="text/javascript">
  $("#adminLoginId").bind("blur",function(){
  	$.ajax({
  		type:"POST",
		url:"superAdmin/testAdminLoginId",
		data:"adminLoginId="+$("#adminLoginId").val(),
		dataType:"json",
		success:function(data){
			if(data){
				$("#adminLoginId_info").html("帐号已存在");
			}else{
				$("#adminLoginId_info").html("可用");
			}
		}
  	});
  });
  </script>
  <!--html结束  -->
</html>
