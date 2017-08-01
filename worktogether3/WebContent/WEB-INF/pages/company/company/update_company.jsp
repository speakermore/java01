<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.CommonStatus" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<title>企业用户-编辑资料</title>
<%@include file="/WEB-INF/pages/company/footer.jsp"%>
<style>
#file {
	height: 100px;
	width: 400px;
}

.panel-group {
	margin-bottom: 0px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<%@include file="/WEB-INF/pages/company/menu.jsp"%>
			</div>
			<div class="col-sm-9">
				<%@include file="/WEB-INF/pages/company/company/update_company_index.jsp" %>
			</div>
		</div>
	</div>
</body>
</html>