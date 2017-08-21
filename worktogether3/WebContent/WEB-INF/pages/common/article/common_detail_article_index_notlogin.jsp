<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page autoFlush="true" buffer="1024kb"%>
<!DOCTYPE html>
<!--
	作者：牟勇
	时间：2017-05-21
	描述：相职网首页
-->
<html lang="zh-CN">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="keywords" content="相职网,云南相职网,招聘网,招聘,软件开发,软件人才,软件公司,Java,网络招聘,${article.articleTitle }" />
    <meta name="referrer" content="always" />
    <meta name="robots" content="noindex,follow" />
    <meta name="description" content="相职网-专业提供软件人力资源解决方案"/>
    <base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
    <title>相职网-${article.articleTitle}</title>
	<link rel="shortcut icon" href="img/21495074072_.pic.png" mce_href="img/21495074072_.pic.png" type="image/x-icon" >
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	
  	<div><%@include file="/WEB-INF/pages/nav.jsp" %></div>
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
					<a href="javascript:void(0)"><span class="glyphicon glyphicon-thumbs-up"></span><span class="badge pull-right">${article.articleLikeNum}</span></a>
					</c:if>
					<c:if test="${isLike>0 }">
					<!-- 用户已点过赞 -->
					<a id="like-num" href="javascript:ajaxCancelLike(${article.id },${user.id })"><span class="glyphicon glyphicon-thumbs-up text-warning"></span><span class="badge badge-warning pull-right ">${article.articleLikeNum}</span></a>
					</c:if>
				</li>
				<!-- 点击次数 -->
				<li>
					<a href="javascript:void(0)"><span class="glyphicon glyphicon-eye-open"></span><span class="badge pull-right">${article.articleReadNum}</span></a>
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
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <div class="row">
    		<div class="col-sm-12"><%@include file="/WEB-INF/pages/copyright.jsp" %></div>
    	</div>
</body>
</html>