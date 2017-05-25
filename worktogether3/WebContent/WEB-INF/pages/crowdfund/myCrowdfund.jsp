<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet" />
<link rel="shortcut icon" href="img/21495074072_.pic.png" href="img/21495074072_.pic.png" type="image/x-icon" >
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="css/bootstrap.min.css.map"></script>
<title>我的众筹</title>
</head>
<body>
	<h4>技术众筹（浏览）</h4>
	<a href="crowdfund/crowdfundAllList?page=1">查看所有众筹信息--个人（OK）</a>
	<br/>
	<h4>添加众筹</h4>
	<a href="crowdfund/toAddcrowdfund">添加众筹信息--个人、企业(OK)</a>
	<br/>
	
	<h4>我发布的众筹</h4>
	<a href="crowdfund/mySendCrowdfund">个人、企业发布</a>
	<br/>
	<h5>>>众筹修改</h5>
	
	<h5>>>删除众筹</h5>
	<hr/>
	
	<h4>我参与的众筹</h4>
	<a href="crowdfund/myJoinCrowdfund">--个人、企业</a><br/>
	<h4>管理员审核</h4>
	<a href="crowdfund/toCheckCrowdfund">众筹信息审核--管理员</a><br/>
	<br/>
	
	
</body>
</html>