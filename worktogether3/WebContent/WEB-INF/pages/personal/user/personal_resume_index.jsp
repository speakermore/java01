<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--左侧状态栏位-->
<article
	class="col-md-12 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
	<div class="row">
		<table class="table">
			<thead>
				<tr>
					<th>简历标题</th>
					<th>创建日期</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${resumes==null}">
					<jsp:forward
						page="/personal/resume/findAllResume?userId=${user.id }"></jsp:forward>
				</c:if>
				<c:forEach items="${resumes }" var="resume">
					<tr>
						<td><a href="personal/resume/lookResume?id=${resume.id }">${resume.resumeTitle }</a></td>
						<td>${resume.resumeCreateDate}</td>
						<c:if test="${resume.resumeStatusThree==1}"><th>待审核</th></c:if>
						<c:if test="${resume.resumeStatusThree==2}"><th>正常</th></c:if>
						<c:if test="${resume.resumeStatusThree==3}"><th>审核未通过</th></c:if>
						<c:if test="${resume.resumeStatusThree==3}"><th>已被删除</th></c:if>
						<td><a href="personal/resume/updateResume?id=${resume.id }">修改</a>|<a
							href="javascript:if(confirm('你确定真的要删除吗？')){location.href='personal/resume/deleteResume?id=${resume.id }'}">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</article>