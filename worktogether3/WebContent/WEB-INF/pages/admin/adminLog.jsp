<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bootstrap下拉菜单（Dropdown）</title>
	<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
			/*鼠标悬停*/
			#click:hover{
				color:#fa941b;
				text-decoration:underline ;
			}
			#click1:hover{
				color:#fa941b;
				text-decoration:underline ;
			}
			#click2:hover{
				color:#fa941b;
				text-decoration:underline ;
			}
			
		</style>


</head>
<body>

<div class="dropdown" >
	<button type="button" class="btn dropdown-toggle" id="dropdownMenu1" 
			data-toggle="dropdown" style="background: #fa941b;">
		管理员操作记录查询
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
		<li role="presentation">
			<a id="click"  href="admin/findAdminLogAll"  >全部查询</a>
		</li>
		<li role="presentation">
			<a style="background:#fa941b ;" href="admin/findAdminLogByTime">时间段查询</a>
		</li>
		<li role="presentation">
			<a id="click1" role="menuitem"  href="admin/findAdminLogByTimeAndDoAndId" >全部类型查询</a>
		</li>
		<!--<li role="presentation" class="divider"></li>-->
		<li role="presentation">
			<a href="admin/findAdminLogByTimeAndDo" style="background:#fa941b ;">时间段/操作类型</a>
		</li>
		<li role="presentation">
			<a  id="click2"  href="admin/findAdminLogByTimeAndId" >时间段/操作人ID</a>
		</li>
	<li role="presentation">
			<a role="menuitem" href="admin/findAdminLogByIdAndDo" style="background:#fa941b ;" >操作人ID/操作类型查询</a>
		</li>
	</ul>
</div>

</body>
</html>