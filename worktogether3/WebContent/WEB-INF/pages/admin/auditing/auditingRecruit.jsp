<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>招聘信息</title>
<%@include file="../header.jsp"%>
</head>
<body>
	<!-- 加入显示数组 -->
	<c:set var="genders" value="${CommonStatus.SEX }"></c:set>
	<c:set var="MARRIAGE" value="${CommonStatus.MARRIAGE }"></c:set>
	<div><%@include file="../menu.jsp"%></div>
	<div class="container col-sm-offset-2">
		
		<div class="row">
			<div class="page-header">
				<h1>
					${companyRecruit.cmpRecTitle}&nbsp;<small><fmt:formatDate
							value="${companyRecruit.cmpRecTime}" pattern="yyyy年 MM月 dd日" />
					</small>
				</h1>
			</div>
		</div>
		<!-- end of row -->
		<div class="row">
			<blockquote>
				<p>
					发布企业：<strong>${company.companyName}</strong>
				</p>
			</blockquote>
		</div>
		<!-- end of row -->
		<div class="row">
			<blockquote>
				<p>岗位薪资：${companyRecruit.cmpRecWage}</p>
			</blockquote>
		</div>
		<!-- end of row -->
		<div class="row">
			<blockquote>
				<p>需求人数：${companyRecruit.cmpRecPeople}</p>
			</blockquote>
		</div>
		<!-- end of row -->
		<div class="row">
			<blockquote>
				<p>学历需求：${companyRecruit.cmpRecEducation}</p>
			</blockquote>
		</div>
		<!-- end of row -->
		<div class="row top-space">
			<dl >
				<dd><strong>${companyRecruit.cmpRecExperience}</strong></dd>
			</dl>
		</div>
		<!-- end of row -->
		<div class="top-space" >
				<c:if test="${companyRecruit.cmpRecStatus==2}">
					<div class="alert alert-success col-sm-4" role="alert">
					<span class="glyphicon glyphicon-ok-circle" aria-hidden="true" ></span>
						&nbsp;通过
					</div>
				</c:if>
				<c:if test="${companyRecruit.cmpRecStatus==3}">
					<div class="alert alert-danger col-sm-4" role="alert">
					<span class="glyphicon glyphicon-ban-circle" aria-hidden="true" ></span>
						&nbsp;未能通过审核
					</div>
				</c:if>
				<c:if test="${companyRecruit.cmpRecStatus==1}">
					<div class="alert alert-info col-sm-4" role="alert">
					<span class="glyphicon glyphicon-question-sign" aria-hidden="true" ></span>
						&nbsp;待审核
					</div>
				</c:if>
				<c:if test="${companyRecruit.cmpRecStatus==4}">
					<div class="alert alert-warning col-sm-4" role="alert">
					<span class="glyphicon glyphicon-remove-circle" aria-hidden="true" ></span>
						&nbsp;文章已删除
					</div>
				</c:if>
			</div>
		<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12 col-md-offset-1">
				<div class="col-md-6">
					<a href="admin/auditResume/${resume.id}/2" class="btn btn-default">
						<span class="glyphicon glyphicon-ok"
						aria-hidden="true">
						</span>
						通过审核
					</a>
				</div>
				<div class="col-md-6">
					<a href="admin/auditResume/${resume.id}/3" class="btn btn-default">
						<span class="glyphicon glyphicon-remove"
						aria-hidden="true">
						</span>
						不能通过审核
					</a>
				</div>
			</div>
	</div>
	<!-- end of container -->
<%@include file="../footer.jsp"%>
</body>
</html>