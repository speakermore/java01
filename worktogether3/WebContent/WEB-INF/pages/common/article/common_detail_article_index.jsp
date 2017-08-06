<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.media{
	padding: 0 20px;
}
</style>
<article class="col-sm-12">
	<c:if test="${user==null||user.id!=article.usersId }">
	<!-- 如果用户没登录，或者不是本人的文章，则在没有通过审核时，不能看到该文章 -->
	<c:if test="${article.articleStatus!=2 }">
		<h1>对不起，因为管理员还未通过审核或作者已删除此文，此文暂时不能查看!</h1>
		<c:if test="${user.id>=1234567890 }">
		<a role="button" class="btn btn-default" href="personal/common/initIndex?userId=${user.id }">返回个人中心</a>
		</c:if>
		<c:if test="${user.id<1234567890 }">
		<a role="button" class="btn btn-default" href="company/company/findById/${user.id }">返回企业中心</a>
		</c:if>
	</c:if>
	</c:if>
	
	<c:if test="${user!=null && article.usersId==user.id || article.articleStatus==2 }">
	<!-- 如果用户是作者，则无论文章状态是什么都可以看到这篇文章，如果不是，则必须是审核通过的文章才能看到 -->
	<!--文章内容-->
	<section class="row">
			<!-- 文章内容 -->
			<div class="col-sm-12">
				<h3 class="text-center">${article.articleType}${article.articleTitle}</h3>
				<div class="text-right"><fmt:formatDate value="${article.articleTime}" pattern="yyyy-MM-dd HH:mm" /></div>
				<hr />
				<p>${article.articleContent}</p>
				<hr />
				<div class="hrr">
				<ul class="nav nav-pills">
				<!-- 点赞数 -->
				<li>	
					<c:if test="${isLike==0}">
					<!-- 如果用户没有点过赞 -->
					<a id="like-num" href="javascript:ajaxUpdateLike(${article.id },${user.id })"><span class="glyphicon glyphicon-thumbs-up text-primary"></span><span  class="badge pull-right badge-info">${article.articleLikeNum}</span></a>
					</c:if>
					<c:if test="${user==null||isLike==-1}">
					<!-- 用户未登录 -->
					<span class="glyphicon glyphicon-thumbs-up"></span><span class="badge pull-right">${article.articleLikeNum}</span>
					</c:if>
					<c:if test="${isLike>0 }">
					<!-- 用户已点过赞 -->
					<a id="like-num" href="javascript:ajaxCancelLike(${article.id },${user.id })"><span class="glyphicon glyphicon-thumbs-up text-warning"></span><span class="badge badge-warning pull-right ">${article.articleLikeNum}</span></a>
					</c:if>
				</li>
				<!-- 点击次数 -->
				<li>
					<a><span class="glyphicon glyphicon-eye-open"></span><span class="badge pull-right">${article.articleReadNum}</span></a>
				</li>
			</ul>
			</div>
			</div>
			<!-- 文章内容结束 -->
			<script>
				//牟勇：点赞
				var ajaxUpdateLike=function(articleId,userId){
					$.ajax({
						url:'common/article/updateLike/'+articleId+'/'+userId,
						type:'GET',
						dataType:'json',
						success:function(data){
							$('#like-num').attr('href','javascript:ajaxCancelLike('+articleId+','+userId+')');
							$('#like-num').html('<span class="glyphicon glyphicon-thumbs-up text-warning"></span><span id="like-num" class="badge badge-warning pull-right ">'+data+'</span>');
						}
					});
				}
				//牟勇：取消点赞
				var ajaxCancelLike=function(articleId,userId){
					$.ajax({
						url:'common/article/cancelLike/'+articleId+'/'+userId,
						type:'GET',
						dataType:'json',
						success:function(data){
							$('#like-num').attr('href','javascript:ajaxUpdateLike('+articleId+','+userId+')');
							$('#like-num').html('<span class="glyphicon glyphicon-thumbs-up text-primary"></span><span id="like-num" class="badge pull-right badge-info">'+data+'</span>');
						}
					});
				}
			</script>
	</section>
	<!--评论列表开始-->
	<div class="row">
		<div class="col-sm-12">
		<section class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">评论列表</h4>
			</div>
			<div class="panel-body" style="margin-top:20px">
				<c:if test="${commentArticles==null||commentArticles.size()==0 }">
					暂无评论
				</c:if>
				<c:forEach items="${commentArticles }" var="comArt">
				<section class="media">
						<a href="javascript:userMoreInfo(${comArt.usersId })" class="media-left">
						<img onerror="javascript:this.src='img/head.gif'" id="headPhoto" src="img/upload/personal/${comArt.userLoginId }/${comArt.userHeadImgPath}" style="width:50px;height:50px;" class="media-object img-circle" />
						</a>
						<div class="media-body">
							<h4 class="media-heading">${user.id==comArt.usersId?"我":comArt.userName }：</h4>
							<blockquote> ${comArt.commentArticleContent }</blockquote>
						</div>
						<div>
							<fmt:formatDate value="${comArt.commentArticleTime }" pattern="yyyy-MM-dd HH:mm" />
						</div>
				</section>
				</c:forEach>
			</div>
		</section>
		</div>
	</div>
	<!--评论列表结束-->
	<div class="row">
		<div class="col-sm-12">
		<!--发表评论-->
		<section class="panel">
			<div class="panel-heading">评论</div>
			<div class="panel-body">
				<form id="add-comment" method="post">
					<input type="hidden" name="articleId" value="${article.id }" />
					<div class="form-group">
						<textarea id="saytext" name="commentArticleContent" class="form-control" rows="5" placeholder="说点什么呗"></textarea>
					</div>
					<div class="form-group">
						<div class="col-sm-5">
							<span class="emotion">表情</span>
						</div>
						<div class="col-sm-offset-8 col-sm-2">
							<button type="button" id="sendCommentArticle" class="btn btn-success form-control" >发表评论</button>
						</div>
					</div>
				</form>
			</div>
		</section>
		<!--//发表状态结束 -->
		</div>
	</div>
	</c:if>
</article>

<script type="text/javascript">
	$("#sendCommentArticle").click(function() {
		$.ajax({
			url : 'common/article/comment/add',
			type:'POST',
			data:$('#add-comment').serialize(),
			dataType : "html",
			success : function(data) {
				alert("评论成功！等管理员审核通过后，将在文章后面显示出来，谢谢！");
				$('#my-content').html(data);
			}
		});
	});
</script>

