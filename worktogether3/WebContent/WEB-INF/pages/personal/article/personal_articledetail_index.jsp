<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article
	class="col-md-12 work-together-dev-height-2000  work-together-shadow work-together-deep">
	<!--我的信息-->
	<section class="panel">
		<div class="main">
			<div class="col-md-12 column">
				<h3 align=center>${article.articleTitle}</h3>
				<div align=right>
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
				<a href="personal/article/updateLike?id=${article.id }">赞:${article.articleLikeNum}</a>
				<div class="ppp">点击数：${article.articleReadNum}</div>
			</div>
			<br/>
		</div>

	</section>
	<div class="row">
		<section class="panel">
			<div class="panel-title">最新动态</div>
		</section>
	</div>
	<div class="row" id="ajaxCommentArticle">
		<section class="panel">
			<div class="panel-title"><img src="img/people.jpg">
				爱哭的毛毛虫：
			</div>
			<div class="panel-body">
				最新动态
			</div>
			<div class="panel-footer work-together-right">
				2017-4-5 22:10<a href="#">更多....</a>
			</div>
		</section>
		<c:if test="${commentArticles==null }">
			<jsp:forward page="/personal/commentarticle/findcommentarticle?articleId=${article.id }"></jsp:forward>
		</c:if>
		<c:forEach items="${commentArticles }" var="comArt">
		<section class="panel">
			<div class="panel-title"><img src="img/people.jpg">
				${user.userName }
			</div>
			<div class="panel-body">
				${comArt.commentArticleContent }
			</div>
			<div class="panel-footer work-together-right">
			<fmt:formatDate value="${comArt.commentArticleTime }"
										pattern="yyyy-MM-dd HH:mm" />
				<a href="#">更多....</a>
			</div>
		</section>
		</c:forEach>
	</div>
	<div class="row">
		<!--发表状态小节-->
		<section class="panel">
			<div class="panel-heading">评论</div>
			<div class="panel-body">
				<form action="personal/commentarticle/addcommentarticle">
				<input type="hidden" name="articleId" value="${article.id }" />
					<div class="form-group">
						<textarea id="saytext" name="commentArticleContent" class="form-control"
							rows="5" placeholder="说点什么呗"></textarea>
					</div>
					<div class="form-group">
						<div class="col-sm-5">
							<span class="emotion">表情</span>
						</div>
						<div class="col-sm-offset-10">
							<input type="submit" id="sendCommentArticle" class="btn btn-success" value="发表" />
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

