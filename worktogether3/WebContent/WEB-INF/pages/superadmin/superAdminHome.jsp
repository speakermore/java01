<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 
		导航菜单
	 -->
<div class="nav-main">
	<nav class="navbar navbar-inverse navbar-fixed-top work-together-background">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">管理员系统，欢迎${admin.adminLoginId}</a>
		</div>
	</nav>
	<div class="nav-box">
		<div class="nav">
			<ul class="nav-ul">
				<li><a class=""><span>&nbsp;</span></a></li>
				<li><a href="superAdmin/superAdminAddUser" class="develop"><span>新增管理员</span></a></li>
				<li><a href="superAdmin/findAllAdmin/${1}" class="news"><span>禁用管理员</span></a></li>
				<li><a href="admin/exit" class="home"><span>退出</span></a></li>
			</ul>
		</div>
	</div>
	</div>
