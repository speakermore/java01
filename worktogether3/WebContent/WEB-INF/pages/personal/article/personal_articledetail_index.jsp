<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.media{
	padding: 0 20px;
}
</style>
<article
	class="col-md-12  work-together-shadow work-together-deep">
	<!--我的信息-->
	<section class="panel">
			<div class="col-md-12 column">
				<h3 align="center">${article.articleTitle}</h3>
				<div align="right">
					<fmt:formatDate value="${article.articleTime}"
						pattern="yyyy-MM-dd mm:hh" />
				</div>
				<hr />
			</div>
			<p align=center>${article.articleContent}</p>
			<div>
				<hr />
			</div>
			<div class="hrr">
			<ul class="nav nav-pills">
				<li>	
					<a href="personal/article/updateLike?id=${article.id }"><span class="glyphicon glyphicon-thumbs-up"></span><span class="badge pull-right">${article.articleLikeNum}</span></a>
				</li>
				<li>
					<a><span class="glyphicon glyphicon-eye-open"></span><span class="badge pull-right">${article.articleReadNum}</span></a>
				</li>
			</ul>
			</div>
			<br />
	</section>
	<!--评论列表开始-->
	<div class="row">
		<section class="panel">
			<div class="panel-title">最新动态</div>
		</section>
	</div>
	<div class="row" id="ajaxCommentArticle">
		<section class="panel">
			<div class="media">
				<a href="#" class="pull-left"><img src="img/people.jpg"
					height="50" width="50" class="media-object img-circle" alt='' /></a>
				<div class="media-body">
					<h4 class="media-heading">爱哭的毛毛虫：</h4>
					<div class="panel-body">Cras sit amet nibh libero, in gravida
						nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras
						purus odio, vestibulum in vulputate at, tempus viverra turpis.</div>
				</div>
			</div>
			<div class="panel-footer work-together-right">
				2017-4-5 22:10<a href="#">更多....</a>
			</div>
		</section>

		<c:if test="${commentArticles==null }">
			<jsp:forward
				page="/personal/commentarticle/findcommentarticle?articleId=${article.id }"></jsp:forward>
		</c:if>
		<c:forEach items="${commentArticles }" var="comArt">
		<section class="panel">
			<div class="media">
				<a href="#" class="pull-left"><img id="headPhoto" src="img/upload/personal/${comArt.userLoginId }/${comArt.userHeadImgPath}"
					height="50" width="50" class="media-object img-circle" alt='' /></a>
				<div class="media-body">
					<h4 class="media-heading">${comArt.userName }：</h4>
					<div class="panel-body">${comArt.commentArticleContent }</div>
				</div>
			</div>
			<div class="panel-footer work-together-right">
				<fmt:formatDate value="${comArt.commentArticleTime }"
						pattern="yyyy-MM-dd HH:mm" /><a href="#">更多....</a>
			</div>
		</section>
		</c:forEach>
	</div>
	<!--评论列表结束-->
	<div class="row">
		<!--发表状态小节-->
		<section class="panel">
			<div class="panel-heading">评论</div>
			<div class="panel-body">
				<form action="personal/commentarticle/addcommentarticle">
					<input type="hidden" name="articleId" value="${article.id }" />
					<div class="form-group">
						<textarea id="saytext" name="commentArticleContent"
							class="form-control" rows="5" placeholder="说点什么呗"></textarea>
					</div>
					<div class="form-group">
						<div class="col-sm-5">
							<span class="emotion">表情</span>
						</div>
						<div class="col-sm-offset-10">
							<input type="submit" id="sendCommentArticle"
								class="btn btn-success" value="发表" />
						</div>
					</div>
				</form>
			</div>
		</section>
		<!--//发表状态 -->
	</div>
</article>
<script type="text/javascript">
	/* $("#sendCommentArticle").click(function() {
		var ajaxCommentArticleId="#ajaxCommentArticle";
		$.ajax({
			url : "",
			dataType : "",
			success : function(data) {

			}
		});
	}); */
</script>

