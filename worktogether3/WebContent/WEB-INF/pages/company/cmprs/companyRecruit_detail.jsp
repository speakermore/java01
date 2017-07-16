<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js"> </script>
    <title>${cmpr.cmpRecTitle }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet" />
	<link href="css/lrtk.css" rel="stylesheet" type="text/css" />
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    	textarea {
			resize:none;
			padding:5px; 
			border-radius:3px;
			box-shadow: inset 0 2px 3px rgba(0,0,0,0.2);
			border: solid 1px #ccc;
			box-sizing: border-box; 
		}
    </style>
  </head>
  
  <body>
  	<%@include file="/WEB-INF/pages/nav.jsp" %>
	<div class="container">
		<div class="row">
		<div class="col-sm-3">
			<c:if test="${user.id<1234567890 }">
				<%@include file="/WEB-INF/pages/company/menu.jsp" %>
			</c:if>
		</div>
		<div class="col-sm-9 column wt-hby-left">
			<div class="row clearfix">
				<div class="col-sm-12 column">
					<div class="row clearfix">
						<div class="col-sm-11 column">
							<div class="col-sm-12">
								<a href="company/artanddis/company_index">
									返回企业首页<em class="glyphicon glyphicon-send"></em>
								</a>
							</div>
							<div class="col-sm-12">
								<h2>${cmpr.cmpRecTitle }</h2>
							</div>
							<br />
							<div class="wt-hby-artdetail col-sm-12">
								${cmpr.cmpRecExperience }
							</div>
						</div>
					</div>
					<br />
					<table class="table">
						<tr>
							<th>
								<i class="glyphicon glyphicon-time"></i>&nbsp;<fmt:formatDate value="${cmpr.cmpRecTime }" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
								<a href="company/artanddis/company_index">
									<em class="glyphicon glyphicon-send"> 返回企业首页</em>
								</a>
							</th>
						</tr>
					</table>
				</div>
			</div>
   			<div>
   				<div class=" col-sm-5 column"></div>
   				<a href="#" class="cd-top">返回顶部</a>
   			</div>
		</div>
		</div>
	</div>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/lrtk.js"></script> 
  </body>

</html>