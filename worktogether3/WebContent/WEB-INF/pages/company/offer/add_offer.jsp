<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor_4.6.2_standard/ckeditor/ckeditor.js"> </script>
<title>发送面试邀请</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<body>
发送面试邀请
<hr/>
	<form action="offer/add_offer" method="post">
		招聘岗位<input name="offerJob"/><br/>
		详细信息<textarea name="offerContent" rows="10" cols="100"></textarea><br/>
		<input type="submit" value="发送"/>
	</form>
</body>
</html>