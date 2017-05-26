<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--左侧状态栏位-->
<article
	class="col-md-12 work-together-shadow work-together-shallow">
	<div class="row">
		<!-- 文章内容开始 -->
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
							<th>开始日期</th>
							<th>结束日期</th>
							<th>项目名称</th>
							<th>操作</th>
						</tr>
					</thead>
					<!-- ajax分页开始 -->
					<tbody id="ajaxProjectsList">
						<c:forEach items="${projectDels }" var="pDels">
							<tr>
								<td>${pDels.resumeTitle}</td>
								<td><fmt:formatDate value="${pDels.projectBeginTime}"
										pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${pDels.projectEndTime }"
										pattern="yyyy-MM-dd" /></td>
								<td>${pDels.projectName }</td>
								<td><a
									href="javascript:if(confirm('你确定真的要恢复教育记录吗？')){location.href='personal/resume/renewProject?id=${pDels.id }'}">恢复</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5"><c:if test="${curPage==0||curPage==null}">
									<c:set var="curPage" value="1"></c:set>
								</c:if>
								<ul class="pagination">
									<li><a href="javascript:ajaxProjectPagination(1,${user.id })">首页</a></li>
									<li><a id="preProjectPage"
										href="javascript:ajaxProjectPagination(${curPage-1 },${user.id })">上一页</a></li>
									<li><c:forEach begin="1" end="${maxProjectDels }" var="a">
											<a href="javascript:ajaxProjectPagination(${a},${user.id })">${a}</a>
										</c:forEach></li>
									<li><a id="nextProjectPage"
										href="javascript:ajaxProjectPagination(${curPage+1 },${user.id })">下一页</a></li>
									<li><a
										href="javascript:ajaxProjectPagination(${maxProjectDels },${user.id })">尾页</a></li>
								</ul> <!-- ajax分页结束 --></td>
						</tr>
					</tfoot>
					<!-- ajax分页结束 -->
				</table>
			</div>
		</section>
		<!-- 文章内容结束 -->
	</div>
</article>
<script type="text/javascript">
	var projecturl = "personal/resume/findProjectByDelete?toPage=";
	var projectchargeId = "#ajaxProjectsList";
	var projectperId = "#preProjectPage";
	var projectnextId = "#nextProjectPage";
	var ajaxProjectPagination = function(page, id) {
		$.ajax({
			//请求地址
			url : projecturl + page + "&userId=" + id,
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
				$(projectchargeId).html(artList);
				$(projectperId).attr(
						"href",
						"javascript:ajaxProjectPagination(" + (toPage - 1)
								+ ",${user.id})");
				$(projectnextId).attr(
						"href",
						"javascript:ajaxProjectPagination(" + (toPage + 1)
								+ ",${user.id})");
			}
		});
	}
</script>