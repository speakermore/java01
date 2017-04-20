<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>发表企业文章</title>
    
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
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
  	<%@include file="/WEB-INF/pages/header.jsp" %>
	<div class="container">
		<div class="col-sm-8 column">
			<form action="company/artanddis/article/add_companyarticle" method="post" role="form" class="form-horizontal">
				<div class="form-group">
    				<label for="firstname" class="col-sm-2 control-label">文章标题</label>
    			<div class="col-sm-5">
      				<input type="text" class="form-control" id="titlename" placeholder="请输入标题" name="articleTitle">
    			</div>
  				</div>
					<div class="form-group">
					   <label for="lastname" class="col-sm-2 control-label">关键字</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="keyname" placeholder="请输入关键字" name="articleKey">
					</div>
				</div>
				<br />
		    	<textarea class="ckeditor" name="articleContent" rows="10" cols="100"></textarea><br />
		  		<input type="submit" value="发表" class="btn btn-warning" />
		  		<div class=" col-sm-10 column"></div>
   			</form>
		</div>
	</div>
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  	<!-- Include all compiled plugins (below), or include individual files as needed -->
  	<script src="js/bootstrap.min.js"></script>
  	<script type="text/javascript">
	    $(document).ready(function(){  
	    	CKEDITOR.replace('articleContent'); 
	    	
	    });  
	    
    </script>
  </body>
</html>
