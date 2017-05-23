<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--左侧状态栏位-->
<article
	class="col-md-12 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
	<div class="row">
		<!-- 文章内容开始 -->
		<section class="panel">
			<div class="row">
				<table class="table">
					<colgroup>
						<col style="width: 25%">
						<col style="width: 25%">
						<col style="width: 10%">
						<col style="width: 30%">
						<col style="width: 10%">
					</colgroup>
					<thead>
						<tr>
							<th>面试时间</th>
							<th>公司</th>
							<th>岗位</th>
							<th>内容</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- ajax分页开始 -->
					<tbody id="ajaxEducationsList">
						<c:forEach items="${offers }" var="offer">
							<tr>
								<td><fmt:formatDate value="${offer.offerInvitationTime }"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${offer.companyName}</td>
								<td>${offer.offerJob}</td>
								<td><c:if test="${fn:length(offer.offerContent)>10 }">  
                         ${fn:substring(offer.offerContent, 0, 10)}...  
                   </c:if> <c:if test="${fn:length(offer.offerContent)<=10 }">  
                         ${offer.offerContent }  
                   </c:if></td>
								<td><a href="#">同意</a>|<a href="#">拒绝</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<!-- ajax分页结束 -->
				</table>
			</div>
		</section>
		<!-- 文章内容结束 -->
	</div>
</article>