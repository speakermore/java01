<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消费记录</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/main.css" rel="stylesheet" />
<link href="thirdpart/fileupload/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="thirdpart/fileupload/js/fileinput.min.js"></script>
<script src="thirdpart/fileupload/language/zh.js"></script>

</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-3 column">
			<%@include file="/WEB-INF/pages/company/menu.jsp" %>
			</div>
			<div class="col-md-9 column">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<td>公司id</td>
							<td>充值金额</td>
							<td>消费金额</td>
							<td>余额</td>
							<td>操作时间</td>
							<td>操作类型</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${companyRecords }" var="companyRecord">
							<tr>
								<td>${companyRecord.companyId }</td>
								<td>${companyRecord.cmpChargeMoney }</td>
								<td>${companyRecord.cmpChargeConsume }</td>
								<td>${companyRecord.cmpChargeBalance }</td>
								<td>${companyRecord.cmpChargeTime }</td>
								<c:if test="${companyRecord.cmpChargeStatus==1 }">
									<td>充值</td>
								</c:if>
								<c:if test="${companyRecord.cmpChargeStatus==2 }">
									<td>消费</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>	
				</table>
			</div>
		</div>
	</div>
</body>
</html>