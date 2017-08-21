<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
<!-- 招聘信息列表 -->
<div class="col-sm-12">
	<article class="panel panel-default">
		<div class="panel-heading">
			<h3 class="paenl-title">招聘信息列表<small><em>(<a class="wt-my-title" href="javascript:ajaxPage('company/cmprs/recruit_add')">添加新的招聘信息</a>)</em></small></h3>
		</div>
		<div class="panel-body">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th width="19%">招聘岗位</th>
					<th width="11%">月薪(元)</th>
					<th width="8%">招聘</th>
					<th width="13%">时间</th>
					<th width="13%">状态</th>
					<th width="8%">应聘</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${companyRecruits}" var="cmpr">
				<tr>
					<td><a title="点击查看预览" href="javascript:ajaxPage('redirect:company/cmprs/find_recruit_detail/${cmpr.id}/0')">${cmpr.cmpRecTitle}</a></td>
					<td class="text-right">￥${cmpr.cmpRecWage}</td>
					<td>${cmpr.cmpRecPeople}人</td>
					<td><fmt:formatDate value="${cmpr.cmpRecTime}" pattern="yyyy-MM-dd" /></td>
					<td>${AUDIT_STATUS[cmpr.cmpRecStatus] }</td>
					<td>
					<a href="javascript:ajaxPage('redirect:company/cmprs/find_apply_list/${cmpr.id }')">${cmpr.resumeNumber }人</a>
					</td>
					<td><a href="javascript:ajaxPage('redirect:company/cmprs/find_recruit_detail/${cmpr.id}/1')">修改</a>
						<c:if test="${cmpr.cmpRecStatus==2 }">
						<a href="javascript:ajaxPage('redirect:company/cmprs/stop_recruit/${cmpr.id }')">停止招聘</a>
						</c:if>
						<c:if test="${cmpr.cmpRecStatus==5 }">
						<a href="javascript:ajaxPage('redirect:company/cmprs/start_recruit/${cmpr.id }')">开始招聘</a>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</article><!-- panel结束 -->
</div><!-- 招聘信息列表结束 -->