<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor_4.6.2_standard/ckeditor/ckeditor.js"> </script>
<title>面试邀请详情</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<body>
用户界面2
<hr/>
<form action="offer/update_offerAction/${o.id }" method="post">
	<div>企业名称:   ${o.companySimpleName }</div>
	<div>招聘岗位:   ${o.offerJob }</div>
	<div><textarea rows="10" cols="100" readonly="readonly">${o.offerContent}</textarea>&nbsp;&nbsp;&nbsp;</div>
	<div>面试时间:   ${o.offerInvitationTime }</div>
	<div>发送时间:   ${o.offerSendTime }</div>
<hr/>
<c:if test="${o.offerAction==1 or o.offerAction==4}">
	<input type="radio" name="offerAction" value=2>接受邀请
	<input type="radio" name="offerAction" value=3>拒绝邀请
	<input type="radio" name="offerAction" value=4>考虑一下
	<input type="submit" value="确定"/>
</c:if>
</form>
</body>
</html>