<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>


<head>

<%@include file="/WEB-INF/pages/company/header.jsp"%>
<%@include file="/WEB-INF/pages/company/footer.jsp"%>
<title>相职网-招聘信息列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.table{
		table-layout:fixed;
	}
</style>
</head>
<body>

	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
	<div class="container">
		<div class="row clearfix">
			<div class="col-sm-3">
				<%@include file="/WEB-INF/pages/company/menu.jsp"%>
			</div>
			<!-- 招聘信息列表 -->
			<div class="col-sm-9">
				<article class="panel panel-default">
					<div class="panel-heading">
						<h3 class="paenl-title">招聘信息列表<small><em>(<a class="wt-my-title" href="company/cmprs/companyRecruit/add_companyRecruit ">添加新的招聘信息</a>)</em></small></h3>
					</div>
					<div class="panel-body">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th width="19%">招聘岗位</th><th width="11%">薪资(元)</th><th width="10%">学历</th><th width="8%">招聘</th><th width="13%">时间</th><th width="13%">状态</th><th width="8%">应聘</th><th>操作</th>
							</tr>
						</thead>
						<c:if test="${companyRecruits==null}">
							<jsp:forward page="/company/cmprs/companyRecruit/findAll"></jsp:forward>
						</c:if>
						<tbody>
							<c:forEach items="${companyRecruits}" var="cmpr">
							<tr>
								<td><a title="点击查看预览" href="company/cmprs/companyRecruit/findById?id=${cmpr.id}&toPage=company/cmprs/companyRecruit_detail">${cmpr.cmpRecTitle}</a></td>
								<td align="right">￥${cmpr.cmpRecWage}</td>
								<td>${cmpr.cmpRecEducation}</td>
								<td>${cmpr.cmpRecPeople}人</td>
								<td><fmt:formatDate value="${cmpr.cmpRecTime}" pattern="yyyy-MM-dd" /></td>
								<td>${AUDIT_STATUS[cmpr.cmpRecStatus] }</td>
								<td>
								<c:if test="${companyRecruitId==cmpr.id }">
								<a href="company/cmprs/companyResume/findAllResume?companyRecruitId=${cmpr.id }">${resumeCount }人</a>
								</c:if>
								<c:if test="${companyRecruitId!=cmpr.id }">
								<a href="company/cmprs/companyResume/findAllResume?companyRecruitId=${cmpr.id }">未知</a>
								</c:if>
								</td>
								<td><a href="company/cmprs/companyRecruit/findById?id=${cmpr.id}&toPage=company/cmprs/companyRecruit_edit">编辑</a>
									<c:if test="${cmpr.cmpRecStatus!=4 }">
									<a href="company/cmprs/companyRecruit/hidden?id=${cmpr.id }">隐藏</a>
									</c:if>
									<c:if test="${cmpr.cmpRecStatus==4 }">
									<a href="company/cmprs/companyRecruit/recover?id=${cmpr.id }">恢复</a>
									</c:if>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</article><!-- panel结束 -->
			</div><!-- 招聘信息列表 -->
		</div>
	</div>
</body>
</html>