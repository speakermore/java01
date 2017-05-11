<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.*"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>简历信息列表</title>
<%@include file="/WEB-INF/pages/company/header.jsp" %>
<%@include file="/WEB-INF/pages/company/footer.jsp" %>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-3 column">
			<%@include file="/WEB-INF/pages/company/menu.jsp" %>
			</div>
			<div class="col-md-9 column">
		<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
	<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th>姓名</th>
			<th>性别</th>
			<th>毕业院校</th>
			<th>学历</th>
			<th>专业</th>
			<th>期望待遇</th>
			<th>电话</th>
		</tr>
		</thead><%--
		<c:if test="${companyresumes==null}">
			<jsp:forward page="/company/cmprs/companyResume/findAllResume"></jsp:forward>
		</c:if>
		--%><tbody>
		<c:forEach items="${companyResumes }" var="cmprs">
			<tr>
				<td>${cmprs.resumeName}</td>
				<td>${cmprs.resumeGender }</td>
				<td>${cmprs.resumeGraduationSchool }</td>
				<td>${cmprs.resumeEducation }</td>
				<td>${cmprs.resumeMajor } </td>
				<td>${cmprs.resumeWages }</td>
				<td>${cmprs.resumePhone }</td>
				<td><a
					href="company/cmprs/companyResume/findById?id=${cmprs.id}&toPage=company/cmprs/companyResumeInfomation">查看详情
				</a></td>
			</tr>
		</c:forEach>
		</tbody>
				</table>
			</div>
			
		</div>
	</div>	
</body>
</html>