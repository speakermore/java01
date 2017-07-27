<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--左侧状态栏位-->
<article class="row">
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
	<c:if test="${user.userIsRecruit==1  }">
	<tbody id="ajaxEducationsList">
		<c:forEach items="${mySendResumes }" var="msr">
			<tr>
				<td>${msr.companyName}</td>
				<td>${msr.cmpRecTitle}</td>
				<td>${msr.cmpRecWage}</td>
				<td>${msr.cmpRecEducation}</td>
				<td><fmt:formatDate value="${msr.cmprTime }" pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
		</c:forEach>
	</tbody>
	</c:if>
</table>
<c:if test="${user.userIsRecruit==0 }">
<div class="col-sm-12 alert alert-danger alert-dismissable fade in">
	需要开启“我要应聘”按钮，才能看到我投递的简历的情况<a href="" class="close" data-dismiss="alert" aria-label="关闭"><span aria-hidden="true">&times;</span></a>
</div>
</c:if>
</article>