<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page autoFlush="true" buffer="1024kb"%>
<!DOCTYPE html>
<!-- 
	作者：牟勇
	时间：2017-08-28
	描述：公司的简介页面，用于首页的链接跳转（用户尚未登录）
 -->
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="keywords" content="相职网,云南相职网,招聘网,招聘,软件开发,软件人才,软件公司,Java,网络招聘,${company.companyName },${company.companySimpleName }" />
    <meta name="referrer" content="always" />
    <meta name="robots" content="noindex,follow" />
    <meta name="description" content="相职网-专业提供软件人力资源解决方案"/>
    <base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
	<title>相职网-企业简介-${company.companyName }</title>
	<link rel="shortcut icon" href="img/21495074072_.pic.png" mce_href="img/21495074072_.pic.png" type="image/x-icon" >
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/magnifier.css" rel="stylesheet" type="text/css" />
	<link href="css/main.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/jquery-3.1.1.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="personal/js/jquery.raty.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-typeahead.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/magnifier.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/main.js" charset="UTF-8"></script>
    <style type="text/css">
  	textarea {
	resize:none;
	padding:5px; 
	border-radius:3px;
	box-shadow: inset 0 2px 3px rgba(0,0,0,0.2);
	border: solid 1px #ccc;
	box-sizing: border-box; 
}
.thumbnail>img{
	 height: 100px;
	 width: 100%;
}
.logo{
	height: 40px;
	width: auto;
}
#magnifier1{
	margin-left:110px; 
}
p{
	font-size: 15px;
	padding: 7px 0px;
}
h2{
	padding-top:7px;
}
</style>
</head>
<body>
	<!-- 导航条 -->
	<div><%@include file="/WEB-INF/pages/nav.jsp" %></div>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<img class="thumbnail" src="company/img/${company.companyLoginId }/${company.companyLogo}" />
			</div>
			<h2 class="col-sm-9" style="background-color:rgba(255,255,255,1)">
				${company.companyName}<small>(${company.companySimpleName })</small>
				<c:if test="${user!=null&&follow==null }">
				<a class="btn btn-default" role="button" href="javascript:addfollow(${company.id })">
				<span class="glyphicon glyphicon-plus"></span>关注
				</a>
				</c:if>
				<c:if test="${user!=null&&follow!=null }">
				<a class="btn btn-default" role="button" href="javascript:cancelfollow(${company.id })">
				<span class="glyphicon glyphicon-minus"></span>取消关注
				</a>
				</c:if>
			</h2>
			
		</div>
		<div class="row">
			<div class="col-sm-12">
				<p class="wt-hby-companyInt">
					${companyInt.cmpIntroduction }
				</p>
			</div>
		</div>
		<!-- 企业环境展示 -->	
		<div class="row">
			<div class="magnifier" id="magnifier1">
				<div class="magnifier-container">
					<div class="images-cover"></div>
					<!--当前图片显示容器-->
					<div class="move-view"></div>
					<!--跟随鼠标移动的盒子-->
				</div>
				<div class="magnifier-assembly">
					<div class="magnifier-btn">
						<span class="magnifier-btn-left">&lt;</span>
						<span class="magnifier-btn-right">&gt;</span>
					</div>
					<!--按钮组-->
					<div class="magnifier-line">
						<ul class="clearfix animation03">
							 <c:forEach items="${detailImgs }" var="imgs">
								<li>
									<div class="small-img">
										<img src="company/img/${company.companyLoginId }/${imgs.companyDetailImg}" />
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!--缩略图-->
				</div>
				<!-- <div class="magnifier-view"></div> -->
				<!--经过放大的图片显示容器-->
			</div>	
		</div>
		<!-- 企业环境展示结束 -->	
		<div class="panel-group" id="accordion">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
			  		<div class="panel-heading">
			   			<h4 class="panel-title"><a data-toggle="collapse" href="#recruit">招聘岗位</a></h4>
			  		</div>
			  		<div id="recruit" class="panel-collapse collapse">
			   			<div class="panel-body">
							<table class="table wt-hby-article">
								<thead>
									<tr>
										<th>招聘岗位</th>
										<th>发表日期</th>
										<th>招聘人数</th>
										<th>应聘人数</th>
									</tr>
								</thead>
								<tbody>
		   							<c:forEach items="${companyRecruits}" var="rec">
		   								<tr>
		   									<td>${rec.cmpRecTitle}</td>
		   									<td><fmt:formatDate value="${rec.cmpRecTime }" pattern="yyyy-MM-dd"/></td>
		   									<td>${rec.cmpRecPeople }</td>
		   									<td>${rec.resumeNumber }</td>
		   								</tr>
		   							</c:forEach>
								</tbody>
							</table>
						</div>
			  		</div>
				</div>
				<div class="panel panel-default">
			  		<div class="panel-heading">
			   			<h4 class="panel-title"><a data-toggle="collapse" href="#collapseThree">企业文章</a></h4>
			  		</div>
			  		<div id="collapseThree" class="panel-collapse collapse in">
			   			<div class="panel-body">
							<table class="table wt-hby-article">
								<thead>
									<tr>
										<th>文章名</th>
										<th>发表日期</th>
										<th><i class="glyphicon glyphicon-thumbs-up"></i></th>
										<th><i class="glyphicon glyphicon-user"></i></th>
									</tr>
								</thead>
								<tbody>
		   							<c:forEach items="${articles }" var="art">
		   								<tr>
		   									<td><a target="_blank" href="common/article/findArticleById/${art.id }/1">${art.articleTitle }</a></td>
		   									<td>
		   										<fmt:formatDate value="${art.articleTime }" pattern="yyyy-MM-dd"/>
		   									</td>
		   									<td>${art.articleLikeNum }</td>
		   									<td>${art.articleReadNum }</td>
		   								</tr>
		   							</c:forEach>
								</tbody>
							</table>
						</div>
			  		</div>
			  	</div>
				</div>
			</div>
<script type="text/javascript">
	  var hby_magnifier=function() {
		
		var magnifierConfig = {
			magnifier : "#magnifier1",//最外层的大容器
			width : 500,//承载容器宽
			height : 370,//承载容器高
			moveWidth : null,//如果设置了移动盒子的宽度，则不计算缩放比例
			zoom : 5//缩放比例
		};
	
		var _magnifier = magnifier(magnifierConfig);  
	
	/*magnifier的内置函数调用*/
	/*
		//设置magnifier函数的index属性
		_magnifier.setIndex(1);

		//重新载入主图,根据magnifier函数的index属性
		_magnifier.eqImg();
	*/
};
</script>
<script type="text/javascript">
	var hby_star=function(){
	    $("#star").raty({
	        score:function(){
	            return $(this).attr("value");
	        },
	        starOn:'img/star-on-big.png',
	        starOff:'img/star-off-big.png',
	        starHalf:'img/star-half-big.png',
	        readOnly:false,
	        halfShow:true,
	        size:34,
	        click: function(score) {
   				/* $.ajax({
   					url:"company/artanddis/discuss/add_companydiscuss",
   					data:{discussLevel:score}
   				}); */
   				$("#discussLevel").val(score);
 				} 
	    });
	};
</script>
<script type="text/javascript">
   	$(document).ready(function(){
			$("textarea").keyup(function(){
				var textarea=$("textarea");
				var wordstip=$("#wordstip");
				wordstip.html("你还可以输入<span style=\"color:red\">"+(140-$.trim(textarea.val()).length)+"</span>字");
      			if( $.trim(textarea.val()) == "" ){
 					$("input[type='submit']").attr("disabled","disabled");
			}else{
 					$("input[type='submit']").removeAttr("disabled");
			}
		});
	});
   </script>
<script type="text/javascript">
	$(document).ready(function(){
		var name = $(".wt-hby-companyInt");
		if(name.html().length > 150){
			name.html(name.html().substring(0,150)+"......");
		}
		
		hby_star();
		hby_magnifier();	
	});
</script>
	</div>
	<%@include file="/WEB-INF/pages/copyright.jsp" %>
</body>
</html>