<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业注册</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/main.css" rel="stylesheet" />
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp" %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-sm-3">
				<%@include file="/WEB-INF/pages/company/menu.jsp" %>
			</div>
		<div class="col-sm-6">
		<form class="form-horizontal" role="form" action="company/company/addCompany" method="post" >
		<div class="form-group">
			<div class="col-sm-3"> 公司手机:</div>	
			<div class="col-sm-7">
				<input type="text" class="form-control" id="exampleInputPassword1" name="companyLoginId"/>
			</div>	
		</div>
		
		<div class="form-group">
			<div class="col-sm-3"> 密码:</div>	
			<div class="col-sm-7">
				<input type="password" class="form-control" id="exampleInputPassword1" name="companyLoginId"/>
			</div>	
		</div>
		
		<div class="form-group">
			<div class="col-sm-3"> 确认密码:</div>	
			<div class="col-sm-7">
				<input type="password" class="form-control" id="exampleInputPassword1" name="realCompanyLoginId"/>
			</div>	
		</div>
		
		
		
			<!-- <form action="company/company/addCompany" method="post">
			<input type="text" name="companyLoginId"><br/>
			密码:<input type="password" name="companyPassword"><br/>
			确认密码:<input type="password" name="realCompanyPassword"><br/> -->
			<!-- 公司名称:<input type="text" name="companyName"><br/>
			公司简称:<input type="text" name="companySimpleName"><br/>
			公司logo:<input type="text" name="companyLogo"><br/>
			公司营业执照:<input type="text" name="companyLicenseImg"><br/>
			公司营业执照码:<input type="text" name="companyLicenseNo"><br/>
			公司法人:<input type="text" name="companyCorporator"><br/>
			公司电话:<input type="text" name="companyTel"><br/>
			公司电子邮件:<input type="text" name="companyEmail"><br/>
			公司地址:<input type="text" name="companyAddress"><br/>
			公司环境照片:<input type="text" name="companyDetailImg"><br/>
			公司状态:<input type="text" name="companyStatus">	<br/> -->
			<input type="submit">
		</form>
		</div>
		<div class="col-sm-3">
		</div>
	</div>
</div>
</body>
</html>