<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<meta name="keywords" content="相职网,招聘网,招聘,软件开发,软件人才,软件公司,Java,网络招聘" />
<link rel="shortcut icon" href="img/21495074072_.pic.png" mce_href="img/21495074072_.pic.png" type="image/x-icon" >
<link href="css/bootstrap.min.css" rel="stylesheet">
<c:if test="${admin!=null }">
	<link href="admin/css/dashboard.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="admin/css/menu.css">
</c:if>
<link href="css/main.css" rel="stylesheet">

