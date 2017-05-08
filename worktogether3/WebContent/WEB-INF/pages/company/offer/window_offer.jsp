<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>面试邀请主页</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<hr>
<body>
	<a href="offer/add_offer">发送邀请</a>
	<a href="offer/company_offer_list/1">企业界面</a>
	<a href="offer/user_offer_list/1">用户界面</a>
<hr>
	article
	<a href="add_companyarticle">1+</a>
	<a href="company_index">2</a>
	<a href="companyart_detail">3</a>
	<a href="companyart_edit">4+</a>
<hr>
	charge
	<a href="add_charge">1+</a>
	<a href="charge_record">2</a>
	<a href="company_charge">3+</a>
	<a href="consume_charge">4</a>
<hr>
	recruit
	<a href="add_companyRecruit">1+</a>
	<a href="companyRecruit_edit">2+</a>
	<a href="companyRecruit_index">3</a>
	<a href="companyRecruit_info">4</a>
<hr>
	company
	<a href="add_company">1</a>
	<a href="company_data">2+</a>
	<a href="company_index">3</a>
	<a href="company_login">4+</a>
	<a href="update_company">5+</a>
	<a href="update_companyInt">6</a>
	<a href="personal_createresume">7</a>	
<hr>	
</body>
</html>