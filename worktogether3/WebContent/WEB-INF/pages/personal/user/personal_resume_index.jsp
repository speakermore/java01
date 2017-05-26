<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--左侧状态栏位-->
<article
	class="col-md-12  alert-danger work-together-shadow work-together-shallow">
	<div class="row">
		<section class="panel">
			<div class="row">
				<table class="table">
					<colgroup>
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
					</colgroup>
					<thead>
						<tr>
							<th>简历标题</th>
							<th>简历意向</th>
							<th>创建日期</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- ajax分页开始 -->
					<tbody id="ajaxResumesList">
						<c:forEach items="${resumes }" var="res">
							<tr>
								<td><a href="personal/resume/lookResume?id=${res.id }">${res.resumeTitle }</a></td>
								<td>${res.resumeJor }</td>
								<td><fmt:formatDate value="${res.resumeCreateDate}"
										pattern="yyyy-MM-dd" /></td>
								<c:if test="${res.resumeStatusThree==1}">
									<th>待审核</th>
								</c:if>
								<c:if test="${res.resumeStatusThree==2}">
									<th>正常</th>
								</c:if>
								<c:if test="${res.resumeStatusThree==3}">
									<th>审核未通过</th>
								</c:if>
								<c:if test="${res.resumeStatusThree==4}">
									<th>已被删除</th>
								</c:if>
								<td><c:if test="${res.resumeStatusThree==4 }">
										<a href="personal/resume/updateResume?id=${res.id }">修改</a>|<a
											href="javascript:if(confirm('你确定真的要恢复这篇简历吗？')){location.href='personal/resume/renewResume?id=${res.id }'}">恢复</a>
									</c:if> <c:if
										test="${res.resumeStatusThree==1||res.resumeStatusThree==2||res.resumeStatusThree==3 }">
										<a href="personal/resume/updateResume?id=${res.id }">修改</a>|<a
											href="javascript:if(confirm('你确定真的要删除这篇简历吗？')){location.href='personal/resume/deleteResume?id=${res.id }'}">删除</a>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4"><c:if test="${curPage==0||curPage==null }">
									<c:set var="curResumePage" value="1"></c:set>
								</c:if>
								<ul class="pagination">
									<li><a href="javascript:ajaxPagination1(1,${user.id })">首页</a></li>
									<li><a id="preResuemPage"
										href="javascript:ajaxPagination1(${curPage-1},${user.id})">上一页</a></li>
									<li><c:forEach begin="1" end="${maxResumePage }" var="i">
											<a href="javascript:ajaxPagination1(${i},${user.id })">${i}</a>
										</c:forEach></li>
									<li><a id="nextResuemPage"
										href="javascript:ajaxPagination1(${curPage+1 },${user.id })">下一页</a></li>
									<li><a
										href="javascript:ajaxPagination1(${maxResumePage },${user.id })">尾页</a></li>
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
	var resumeurl = "personal/resume/ajaxFindAllResume?toPage=";
	var resumechargeId = "#ajaxResumesList";
	var resumeperId = "#preResuemPage";
	var resumenextId = "#nextResuemPage";
	var ajaxPagination1 = function(page, id) {
		$.ajax({
			//请求地址
			url : resumeurl + page + "&userId=" + id,
			//返回类型
			dataType : "html",
			//请求成功后调的方法
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
				$(resumechargeId).html(artList);
				$(resumeperId).attr(
						"href",
						"javascript:ajaxPagination(" + (toPage - 1)
								+ ",${user.id})");
				$(resumenextId).attr(
						"href",
						"javascript:ajaxPagination(" + (toPage + 1)
								+ ",${user.id})");
			}
		});
	}
</script>