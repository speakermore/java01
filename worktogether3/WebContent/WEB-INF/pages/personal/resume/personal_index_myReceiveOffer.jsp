<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--右侧状态栏位-->
<article class="row">
	<table class="table">
		<colgroup>
			<col style="width: 25%">
			<col style="width: 20%">
			<col style="width: 15%">
			<col style="width: 20%">
			<col style="width: 20%">
		</colgroup>
		<thead>
		<tr>
			<th>公司</th>
			<th>面试日期</th>
			<th>面试时间</th>
			<th>岗位</th>
			<th>操作</th>
		</tr>
		</thead>
		<!-- ajax分页开始 -->
		<c:if test="${user.userIsRecruit==1 }">
		<tbody id="ajaxEducationsList">
			<c:forEach items="${personal_offers_list }" var="offer">
				<tr>
					<td><a href="offer/user_offer_detail/${o.id }">${offer.companySimpleName}</a></td>
					<td><fmt:formatDate value="${offer.offerInvitationTime }"
				pattern="yyyy年MM月dd日" /></td>
		<td><fmt:formatDate value="${offer.offerInvitationTime }"
				pattern="HH点mm分" /></td>		
					<td>${offer.offerJob}</td>
					<td><a href="#">同意</a>|<a href="#">拒绝</a></td>
				</tr>
			</c:forEach>
		</tbody>
		</c:if>
		<!-- ajax分页结束 -->
	</table>
	<c:if test="${user.userIsRecruit==0 }">
	<div class="col-sm-12 alert alert-danger alert-dismissable fade in">
		需要开启“我要应聘”，才能收到邀请信息(offer)<a href="" class="close" data-dismiss="alert" aria-label="关闭"><span aria-hidden="true">&times;</span></a>
	</div>
	</c:if>
</article>