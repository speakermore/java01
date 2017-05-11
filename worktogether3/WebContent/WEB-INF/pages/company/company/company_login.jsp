<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
    
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>企业用户登录</title>
    <%@include file="/WEB-INF/pages/company/header.jsp" %>
	<%@include file="/WEB-INF/pages/company/footer.jsp" %>
  </head>
  <body>
		<!--wt-姓名首字母-相关文字-->
		<div id="wt-hby-login">
			<header class="navbar navbar-static-top bs-docs-nav wt-hby-login-top" id="top">
				<%@include file="/WEB-INF/pages/nav.jsp" %> 
			</header>
			<div class="bs-docs-header wt-hby-login-center"  id="content" tabindex="-1">
				<div class="container bs-docs-container">
					<form class="form-signin" action="company/company/login" method="post">
      		  <h2 class="form-signin-heading">企业用户登录</h2>
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
        		<div id="inputagree">
        			<a href="#">我已阅读并同意服务条款</a><br/><br/><br/>
        			
        			<a href="company/company/add" class="text-rigeht">还没账号？注册</a>
        		</div>
      		</form>
    		</div>
			</div>
			<div class="wt-hby-login-bottom">
				<img src="img/1-1-2.jpg"/>
				<a class="back-to-top" href="#top">返回顶部</a>
			</div>
		</div>
   	<%@include file="../footer.jsp" %>
  </body>
</html>
