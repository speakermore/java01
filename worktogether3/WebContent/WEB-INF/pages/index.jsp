<%@ page language="java" import="ynjh.common.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page autoFlush="true" buffer="1024kb"%>
<!DOCTYPE html>
<!--
	作者：牟勇
	时间：2017-05-21
	描述：相职网首页
-->
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>相职网-首页</title>
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
    <style>
    		/* 职位分类的右边箭头图片 */
  		.panel>.panel-title>h4{
  			background: url("img/sidebar_01.jpg") no-repeat 95%;
  			color:#fa941b;
  		}
  		/* 激活样式，似乎没有用到 */
  		.work-together-active{
  			border-bottom: 2px solid #fe6000;
  			padding-bottom: 5px;
  		}
  		/* 拉近职位分类栏的上下间隔 */
  		.panel-body{
  			padding-top:13px;
  			padding-bottom:10px;
  		}
  		/*左侧边栏分栏标题,右侧灰色背景标题也在使用*/
  		.work-together-title{
  			font-size:18px;
    			font-family: 微软雅黑;
    			line-height: 38px;
    			background: #f6f6f6;
    			margin-bottom: 10px;
    			padding-left:5px;
    			padding-bottom:1px;
  		}
  		/* 在每一个栏名的标题名称下方加一条线 */
  		.work-together-title span{
  			font-size: 21px;
  			color: rgb(102, 102, 102);
  			border-bottom: 4px solid #fe6000;
  		}
  		/* 右侧边栏标题的数据重点提示 */
  		.work-together-title b{
  			color:#fe6000;
  		}
  		/* 左边栏企业Logo进行左浮动，以拉开和“更多”超链接的距离 */
  		.work-together-company-img{
  			float:left;
  		}
  		/* “更多”的字体样式与颜色 */
  		.work-together-more{
  			font-size:14px;
  			color:#eaeaea;
  		}
  		/* “更多”的鼠标浮动样式 */
  		.work-together-more:hover{
  			color:#fa941b;
  			text-decoration: none;
  		}
  		/* “最新资讯”列表拉开间隔 */
  		ol.panel-body li{
  			padding:10px 0px;
  		}
  	</style>
  	<style>
		/* 右侧banner的样式 */
		
		/* Carousel base class */
		.carousel {
		  height: 400px;
		  margin-bottom: 60px;
		}
		/* Since positioning the image, we need to help out the caption */
		.carousel-caption {
		  z-index: 10;
		}
		
		/* Declare heights because of positioning of img element */
		.carousel .item {
		  height: 400px;
		  background-color: #777;
		}
		.carousel-inner > .item > img {
		  position: absolute;
		  top: 0;
		  left: 0;
		  min-width: 100%;
		  height: 400px;
		}
		</style>
  </head>
  <body>
  	
  	<div><%@include file="nav.jsp" %></div>
	<div class="container-fluid">
		<div class="row">
			<!--左侧分类栏-->
			<div class="col-sm-3">
				<%@include file="common/index/index_left.jsp" %>
			</div><!--左侧分类栏结束-->
			<!--右侧分类栏-->
			<div class="col-sm-9">
				<!-- 搜索 -->
				<div class="row">
					<form action="" role="form" class="form-horizontal">
						<div class="form-group col-sm-10">
							<input name="key" class="form-control input-lg" placeholder="请输入关键字，多个关键字之间使用空格分隔" />
						</div>
						<div class="form-group col-sm-2">
							<input type="submit" class="form-control input-lg" value="搜索" />
						</div>
					</form>
				</div>
				<div class="row">
					<div class="col-sm-12">
							<ul class="list-inline">
								<li>热门搜索：</li>
								<li><a href="">软件工程师</a></li>
								<li><a href="">技术总监</a></li>
								<li><a href="">测试工程师</a></li>
								<li><a href="">Web前端工程师</a></li>
							</ul>
						
					</div>
				</div>
				<!-- 搜索结束 -->
				<!-- 广告banner -->
				<div class="row">
					<div class="col-sm-12">
					    <div id="myCarousel" class="carousel slide" data-ride="carousel">
					      <!-- Indicators -->
					      <ol class="carousel-indicators">
					        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					        <li data-target="#myCarousel" data-slide-to="1"></li>
					        <li data-target="#myCarousel" data-slide-to="2"></li>
					      </ol>
					      <div class="carousel-inner" role="listbox">
					        <div class="item active">
					          <img class="first-slide" src="img/1-1-1.jpg" alt="First slide">
					          <%-- <div class="container">
					            <div class="carousel-caption">
					              <h1>Example headline.</h1>
					              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
					              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
					            </div>
					          </div> --%>
					        </div>
					        <div class="item">
					          <img class="second-slide" src="img/1-1-2.jpg" alt="Second slide">
					          <!-- <div class="container">
					            <div class="carousel-caption">
					              <h1>Another example headline.</h1>
					              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
					              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
					            </div>
					          </div> -->
					        </div>
					        <div class="item">
					          <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
					          <div class="container">
					            <div class="carousel-caption">
					              <h1>个性化定制，被动求职</h1>
					              <p>企业能找到需要的人，个人能找到合适位置。桥梁</p>
					              <p><a class="btn btn-lg btn-primary" href="#" role="button">立即注册</a></p>
					            </div>
					          </div>
					        </div>
					      </div>
					      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					        <span class="sr-only">Previous</span>
					      </a>
					      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					        <span class="sr-only">Next</span>
					      </a>
					    </div>
					</div>
				</div>
			<!-- 广告banner结束 -->
				<!-- 软件人才 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="work-together-title">
							<span>软件人才</span>
						</div>
					</div>
				</div>
				<div class="row">
					<article class="panel col-sm-6 work-together-subtitle">
						<div class="panel-body">
							<div class="work-together-title">
								技术人才（<b>${countMasterResume}</b>人）
							</div>
							<ul type="square" class="work-together-list list-unstyled">
							<!-- 昵称，学历，岗位，工作年限 -->
							<c:forEach items="${masterResume }" var="mr">
								<li class="row"><a href=""><span class="col-sm-3">${mr.userName }</span><span class="col-sm-2">${mr.resumeEducation }</span><b class="col-sm-5">${mr.resumeJor }</b><span class="col-sm-2">${GetAge.getAgeTools(mr.resumeWorks) }年</span></a></li>
							</c:forEach>
							</ul>
						</div>
					</article>
					<article class="panel col-sm-6 work-together-subtitle">
						<div class="panel-body">
							<div class="work-together-title">
								管理人才（<b>${countMangeResume }</b>人）
							</div>
							<ul type="square" class="work-together-list list-unstyled">
							<!-- 昵称，学历，岗位，工作年限 -->
								<c:forEach items="${manageResume }" var="mr">
									<li class="row"><a href=""><span class="col-sm-3">${mr.userName }</span><span class="col-sm-2">${mr.resumeEducation }</span><b class="col-sm-5">${mr.resumeJor }</b><span class="col-sm-2">${GetAge.getAgeTools(mr.resumeWorks) }年</span></a></li>
								</c:forEach>
								
							</ul>
						</div>
					</article>
				</div>
				<!-- 软件人才结束 -->
				<!-- 名企招聘 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="work-together-title">
							<span>名企招聘</span>
						</div>
					</div>
				</div>
				<div class="row">
					<article class="panel col-sm-6 work-together-subtitle">
						<div class="panel-body">
							<div class="work-together-title">
								管理人才招聘（<b>${countManageRecuite }</b>职位）
							</div>
							<ul type="square" class="work-together-list list-unstyled">
								<!-- 工作地点，公司名称，招聘岗位，人数 -->
								<c:forEach items="${manageRecuite }" var="mr">
									<li class="row"><a href=""><span class="col-sm-3">${mr.cmpRecCity }</span><b class="col-sm-7">${mr.cmpRecTitle }</b><span class="col-sm-2">${mr.cmpRecPeople }人</span></a></li>
								</c:forEach>
							</ul>
						</div>
					</article>
					<article class="panel col-sm-6 work-together-subtitle">
						<div class="panel-body">
							<div class="work-together-title">
								技术人才招聘（<b>${countMasterReciute }</b>职位）
							</div>
							<ul type="square" class="work-together-list list-unstyled">
								<c:forEach items="${masterRecuite }" var="mr">
									<li class="row"><a href=""><span class="col-sm-3">${mr.cmpRecCity }</span><b class="col-sm-7">${mr.cmpRecTitle }</b><span class="col-sm-2">${mr.cmpRecPeople }人</span></a></li>
								</c:forEach>
							</ul>
						</div>
					</article>
				</div>
				<!-- 名企招聘结束 -->
				<!-- 技术众筹 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="work-together-title">
							<span>技术众筹</span>
						</div>
					</div>
				</div>
				<div class="row">
					<article class="panel col-sm-6 work-together-subtitle">
						<div class="panel-body">
							<div class="work-together-title">
								企业众筹（<b>${countCompanyCrowdfund }</b>项目）
							</div>
							<ul type="square" class="work-together-list list-unstyled">
							<!-- 众筹名称，众筹项目价值，发布者 -->
								<c:forEach items="${companyCrowdfund }" var="cc">
									<li class="row"><a href=""><span class="col-sm-3">${cc.crowdfundProjectName }</span><b class="col-sm-5">${cc.companyName }</b><span class="col-sm-4"><fmt:formatNumber value="${cc.crowdfundProjectMoney/10000.0 }" pattern="##,###,###.00"/>万元</span></a></li>
								</c:forEach>
							</ul>
						</div>
					</article>
					<article class="panel col-sm-6 work-together-subtitle">
						<div class="panel-body">
							<div class="work-together-title">
								个人众筹（<b>${countPersonalCrowdfund }</b>项目）
							</div>
							<ul type="square" class="work-together-list list-unstyled">
								<c:forEach items="${personalCrowdfund }" var="cc">
									<li class="row"><a href=""><span class="col-sm-3">${cc.crowdfundProjectName}</span><b class="col-sm-5">${cc.userName }</b><span class="col-sm-4"><fmt:formatNumber value="${cc.crowdfundProjectMoney/10000.0 }" pattern="##,###,###.00"/>万元</span></a></li>
								</c:forEach>
							</ul>
						</div>
					</article>
				</div>
				<!-- 技术众筹结束 -->
				<!-- 精品文章 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="work-together-title">
							<span>精品文章</span>
						</div>
					</div>
				</div>
				<div class="row">
					<article class="panel col-sm-6 work-together-subtitle">
						<div class="panel-body">
							<div class="work-together-title">
								企业文章（<b>${countCompanyArticle }</b>篇）
							</div>
							<ul type="square" class="work-together-list list-unstyled">
								<c:forEach items="${companyArticle }" var="ca">
									<li class="row"><a href=""><span class="col-sm-3">${ca.companyName }</span><b class="col-sm-5">${ca.articleTitle }</b><span class="col-sm-4"><i class="glyphicon glyphicon-thumbs-up"></i>${ca.articleLikeNum }<i class="glyphicon glyphicon-user"></i>${ca.articleReadNum }</span></a></li>
								</c:forEach>
							</ul>
						</div>
					</article>
					<article class="panel col-sm-6 work-together-subtitle">
						<div class="panel-body">
							<div class="work-together-title">
								个人文章（<b>${countPersonalArticle }</b>篇）
							</div>
							<ul type="square" class="work-together-list list-unstyled">
								<c:forEach items="${personalArticle }" var="pa">
									<li class="row"><a href=""><span class="col-sm-3">${pa.userName }</span><b class="col-sm-5">${pa.articleTitle }</b><span class="col-sm-4"><i class="glyphicon glyphicon-thumbs-up"></i>${pa.articleLikeNum }<i class="glyphicon glyphicon-user"></i>${pa.articleReadNum }</span></a></li>
								</c:forEach>
							</ul>
						</div>
					</article>
				</div>
				<!-- 精品文章结束 -->
			</div><!--右侧分类栏结束-->
		</div>
	</div>
	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
