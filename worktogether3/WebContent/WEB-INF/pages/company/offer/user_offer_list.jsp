<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
<title>收到的面试邀请</title>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/main.css"/>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>

<%@include file="/WEB-INF/pages/nav.jsp" %>
<div class="container">
	<div class="row clearfix">
		
		<div class="col-sm-3"><%@include file="/WEB-INF/pages/company/menu.jsp" %></div>
			
		<div class="col-sm-9 column">
			<div class="col-sm-12 col-sm-offset-0">
			
				<table class="table table-hover">
					<caption>收到的面试邀请</caption>
					<thead>
						<tr>
							<th>查看详情</th>
							<th>公司简称</th>
							<th>招聘岗位</th>
							<th>面试时间</th>
							<th>发送时间</th>
							<th>邀请状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${offer }" var="o">
						<tr>
							<td><a href="offer/user_offer_detail/${o.id }">offer</a></td>
							<td>${o.companySimpleName }</td>
							<td>${o.offerJob}</td>
							<td>${o.offerInvitationTime}</td>
							<td>${o.offerSendTime}</td>
							<td>
								<c:if test="${o.offerAction==1}">您尚未查看</c:if>
								<c:if test="${o.offerAction==2}">已接受邀请</c:if>
								<c:if test="${o.offerAction==3}">已拒绝邀请</c:if>
								<c:if test="${o.offerAction==4}">您尚未决定</c:if>
							</td>
						</tr>
						</c:forEach>
					</tbody>
						<tr>
							<td colspan="10">
								<c:if test="${page>1 }">
									<a href="offer/user_offer_list/1">首页</a>
									<a href="offer/user_offer_list/${page-1 }">上一页</a>
								</c:if>
								<c:forEach begin="1" end="${maxPage }" var="i">
									<a href="offer/user_offer_list/${i }">${i }</a>
								</c:forEach>
								<c:if test="${page<maxPage }">
									<a href="offer/user_offer_list/${page+1 }">下一页</a>
									<a href="offer/user_offer_list/${maxPage }">尾页</a>
								</c:if>
							</td>
						</tr>
				</table>

				<hr/>
					<div class="form-group">
						<div class="col-sm-1 col-sm-offset-11">
							<a class="btn btn-primary" href="offer/window_offer">返回</a>
						</div>
					</div>
					
			</div>
		</div>
	</div>
</div>

</body>
</html>