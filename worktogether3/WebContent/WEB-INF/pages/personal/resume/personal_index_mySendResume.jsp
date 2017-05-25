<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--左侧状态栏位-->
<article
	class="col-md-12 work-together-shadow work-together-shallow">
	<div class="row">
		<!-- 文章内容开始 -->
		<section class="panel">
			<div class="row">
				<table class="table">
					<colgroup>
						<col style="width: 30%">
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 30%">
					</colgroup>
					<thead>
						<tr>
							<th>招聘公司</th>
							<th>招聘标题</th>
							<th>薪资</th>
							<th>学历要求</th>
							<th>投递时间</th>
						</tr>
					</thead>
					<!-- ajax分页开始 -->
					<tbody id="ajaxEducationsList">
						<c:forEach items="${mySendResumes }" var="msr">
							<tr>
								<td>${msr.companyName}</td>
								<td>${msr.cmpRecTitle}</td>
								<td>${msr.cmpRecWage}</td>
								<td>${msr.cmpRecEducation}</td>
								<td><fmt:formatDate value="${msr.cmprTime }"
										pattern="yyyy-MM-dd HH:mm" /></td>
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