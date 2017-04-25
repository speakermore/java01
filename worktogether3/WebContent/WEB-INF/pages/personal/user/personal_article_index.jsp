<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--左侧状态栏位-->
<article
	class="col-md-12 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
	<div class="row">
		<!-- 文章内容开始 -->
		<section class="panel">
			<div class="row">
				<input type="hidden" id="getuserid" value="${user.id }" />
				<table class="table">
					<colgroup>
						<col style="width: 25%">
						<col style="width: 25%">
						<col style="width: 25%">
						<col style="width: 25%">
					</colgroup>
					<thead>
						<tr>
							<th>文章标题</th>
							<th>创建日期</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<%-- <c:if test="${articles==null }">
						<jsp:forward page="personal/article/lookArticleList?toPage=1&userId=${user.id }"></jsp:forward>
					</c:if> --%>
					<!-- ajax分页开始 -->
					<tbody id="ajaxArticlesList">
						<c:forEach items="${articles }" var="art">
							<tr>
								<td><a
									href="personal/article/lookArticleById?id=${art.id }">${art.articleTitle }</a></td>
								<td><fmt:formatDate value="${art.articleTime}"
										pattern="yyyy-MM-dd" /></td>
								<c:if test="${art.articleStatus==1}">
									<th>待审核</th>
								</c:if>
								<c:if test="${art.articleStatus==2}">
									<th>正常</th>
								</c:if>
								<c:if test="${art.articleStatus==3}">
									<th>审核未通过</th>
								</c:if>
								<c:if test="${art.articleStatus==4}">
									<th>已被删除</th>
								</c:if>
								<td><a
									href="personal/article/gotoUpdateArticle?id=${art.id }">修改</a>|<a
									href="javascript:if(confirm('你确定真的要恢复被删的简历吗？')){location.href='personal/article/deleteUserAricle?id=${art.id }'}">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4"><c:if test="${curArticlePage==null }">
									<c:set var="curArticlePage" value="1"></c:set>
								</c:if>
								<ul class="pagination">
									<li><a href="javascript:ajaxPagination(1,${user.id })">首页</a></li>
									<li><a id="preArticlePage"
										href="javascript:ajaxPagination(${curArticlePage-1 },${user.id })">上一页</a></li>
									<li><c:forEach begin="1" end="${maxArticlePage }" var="a">
											<a href="javascript:ajaxPagination(${a},${user.id })">${a}</a>
										</c:forEach></li>
									<li><a id="nextArticlePage"
										href="javascript:ajaxPagination(${curArticlePage+1 },${user.id })">下一页</a></li>
									<li><a
										href="javascript:ajaxPagination(${maxArticlePage },${user.id })">尾页</a></li>
									<!-- <li><div class="col-lg-6">
											<div class="input-group">
												<span class="input-group-btn"><input type="text"
													class="form-control" id="pageGosk" /> <a href="#"
													id="pageBtn" class="btn btn-default">Go!</a> </span>
											</div>
											/input-group
										</div> /.col-lg-6</li> -->
								</ul></td>
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
	/* var id = $("#getuserid").val();
	var value = $("#pageGosk").val();
	$("#pageBtn").click(
			function() {
				$(this).attr("href",
						"javascript:ajaxPagination(" + value + "," + id + ")");
			}); */
	var ajaxPagination = function(page, id) {
		$.ajax({
			//请求地址
			url : "personal/article/ajaxLookArticleList?toPage=" + page
					+ "&userId=" + id,
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
				$("#ajaxArticlesList").html(artList);
				$("#preArticlePage").attr(
						"href",
						"javascript:ajaxPagination(" + (toPage - 1)
								+ ",${user.id})");
				$("#nextArticlePage").attr(
						"href",
						"javascript:ajaxPagination(" + (toPage + 1)
								+ ",${user.id})");
			}
		});
	}
</script>