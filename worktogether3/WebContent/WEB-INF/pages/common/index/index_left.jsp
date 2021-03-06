<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 最新资讯 -->
<div class="work-together-title">
	<span>最新资讯</span>
</div>
<div class="panel">
	<ol class="panel-body list-unstyled">
		<c:forEach items="${sessionScope.newses10 }" var="news">
			<li class="work-together-cut-text"><fmt:formatDate value="${news.newsDate }" pattern="MM.dd"/><a href="admin/news/news/${news.id }" title="${news.newsTitle }">${news.newsType} ${news.newsTitle }</a></li>
		</c:forEach>
	</ol>
</div>
<!-- 最新资讯结束 -->
<!--推荐企业展示-->
<div class="work-together-title">
	<span>推荐企业</span>
</div>
<ul class="work-together-list list-unstyled">
<c:forEach items="${recommendCompanys}" var="cmp">
<li class="row"><a target="_blank" href="common/recommendCompanyDetail/${cmp.id}"><span class="col-sm-8 work-together-cut-text">${cmp.companySimpleName }</span><span class="col-sm-1"><i class="glyphicon glyphicon-duplicate" title="发表文章${cmp.articleNumber }篇"></i>${cmp.articleNumber }</span><span class="col-sm-1"><i class="glyphicon glyphicon-thumbs-up" title="文章总点赞${cmp.likeNum }人次"></i>${cmp.likeNum }</span><span class="col-sm-1"><i class="glyphicon glyphicon-eye-open" title="被${cmp.byFollowNumber }人关注"></i>${cmp.byFollowNumber }</span></a></li>
</c:forEach>
</ul>
<!--推荐企业展示结束-->
<!--推荐个人展示-->
<div class="work-together-title">
	<span>推荐个人</span>
</div>
<ul class="work-together-list list-unstyled">
<c:forEach items="${recommendUsers}" var="ru">
<li class="row"><a target="_blank" href="common/recommendPersonalDetail/${ru.id}"><span class="col-sm-8 work-together-cut-text">${ru.userName }</span><span class="col-sm-1"><i class="glyphicon glyphicon-duplicate" title="发表文章${ru.articleNumber }篇"></i>${ru.articleNumber }</span><span class="col-sm-1"><i class="glyphicon glyphicon-thumbs-up" title="文章总点赞${ru.likeNum }人次"></i>${ru.likeNum }</span><span class="col-sm-1"><i class="glyphicon glyphicon-eye-open" title="被${ru.byFollowNumber }人关注"></i>${ru.byFollowNumber }</span></a></li>
</c:forEach>
</ul>
<!--推荐个人展示结束-->