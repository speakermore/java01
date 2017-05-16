<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link rel="stylesheet" type="text/css" href="company/css/xcConfirm.css"/>
		<script src="js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script src="company/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.sgBtn{width: 135px; height: 35px; line-height: 35px; margin-left: 10px; margin-top: 10px; text-align: center; background-color: #0095D9; color: #FFFFFF; float: left; border-radius: 5px;}
		</style>
</head>
<body>

	<script type="text/javascript">
		$(function(){
				var txt='${operatorInfo}';
				window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.info,{onOk:function(){
					location.href='${toPage}';
				}});
		});
				
			
	</script>
</body>
</html>