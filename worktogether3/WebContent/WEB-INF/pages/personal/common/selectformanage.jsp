<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="dropdown-menu">
	<li><a href="#">修改个人密码</a></li>
	<li><a href="personal/user/findById?id=${user.id }">修改个人资料</a></li>
	<li><a href="personal/user/addUserReal">实名认证</a></li>
	<li><a href="personal/user/addUserOther">完善资料</a></li>
	<li><a
		href="personal/common/initIndex?toPage=1&userId=${user.id }">查看个人信息</a></li>
	<li><a href="personal/resume/createResume">新建简历</a></li>
	<li><a href="personal/common/deleteRecord?userId=${user.id }">查看删除记录</a></li>
</ul>