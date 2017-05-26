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
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/login.css"/>
<link rel="stylesheet" href="dist/css/bootstrapValidator.min.css">
<link rel="shortcut icon" href="img/21495074072_.pic.png" href="img/21495074072_.pic.png" type="image/x-icon" >
<title>众筹审核</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
	.table th, .table td { 
		text-align: center;
		vertical-align: middle!important;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="col-sm-1 col-xs-hidden"></div>
	<div class="col-sm-10 col-xs-12">
	<table class="table table-hover table-striped">
		<tr>
			<th>众筹项目</th>
			<th>发布类型</th>
			<th>项目金额</th>
			<th>申请时间</th>
			<th>审核状态</th>
			<th>审核操作</th>
		</tr>
		<%--众筹推荐列表 --%>
		<c:if test="${checkList!=null}">
			<c:forEach items="${checkList}" var="cf">
			<c:if test="${cf.crowdfundProjectEndDate.time>=now.time}">
			<tr>
				<td><a href="crowdfund/crowdfundOnlyInfo?id=${cf.id}">${cf.crowdfundProjectName}</a></td>
				<td>
					<c:if test="${cf.publisherId<1234567891}">
						企业
					</c:if>
					<c:if test="${cf.publisherId>1234567890}">
						个人
					</c:if>
				</td>
				<td><fmt:formatNumber value="${cf.crowdfundProjectMoney}" pattern="##,###,###.00元"></fmt:formatNumber></td>
				<td><fmt:formatDate value="${cf.crowdfundProjectStartDate}" pattern="yyyy年MM月dd日 E"/> </td>
				<td>待审核</td>
				<td>
					<a title="通过" onClick="return confirm('确定通过该众筹信息审核？')" href="crowdfund/checkCrowdfund?order=2&id=${cf.id}"><span class="glyphicon glyphicon-ok"></span></a>
					&nbsp;<a title="拒绝" onClick="return confirm('确定要拒绝该众筹信息？')" href="crowdfund/checkCrowdfund?order=3&id=${cf.id}"><span class="glyphicon glyphicon-remove"></span></a>
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</c:if>
		</table>
	</div>

</body>
</html>