<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消费记录</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<body>
	<table>
	
		<tr>
			<td>公司id</td>
			<td>充值金额</td>
			<td>消费金额</td>
			<td>余额</td>
			<td>操作时间</td>
			<td>操作类型</td>
		</tr>
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
		
		<tr>
				<td colspan="5">
				<c:if test="${curPage==null }">
					<c:set var="page" value="1"></c:set>
				</c:if>
				<c:if test="${curPage>1 }">
					<a href="company/charge/findAllById/1">首页</a>
					<a href="company/charge/findAllById/${page-1 }">上一页</a>
				</c:if>
				<c:if test="${curPage<maxPage }">
					<a href="company/charge/findAllById/${page+1 }">下一页</a>
					<a href="company/charge/findAllById/${maxPage }">尾页</a>
				</c:if>
				</td>
			</tr>
	</table>
</body>
</html>