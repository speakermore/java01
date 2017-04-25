<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>
    <base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<!--<link href="css/main.css" rel="stylesheet" />-->
	<link href="css/login.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body>
		<!--wt-姓名首字母-相关文字-->
		<div id="wt-hby-login">
			<header class="navbar navbar-static-top bs-docs-nav wt-hby-login-top" id="top">
				
					<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    				<div class="container-fluid">
          		<div class="navbar-header" id="wt-hby-header-left">
          			<a class="navbar-brand" href="#">昆明</a>
          			<ul class="nav navbar-nav">
          		 		<li><a href="#">切换城市</a></li>
           		 	</ul>
         			</div>
         	 		<div class="collapse navbar-collapse navbar-left"  id="wt-hby-header-middle">
								<ul class="nav navbar-nav">
									<li class="active"><a href="#">首页</a></li>
								</ul>
							</div>
         	 		<div class="navbar-collapse collapse" id="wt-hby-header-right">
           	 		<ul class="nav navbar-nav navbar-right">
            		  <li><a href="company/company/add">还没账号？立即注册</a></li>
           			</ul>
          		</div>
       	 		</div>
      		</nav>
				
			</header>
			<div class="bs-docs-header wt-hby-login-center"  id="content" tabindex="-1">
				<div class="container">
					<form class="form-signin" action="company/company/login" method="post">
      		  <h2 class="form-signin-heading">登录</h2>
       			<label for="inputEmail" class="sr-only">邮箱/手机号</label>
        		<input type="text" id="inputEmail" class="form-control" placeholder="邮箱/手机号" required autofocus name="companyLoginId">
       			<label for="inputPassword" class="sr-only">密码</label>
        		<input type="password" id="inputPassword" class="form-control" placeholder="密码" required name="companyPassword">
        		<div class="checkbox">
	         		<label>
	            	<input type="checkbox" value="remember-me"> 记住密码
	          	</label>
        		</div>
        		<button class="btn btn-lg btn-success btn-block" type="submit">立即登录</button>
        		
      		</form>
    		</div>
			</div>
			<div class="wt-hby-login-bottom">
				<img src="img/1-1-2.jpg"/>
				<a class="back-to-top" href="#top">返回顶部</a>
			</div>
		</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
