<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<%-- 
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>用户中心-主页</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet" />
<link href="css/personal/bootstrap-datetimepicker.min.css" rel="stylesheet">
<title>教育记录</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link href="css/personal/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<script type="text/javascript" src="js/personal/bootstrap.min.js"></script>
<script type="text/javascript" src="js/personal/jquery-3.1.1.min.js"></script>
<script src="js/personal/bootstrap-datetimepicker.min.js"
	charset="UTF-8"></script>
<script src="js/personal/locales/bootstrap-datetimepicker.zh-CN.js"></script>

</head>
<body>
	<form action="personal/resume/CreateEducation" method="post">
		学校名称：<input type="text" name="educationSchool" /><br /> 教育描述：<input
			type="text" name="educationContent" /><br /> 日期： <input size="16"
			type="text" id="datetimeStart" readonly class="form_datetime"
			placeholder="请选择日期"> -- <input size="16" type="text"
			id="datetimeEnd" readonly class="form_datetime" placeholder="请选择日期">
		<br /> <input type="submit" value="创建" /> <input type="reset"
			value="重置" />
	</form>

	<script type="text/javascript">
		$("#datetimeStart").datetimepicker({
			format : 'yyyy-mm-dd hh:ii',
			language : 'zh-CN',
			startDate : '1900-01-01',//选择器的开始日期
			autoclose : true,
			startDate : new Date(),
			todayHighlight : true
		}).on(
				"click",
				function() {
					$("#datetimeStart").datetimepicker("setEndDate",
							$("#datetimeEnd").val())
				});
		$("#datetimeEnd").datetimepicker({
			format : 'yyyy-mm-dd hh:ii',
			language : 'zh-CN',
			startDate : '1900-01-01',//选择器的开始日期
			autoclose : true,
			startDate : new Date(),
			todayHighlight : true
		}).on(
				"click",
				function() {
					$("#datetimeEnd").datetimepicker("setStartDate",
							$("#datetimeStart".val()))
				});

		/*$('.date').datetimepicker({
		language: 'zh-CN',//显示中文
		format: 'yyyy-mm-dd',//显示格式
		minView: "month",//设置只显示到月份
		initialDate: new Date(),//初始化当前日期
		autoclose: true,//选中自动关闭
		todayBtn: true//显示今日按钮
		})  */
	</script>
</body> --%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>用户中心-教育记录</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet" />
<link href="css/personal/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
</head>

<body>
	<form action="personal/resume/CreateEducation" method="post">
		学校名称：<input type="text" name="educationSchool" /><br /> 
		教育描述：<textarea type="text" name="educationContent" class="ckeditor"/></textarea><br /> 
		日期： <input name="educationBeginTime" size="30" type="text" id="datetimeStart" readonly class="form_datetime"
			placeholder="请选择日期"> -- 
			<input name="educationEndTime" size="30" type="text"
			id="datetimeEnd" readonly class="form_datetime" placeholder="请选择日期">
		<br /> <input type="submit" value="创建" /> <input type="reset"
			value="重置" />
	</form>

	<script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js" ></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/personal/jquery-3.1.1.min.js"></script>
	<script type="text/javascript"
		src="js/personal/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="js/personal/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript">
		$("#datetimeStart").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#datetimeStart").datetimepicker("setEndDate",
							$("#datetimeEnd").val())
				});
		
		$("#datetimeEnd").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#datetimeEnd").datetimepicker("setStartDate",
							$("#datetimeStart").val())
				});
		/*  $(document).ready(function(){
			$("#datetimeEnd").click(function(){
				alert(typeof(1));
			});
		});  */
		
		window.onload=function(){
			
		}
		
		
		/*$('.date').datetimepicker({
		  language: 'zh-CN',//显示中文
		  format: 'yyyy-mm-dd',//显示格式
		  minView: "month",//设置只显示到月份
		  initialDate: new Date(),//初始化当前日期
		  autoclose: true,//选中自动关闭
		  todayBtn: true//显示今日按钮
		 })  */
	</script>
</body>
</html>