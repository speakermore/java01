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
				<div class="col-md-12">
				<c:forEach items="${articles }" var="art">
					<div class="thumbnail">
						<div class="caption">
							<h3>${art.articleTitle }</h3>
							<p>${art.articleContent }</p>
							<p>
								<a class="btn btn-primary " href="personal/article/gotoUpdateArticle?id=${article.id }">修改</a> <a class="btn"
									href="javascript:if(confirm('你确定真的要恢复被删的简历吗？')){location.href='personal/article/deleteUserAricle?id=${article.id }'}">删除</a>
							</p>
						</div>
					</div>
					</c:forEach>
				</div>



				<table class="table">
					
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
							<td colspan="4"></td>
						</tr>
					</tfoot>
					<c:if test="${curPage==0||curPage==null}">
									<c:set var="curPage" value="1"></c:set>
								</c:if>
								<ul class="pagination">
									<li><a href="javascript:ajaxPagination(1,${user.id })">首页</a></li>
									<li><a id="preArticlePage"
										href="javascript:ajaxPagination(${curPage-1 },${user.id })">上一页</a></li>
									<li><c:forEach begin="1" end="${maxArticlePage }" var="a">
											<a href="javascript:ajaxPagination(${a},${user.id })">${a}</a>
										</c:forEach></li>
									<li><a id="nextArticlePage"
										href="javascript:ajaxPagination(${curPage+1 },${user.id })">下一页</a></li>
									<li><a
										href="javascript:ajaxPagination(${maxArticlePage },${user.id })">尾页</a></li>
								</ul>
					<!-- ajax分页结束 -->
				</table>
			</div>
		</section>
		<!-- 文章内容结束 -->
	</div>
</article>
<script type="text/javascript">
	var articleurl = "personal/article/ajaxLookArticleList?toPage=";
	var articlechargeId = "#ajaxArticlesList";
	var articleperId = "#preArticlePage";
	var articlenextId = "#nextArticlePage";
	var ajaxPagination = function(page, id) {
		$.ajax({
			//请求地址
			url : articleurl + page + "&userId=" + id,
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
				$(articlechargeId).html(artList);
				$(articleperId).attr(
						"href",
						"javascript:ajaxPagination(" + (toPage - 1)
								+ ",${user.id})");
				$(articlenextId).attr(
						"href",
						"javascript:ajaxPagination(" + (toPage + 1)
								+ ",${user.id})");
			}
		});
	}
</script>