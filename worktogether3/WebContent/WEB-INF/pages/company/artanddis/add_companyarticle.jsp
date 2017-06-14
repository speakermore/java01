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
	<link href="thirdpart/dist/css/bootstrapValidator.min.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
  	<%@include file="/WEB-INF/pages/nav.jsp" %>
	<div class="container">
		<div class="col-sm-8 column">
			<div id="alert" class="alert alert-success hidden">
				成功发表文章！等待管理员审核通过！
				<a href="">1、返回企业首页</a>
				<a href="">2、接着发表新文章</a>
			</div>
			<form action="company/artanddis/add_companyarticle" method="post" role="form" 
				class="form-horizontal" id="addArt">
				<div class="form-group">
    				<label for="titlename" class="col-sm-2 control-label" id="titlename">文章标题</label>
    			<div class="col-sm-5">
      				<input type="text" class="form-control" id="titlename" placeholder="请输入标题" name="articleTitle"
      					data-bv-notempty="true"	data-bv-notempty-message="标题不能为空!"
						data-bv-stringlength="true" data-bv-stringlength-min="2" data-bv-stringlength-max="20" 
						data-bv-stringlength-message="标题请输入至少2-20个字!">
    			</div>
  				</div>
					<div class="form-group">
					   <label for="keyname" class="col-sm-2 control-label" id="keyname">关键字</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="keyname" placeholder="请输入关键字" name="articleKey"
							data-bv-notempty="true"	data-bv-notempty-message="关键字不能为空!"
							data-bv-stringlength="true" data-bv-stringlength-min="2" data-bv-stringlength-max="10" 
							data-bv-stringlength-message="请输入至少2-10个关键字!">
					</div>
				</div>
				<br />
		    	<textarea name="articleContent" rows="10" cols="100"></textarea><br />
		  		<input type="submit" value="发表" class="btn btn-warning" />
		  		<div class=" col-sm-11 column"></div>
   			</form>
   			
		</div>
	</div>
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  	<!-- Include all compiled plugins (below), or include individual files as needed -->
  	<script src="js/bootstrap.min.js"></script>
  	<script type="text/javascript"
		src="thirdpart/dist/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript"
		src="thirdpart/dist/js/language/zh_CN.js"></script>
  	<script type="text/javascript">
	    $(document).ready(function(){  
	    	CKEDITOR.replace('articleContent'); 
	    });  
    </script>
   
	<!-- <script type="text/javascript">
    	$(document).ready(function(){
    		var id=document.getElementById("titlename").value;
    		$.ajax({
    			url:"company/artanddis/article/findid?id="+id,
    			type:"POST",
    			data:"id="+id,
    			success:function(data){
				     if(data){
				         $("#alert").attr("class","alert alert-danger");
				     }
			     }
    		});
    	});
    </script> -->
    <!-- 添加文章验证 -->
    <script type="text/javascript">
    	$(document).ready(function(){
	    	$('#addArt').bootstrapValidator({
		    	message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        }
	        });
    	});
    </script>
  </body>
</html>
