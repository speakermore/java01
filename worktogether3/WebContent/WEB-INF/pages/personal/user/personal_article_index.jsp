<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--左侧状态栏位-->
<article
	class="col-md-12 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
	<div class="row">
		<input type="hidden" id="getuserid" value="${user.id }"/>
		<table class="table">
			<thead>
				<tr>
					<th>文章标题</th>
					<th>创建日期</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			
			<tbody id="ajaxArticlesList">
				
				<c:forEach items="${articles }" var="art">
					<tr>
						<td><a href="personal/article/lookArticleById?id=${art.id }">${art.articleTitle }</a></td>
						<td>${art.articleTime}</td>
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
					<td colspan="4"><c:if test="${curPage==null }">
							<c:set var="curPage" value="1"></c:set>
						</c:if>
						<ul class="pagination">
							<li><a
								href="javascript:ajaxPagination(1,${user.id })">首页</a></li>

							<li><c:if test="${curPage>1 }">
									<a
										href="javascript:ajaxPagination(1,${user.id })">上一页</a>
								</c:if></li>

							<li><c:forEach begin="1" end="${maxPage }" var="i">
									<a
										href="javascript:ajaxPagination(1,${user.id })">${i}</a>
								</c:forEach></li>
							<li><c:if test="${curPage<maxPage }">
									<a
										href="javascript:ajaxPagination(1,${user.id })">下一页</a>
								</c:if></li>
							<li><a
								href="javascript:ajaxPagination(${maxPage },${user.id })">尾页</a></li>

							<li><div class="col-lg-6">
									<div class="input-group">
										<input type="text" class="form-control" id="pageGo"> <span
											class="input-group-btn">
											<button class="btn btn-default"  type="button"><a href="#" id="pageBtn">Go!</a></button>
										</span>
									</div>
									<!-- /input-group -->
								</div> <!-- /.col-lg-6 --></li>
						</ul></td>
				</tr>
			</tfoot>
		</table>
	</div>
</article>
<script type="text/javascript">
		$("#pageBtn").click(function(){
			var id=$("#getuserid").val();
			var value=$("#pageGo").val();
			if(!isNaN(value)){
				$(this).attr("href","personal/article/lookArticleList?userId="+id+"&toPage="+value);	
			}else{
				$(this).attr("href","personal/article/lookArticleList?userId="+id+"&toPage=1");	
			}
				
		});	
		var ajaxPagination=function(page,id){
				$.ajax({
				url:"personal/article/ajaxLookArticleList?toPage="+page+"&userId="+id,
				dataType:"html",
				success:function(data){
					
					$("#ajaxArticlesList").html(data);
				}
			});
		}
	</script>