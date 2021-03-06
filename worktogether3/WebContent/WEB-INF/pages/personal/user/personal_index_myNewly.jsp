<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="panel">
	<div class="panel-heading">发表状态</div>
	<div class="panel-body">
		<form action="personal/mood/addMood" id="moodForm">
			<div class="form-group">
				<textarea style="resize: none;" name="moodContent" class="form-control" rows="5" placeholder="说点什么呗"></textarea>
			</div>
			<div class="form-group">
				<div class="col-sm-5">
					<span class="emotion">表情</span>
				</div>
				<div class="col-sm-offset-10">
					<input type="submit" class="btn btn-success" value="发表" />
				</div>
			</div>
		</form>
	</div>
</section>
<!--//发表状态 -->
<!--最新状态信息组-->
<div class="row">
	<section class="panel">
		<div class="panel-title">最新动态</div>
	</section>
	<!-- 面试邀请开始 -->
	<c:if test="${personal_offer!=null }">
		<section class="panel">
			<div class="panel-body">
				你收到@<a href="personal/common/gotoCompanyById?id=${personal_offer.companyId}">${personal_offer.companyName }</a>的职位邀请
				<a href="#">${personal_offer.offerJob }</a>
			</div>
			<div class="panel-footer work-together-right">
				1分钟前.<a href="#">更多....</a>
			</div>
		</section>
	</c:if>
	<!-- 面试邀请结束-->
	<!-- 文章信息开始 -->
	<c:if test="${articleByFollows!=null }">
		<c:forEach items="${articleByFollows }" var="abf">
			<section class="panel">
				<div class="panel-body">
					@<a href="#">${abf.userName}</a>发表了《<a href="#">${abf.articleTitle }</a>》
				</div>
				<div class="panel-footer work-together-right">
					1分钟前.<a href="#">更多....</a>
				</div>
			</section>
		</c:forEach>
	</c:if>
	<!-- 文章信息结束 -->
	<!-- 最新评论开始 -->
					<c:if test="${personal_articleByComments!=null }">
					<c:forEach items="${personal_articleByComments}" var="articleByComment">
					<section class="panel">
						<div class="panel-body">
							@<a href="#">${articleByComment.userName}</a>评论了《<a href="common/article/lookArticleById?id=${articleByComment.articleId}">${articleByComment.articleTitle }</a>》
						</div>
						<div class="panel-footer work-together-right">
							1分钟前.<a href="#">更多....</a>
						</div>
					</section>
					</c:forEach>
					</c:if>
					<!-- 最新评论结束 -->
	<section class="panel">
		<div class="panel-body">
			@xxx3回复了@xxx2对<<<a href="#">我的一天</a>>>的评论
		</div>
		<div class="panel-footer work-together-right">
			1分钟前.<a href="#">更多....</a>
		</div>
	</section>
	<section class="panel">
		<div class="panel-body">
			@xxx4赞了<<<a href="#">我的一天</a>>><span class="">(共10赞)</span>
		</div>
		<div class="panel-footer work-together-right">
			1分钟前.<a href="#">更多....</a>
		</div>
	</section>
</div>