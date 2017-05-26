<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的钱包</title>
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
		<div class="col-sm-12 column">
			<div class="row clearfix">
				<div class="col-sm-3 column">
					<%@include file="/WEB-INF/pages/company/menu.jsp" %>
				</div>
				<div class="col-sm-6 column">
					<h2>
						你的余额：
					</h2>
					<p>
						<h3>${companyCharge.cmpChargeBalance }</h3>
					</p>
					<div class="col-sm-8 column"></div>
					<div class="col-sm-4 column">
					<p>
						 <a class="form-control btn btn-success" href="company/charge/chargeRecord/${companyCharge.companyId }" class="form-control btn btn-success">消费记录</a>
					</p>
					</div>
				</div>
				<div class="col-sm-4 column">
						
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
	
		</div>
	</div>



	
	<%-- <a href="company/charge/chargeRecord/${companyCharge.companyId }">nihao1</a> --%>
</body>
</html>