<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article class="col-md-12 work-together-dev-height-2000  work-together-shadow work-together-deep">
	<!--我的信息-->
	<section class="panel">
		<div class="main">
		<div class="col-md-12 column">
			<h3 align=center>${article.articleTitle}</h3>
			<div align=center>${article.articleTime}</div>
		</div>
		<p align=center>${article.articleContent}</p>
		<div>
			<hr />
		</div>
		<div class="hrr">
			<a href="personal/article/updateLike/${article.id }">赞:${article.articleLikeNum}</a>
			<div class="ppp">点击数：${article.articleReadNum}</div>
		</div>
	</div>

	<div class="comm-add clearfix">
		<div class="ava"></div>
		<textarea class="_textarea" name="Write your text..."
			placeholder="Write your text..."></textarea>
		<button class="_button">发表评论</button>
	</div>
	</section>
</article>

