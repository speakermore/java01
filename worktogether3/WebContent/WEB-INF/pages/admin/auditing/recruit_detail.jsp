<%@ page language="java" import="ynjh.common.util.CommonStatus" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>招聘信息</title>
<%@include file="../header.jsp"%>
</head>
<body>
	<!-- 加入显示数组 -->
	<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
	<div><%@include file="../menu.jsp"%></div>
	<div class="container">
		<article class="row">
		<div class="col-sm-offset-1 col-sm-11">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title work-together-big-font">审核招聘信息</h2>
			</div>
			<div class="panel-body">
				<blockquote>
					<h3 class="work-together-big-font">${companyRecruit.companyName}<small><time><fmt:formatDate value="${companyRecruit.cmpRecTime}" pattern="yyyy年 M月 d日" /></time></small><small>招聘状态:${AUDIT_STATUS[companyRecruit.cmpRecStatus] }</small></h3>
				</blockquote>
				<p class="work-together-big-font">招聘：${companyRecruit.cmpRecTitle}${companyRecruit.cmpRecPeople}人&nbsp;&nbsp;&nbsp;月薪：${companyRecruit.cmpRecWage}&nbsp;&nbsp;&nbsp;工作地点：${companyRecruit.cmpRecCity }</p>
				<blockquote>
					<h2 class="work-together-big-font">岗位职责及技能要求描述</h2>
				</blockquote>
				<p class="work-together-big-font">${companyRecruit.cmpRecExperience}</p>
				<div class="col-sm-12" style="margin-top:30px">
				<div class="col-sm-offset-2 col-sm-6">
					<a href="admin/recruit_audit?recruitId=${companyRecruit.id}&recruitStatus=2&toPage=redirect:admin/find_recruit/${companyRecruit.id}" class="btn btn-default">
						<span class="glyphicon glyphicon-ok"></span>通过审核
					</a>
				</div>
				<div class="col-sm-4">
					<a href="admin/recruit_audit?recruitId=${companyRecruit.id}&recruitStatus=3&toPage=admin/find_recruit/${companyRecruit.id}" class="btn btn-default">
						<span class="glyphicon glyphicon-remove"></span>不通过审核
					</a>
				</div>
			</div>
			</div>
		</div>
		</div>
		</article>
	</div>
	<!-- end of container -->
<%@include file="../footer.jsp"%>
</body>
</html>