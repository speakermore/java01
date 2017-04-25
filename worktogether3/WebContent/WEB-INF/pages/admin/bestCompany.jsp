<%@page import="ynjh.company.entity.Company"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<title>最佳企业</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/bootstrap.js" ></script>
<%@include file="header.jsp"%>
</head>
<body>
<div><%@include file="menu.jsp"%></div>
<table class="table table-striped">
	<a style="font-weight:bold; font-size:25px ;">管理员访问操作记录表:</a><br/><br/>
	<thead>
		<tr>
			<th>最佳企业</th>
		</tr>
	</thead>
	<tbody>
         <c:forEach var="company" items="${bestCompanyList}" varStatus="status">
              <tbody>
                <tr <c:if test="${status.index%2==0}"> class="info"</c:if>>
                	<td>${company.companyName}</td>
                	</tbody>
                </c:forEach>
	</tbody>
</table>

              
              
</body>
</body>
</html>