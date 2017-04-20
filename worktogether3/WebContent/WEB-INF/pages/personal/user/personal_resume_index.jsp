<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--左侧状态栏位-->
<article
	class="col-md-12 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
	<div class="row">
	<section class="panel">
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
			<%-- <tfoot>
				<tr>
					<td colspan="4">
						<c:if test="${curPage==null }">
							<c:set var="curPage" value="1"></c:set>
						</c:if>
						<ul class="pagination">
							<li><a href="javascript:ajaxPagination(1,${user.id })">首页</a></li>

							<li><c:if test="${curPage>1}">
									<a href="javascript:ajaxPagination(${curPage-1},${user.id})">上一页</a>
								</c:if></li>

							<li><c:forEach begin="1" end="${maxPage }" var="i">
									<a href="javascript:ajaxPagination(${i},${user.id })">${i}</a>
								</c:forEach></li>
							<li><c:if test="${curPage<maxPage }">
									<a href="javascript:ajaxPagination(${curPage+1 },${user.id })">下一页</a>
								</c:if></li>
							<li><a href="javascript:ajaxPagination(${maxPage },${user.id })">尾页</a></li>
							<li><div class="col-lg-6">
									<div class="input-group">
										<span class="input-group-btn"><input type="text"
											class="form-control" id="pageGosk" /> <a href="#"
											id="pageBtn" class="btn btn-default">Go!</a> </span>
									</div>
									<!-- /input-group -->
								</div> <!-- /.col-lg-6 --></li>
						</ul>
					</td>
				</tr>
			</tfoot> --%>
		</table>
	</div>
	</section>
	</div>
</article>
<script type="text/javascript">
/* 	var ajaxPagination=function(toPage,userId){
		$.ajax({
			url:"ajaFindAllResume",
			
		});
	} */

</script>