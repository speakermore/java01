<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ynjh.common.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>审核企业简介</title>
<%@ include file="../header.jsp"%>
</head>
<body>
<div><%@include file="../menu.jsp"%></div>
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
	<div class="col-sm-offset-2">
		<div class="container">
			<div class="col-sm-11">
				<c:if test="${companyIntro==null}">
					<jsp:forward page="/admin/findCompanyIntro/1" />
				</c:if>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>公司</th>
							<th>法人代表</th>
							<td>电话</td>
							<td>审核信息</td>
						</tr>
					</thead>
					<c:forEach items="${companyIntro}" var="com">
						<tr>
							<td>
								<a href="admin/findAuditComById/${com.id}">${com.companyName}</a>
							</td>
							<td>
								${com.companyCorporator}
							</td>
							<td>
								${com.companyTel}
							</td>
							<td>
								${AUDIT_STATUS[com.companyStatus]}
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>		
		</div>
	</div>
</body>
<%@ include file="../footer.jsp"%>
</html>