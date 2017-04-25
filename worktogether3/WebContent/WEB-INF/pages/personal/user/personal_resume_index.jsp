<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<!-- ajax分页开始 -->
					<tbody id="ajaxResumesList">
						<c:forEach items="${resumes }" var="resume">
							<tr>
								<td><a href="personal/resume/lookResume?id=${resume.id }">${resume.resumeTitle }</a></td>
								<td><fmt:formatDate value="${resume.resumeCreateDate}" pattern="yyyy-MM-dd" /></td>
								<c:if test="${resume.resumeStatusThree==1}">
									<th>待审核</th>
								</c:if>
								<c:if test="${resume.resumeStatusThree==2}">
									<th>正常</th>
								</c:if>
								<c:if test="${resume.resumeStatusThree==3}">
									<th>审核未通过</th>
								</c:if>
								<c:if test="${resume.resumeStatusThree==3}">
									<th>已被删除</th>
								</c:if>
								<td><a href="personal/resume/updateResume?id=${resume.id }">修改</a>|<a
									href="javascript:if(confirm('你确定真的要删除吗？')){location.href='personal/resume/deleteResume?id=${resume.id }'}">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4"><c:if test="${curResumePage==null }">
									<c:set var="curResumePage" value="1"></c:set>
								</c:if>
								<ul class="pagination">
									<li><a href="javascript:ajaxPagination1(1,${user.id })">首页</a></li>

									<li><a id="preResuemPage"
										href="javascript:ajaxPagination1(${curResumePage-1},${user.id})">上一页</a>
									</li>

									<li><c:forEach begin="1" end="${maxResumePage }" var="i">
											<a href="javascript:ajaxPagination1(${i},${user.id })">${i}</a>
										</c:forEach></li>
									<li><a id="nextResuemPage"
										href="javascript:ajaxPagination1(${curResumePage+1 },${user.id })">下一页</a>
									</li>
									<li><a
										href="javascript:ajaxPagination1(${maxResumePage },${user.id })">尾页</a></li>
									<%-- <li><div class="col-lg-6">
									<div class="input-group">
										<span class="input-group-btn"><input type="text"
											class="form-control" id="pageGosk" /> <a href="#"
											id="pageBtn" class="btn btn-default">Go!</a> </span>
									</div>
									<!-- /input-group -->
								</div> <!-- /.col-lg-6 --></li> --%>
								</ul></td>
						</tr>
					</tfoot>
					<!-- ajax分页结束 -->
				</table>
			</div>
		</section>
	</div>
</article>
<script type="text/javascript">
	var ajaxPagination1 = function(page, userId) {
		$.ajax({
			url : "personal/resume/ajaxFindAllResume?toPage=" + page
					+ "&userId=" + userId,
			dataType : "html",
			success : function(data) {
				//截断---之前的数据
				var artList = data.substring(0, data.indexOf("---"));
				//获取当前页和最大页码
				var toPage = parseInt(data.substring(data.indexOf("---") + 3,
						data.lastIndexOf("---")));
				var maxPage = parseInt(data
						.substring(data.lastIndexOf("---") + 3));
				//判断一下
				if (toPage == null) {
					toPage = 1;
				}
				if (toPage <= 1) {
					toPage = 1;
				}
				if (toPage >= maxPage) {
					toPage = maxPage;
				}
				$("#ajaxResumesList").html(artList);
				$("#preResuemPage").attr(
						"href",
						"javascript:ajaxPagination1(" + (toPage - 1)
								+ ",${user.id})");
				$("#nextResuemPage").attr(
						"href",
						"javascript:ajaxPagination1(" + (toPage + 1)
								+ ",${user.id})");
			}
		});
	}
</script>