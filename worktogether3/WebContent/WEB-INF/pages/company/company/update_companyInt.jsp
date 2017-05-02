<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/company/bootstrap.css"/>
<title>修改资料</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/main.css" rel="stylesheet" />
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>
	<form action="company/company/updateInt" method="post">
	公司简介：<input type="text" name="cmpIntroduction" value=${companyInt.cmpIntroduction } ><br/>
	公司性质：<input type="text" name="cmpIntQuality" value=${companyInt.cmpIntQuality } ><br/>
	公司规模：<select  name="cmpIntPeopleNum">
				<option value="1">20人以下</option>
				<option value="2">50人</option>
				<option value="3">80人</option>
				<option value="4">100人</option>
				<option value="5">150人</option>
				<option value="6">200人</option>
				<option value="7">200人以上</option>
			</select><br/>
	
	公司福利：<input type="text" name="cmpIntComforts" value=${companyInt.cmpIntComforts } ><br/>
	公司休息制度：<input type="text" name="cmpIntRest" value=${companyInt.cmpIntRest } ><br/>
	公司：<input type="text" name="cmpIntInsurance" value=${companyInt.cmpIntInsurance } ><br/>
	职业薪资：<input type="text" name="cmpIntWage" value=${companyInt.cmpIntWage } ><br/>
	公司简介状态：<input type="text" name="cmpIntStatus" value=${companyInt.cmpIntStatus } ><br/>
	<input type="submit" value="提交">
	</form>
</body>
</html>