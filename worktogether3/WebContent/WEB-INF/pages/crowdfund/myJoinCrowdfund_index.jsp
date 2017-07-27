<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<style type="text/css">
#sou {
	width: 300px;
	margin: 0 auto;
	text-align: center;
	padding-top: 30px;
	padding-bottom: 40px;
}

.input_info {
	padding-top: 10px;
}

td a {
	color: black;
}

td a:hover {
	color: #fe6000;
	text-decoration: none;
}

.table th, .table td {
	text-align: center;
	vertical-align: middle !important;
}
</style>

<table class="table table-hover table-striped">
	<tr>
		<th>参与项目</th>
		<th>发布类型</th>
		<th>项目金额</th>
		<th>项目周期</th>
		<th>申请进度</th>
	</tr>
	<%--众筹推荐列表 --%>
	<c:if test="${user.userIsRecruit==1}">
		<c:forEach items="${cfUserList}" var="cfu">
			<tr>
				<td><a href="crowdfund/crowdfundOnlyInfo?id=${cfu.id}">${cfu.crowdfundProjectName}</a></td>
				<td><c:if test="${cfu.publisherId<1234567891}">
						企业
					</c:if> <c:if test="${cfu.publisherId>1234567890}">
						个人
					</c:if></td>
				<td><fmt:formatNumber value="${cfu.crowdfundProjectMoney}"
						pattern="##,###,###.00元"></fmt:formatNumber></td>
				<td>${cfu.crowdfundProjectCycle}</td>
				<td><c:if test="${cfu.checkStatus==1}">待处理</c:if> <c:if
						test="${cfu.checkStatus==2}">已同意</c:if> <c:if
						test="${cfu.checkStatus==3}">未通过</c:if></td>
			</tr>
		</c:forEach>
	</c:if>
	
</table>
<%--无众筹 --%>
<div id="showTips" style="display: none;">
	<div class="alert alert-danger alert-dismissable">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		Tips:亲！您还没有参与的众筹项目，快去技术众筹大厅看看吧！
	</div>
</div>
<c:if test="${user.userIsRecruit==0 }">
<div class="col-sm-12 alert alert-danger alert-dismissable fade in">
	需要开启“我要应聘”，才能参与技术众筹<a href="" class="close" data-dismiss="alert" aria-label="关闭"><span aria-hidden="true">&times;</span></a>
</div>
</c:if>
<script type="text/javascript">
	$(function() {
		if ($("table tr td:first").text().length === 0) {
			$("#showTips").css("display", "block");
		}
	})
</script>