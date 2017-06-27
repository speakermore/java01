<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />

<link rel="shortcut icon" href="img/21495074072_.pic.png" mce_href="img/21495074072_.pic.png" type="image/x-icon" >
<link href="css/bootstrap.min.css" rel="stylesheet">
<c:if test="${admin!=null }">
	<link href="admin/css/dashboard.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="admin/css/menu.css">
</c:if>
<link href="css/main.css" rel="stylesheet">

