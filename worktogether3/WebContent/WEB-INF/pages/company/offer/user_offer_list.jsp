<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor_4.6.2_standard/ckeditor/ckeditor.js"> </script>
<title>收到的面试邀请</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<body>
用户界面1
<hr/>	
	<table>
		<tr>
			<td>查看详情&nbsp;&nbsp;&nbsp;</td>
			<td>企业名称&nbsp;&nbsp;&nbsp;</td>
			<td>招聘岗位&nbsp;&nbsp;&nbsp;</td>
			<td>面试时间&nbsp;&nbsp;&nbsp;</td>
			<td>发送时间&nbsp;&nbsp;&nbsp;</td>
			<td>邀请状态</td>
		</tr>
		<c:forEach items="${offer }" var="o">
		<tr>
			<td><a href="offer/user_offer_detail/${o.id }"><li></li></a>&nbsp;&nbsp;&nbsp;</td>
			<td>${o.companySimpleName }&nbsp;&nbsp;&nbsp;</td>
			<td>${o.offerJob}&nbsp;&nbsp;&nbsp;</td>
			<td>${o.offerInvitationTime}&nbsp;&nbsp;&nbsp;</td>
			<td>${o.offerSendTime}&nbsp;&nbsp;&nbsp;</td>
			<td>
				<c:if test="${o.offerAction==1}">您尚未查看</c:if>
				<c:if test="${o.offerAction==2}">已接受邀请</c:if>
				<c:if test="${o.offerAction==3}">已拒绝邀请</c:if>
				<c:if test="${o.offerAction==4}">您尚未决定</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
<hr/>
</body>
</html>