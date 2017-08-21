<%@ page import="ynjh.common.util.CommonStatus" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
	<c:set var="RECRUIT_STATUS" value="${CommonStatus.USER_RECRUIT_STATUS }"></c:set>
	<c:set var="CROWDFUND_STATUS" value="${CommonStatus.USER_CROWDFUND_STATUS }"></c:set>
	<c:set var="PARTNER_STATUS" value="${CommonStatus.USER_PARTNER_STATUS }"></c:set>
	<article class="col-sm-12">
		<c:if test="${userMoreInfo!=null }">
			<div class="row">
				<div class="col-sm-6">
					<c:if test="${userMoreInfo.id>=1234567890 }">
					 <!-- 个人用户名片 -->
					<div class="thumbnail">
						<img class="img-thumbnail" onerror="javascript:this.src='img/head.gif'" src="img/upload/personal/${userMoreInfo.userLoginId }/${userMoreInfo.userHeadImgPath}" />
						<div class="caption">
							<h3 class="text-center">昵称：${userMoreInfo.userName }</h3>
							<c:if test="${moreInfoMood==null }">
							<pre>用户最近没啥心情</pre>
							</c:if>
							<c:if test="${moreInfoMood!=null }">
							<pre>${moreInfoMood.moodContent }</pre>
							</c:if>
							<c:if test="${moreInfoIsFollow==null }">
							<p class="text-center"><a title="点击添加关注" class="btn btn-primary btn-lg" role="button" href="javascript:addfollow(${userMoreInfo.id })">关注<span class="glyphicon glyphicon-plus"></span></a></p>
							</c:if>
							<c:if test="${moreInfoIsFollow!=null }">
							<p class="text-center"><a title="点击取消关注" class="btn btn-default btn-lg" role="button" href="javascript:cancelfollow(${userMoreInfo.id })">已关注<span class="glyphicon glyphicon-minus"></span></a></p>
							</c:if>
						</div>
						
					</div>
					<!-- 个人用户名片结束 -->
					</c:if>
					<c:if test="${userMoreInfo.id<1234567890 }">
					<!-- 企业用户名片 -->
					<div class="thumbnail">
						<img class="img-thumbnail" onerror="javascript:this.src='img/head.gif'" src="company/img/${userMoreInfo.companyLoginId }/${userMoreInfo.companyLogo}" />
						<div class="caption">
							<h3 class="text-center">公司简称：${userMoreInfo.companySimpleName }</h3>
							<c:if test="${moreInfoIsFollow==null }">
							<p class="text-center"><a title="点击添加关注" class="btn btn-primary btn-lg" role="button" href="javascript:addfollow(${userMoreInfo.id },${user.id })">关注<span class="glyphicon glyphicon-plus"></span></a></p>
							</c:if>
							<c:if test="${moreInfoIsFollow!=null }">
							<p class="text-center"><a title="点击取消关注" class="btn btn-default btn-lg" role="button" href="javascript:cancelfollow(${userMoreInfo.id },${user.id })">已关注<span class="glyphicon glyphicon-minus"></span></a></p>
							</c:if>
						</div>
					</div>
					<!-- 企业用户名片结束 -->
					</c:if>
				</div>
			</div>
		</c:if>
		<c:if test="${articles==null }">
		<h1 style="font-size: 40px;">用户尚未发表任何文章！</h1>
		</c:if>
		<c:if test="${userMoreInfo!=null }">
			<c:if test="${userMoreInfo.id>=1234567890 }">
			<p><strong>${userMoreInfo.userName }</strong>发表的文章如下</p>
			</c:if>
			<c:if test="${userMoreInfo.id<1234567890 }">
			<p><strong>${userMoreInfo.companySimpleName }</strong>发表的文章如下</p>
			</c:if>
		</c:if>
		<!-- 文章内容显示 -->
			<table class="table table-striped table-hover">
				<tr>
					<td width="13%">文章类型</td>
					<td>文章标题</td>
					<td>发表时间</td>
					<td>状态</td>
					<td>文章点击数</td>
					<td>文章点赞数</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${articles}" var="art">
				<c:if test="${userMoreInfo!=null }">
				<c:if test="${art.articleStatus==2 }">
				<!-- 别的用户通过审核的文章显示出来给用户看 -->
				<tr>
					<td>${art.articleType }</td>
					<td ><a title="${art.articleTitle }" href="javascript:ajaxPage('redirect:common/article/findArticleById/${art.id}')">${art.articleTitle }</a></td>
					<td><fmt:formatDate value="${art.articleTime }"/></td>
					<td>${AUDIT_STATUS[art.articleStatus]}</td>
					<td>${art.articleReadNum }</td>
					<td>${art.articleLikeNum }</td>
				</tr>
				</c:if>
				</c:if>
				<c:if test="${userMoreInfo==null&&art.usersId==user.id }">
				<!-- 只有在查看自己的文章的情况下才能进行删除 -->
				<tr>
					<td>${art.articleType }</td>
					<td><a href="javascript:ajaxPage('redirect:common/article/findArticleById/${art.id}/2')">${art.articleTitle }</a></td>
					<td><fmt:formatDate value="${art.articleTime }"/></td>
					<td>${AUDIT_STATUS[art.articleStatus]}</td>
					<td>${art.articleReadNum }</td>
					<td>${art.articleLikeNum }</td>
					<td><c:if test="${art.articleStatus==4}">
						<a href="javascript:ajaxPage('redirect:common/article/gotoUpdateArticle?id=${art.id }')">修改</a>|
						<a href="javascript:if(confirm('你确定真的要恢复这篇文章吗？')){ajaxPage('redirect:common/article/renewArticle/${art.id }')}">恢复</a>
						</c:if> <c:if test="${art.articleStatus==1||art.articleStatus==2||art.articleStatus==3}">
						<a href="javascript:ajaxPage('redirect:common/article/gotoUpdateArticle?id=${art.id }')">修改</a>|
						<a href="javascript:if(confirm('你确定真的要删除这篇文章吗？')){ajaxPage('redirect:common/article/deleteAricle/${art.id }')}">删除</a>
						</c:if>
					</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
			<!-- 文章内容显示 -->
		<c:if test="${userMoreInfo==null }">
		<!-- 查看自己的文章，显示新建文章按钮 -->
		<p>
			<a class="btn btn-primary" href="javascript:ajaxPage('common/article/common_add_article_index')">创建新的文章</a>
		</p>
		</c:if>
		<c:if test="${userMoreInfo!=null }">
		<!-- 查看别人的文章，显示返回按钮 -->
		<p>
			<a class="btn btn-default" href="personal/common/initIndex?userId=${user.id}">返回</a>
		</p>
		</c:if>
	
	</article>
