<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="dropdown-menu">
	<li><a href="#">修改个人密码</a></li>
	<li><a href="personal/user/findById?id=${user.id }">修改个人资料</a></li>
	<c:if test="${user.userRealName=='无' }">
	<li><a href="personal/user/addUserReal">实名认证</a></li></c:if>
	<c:if test="${user.userName=='无' }">
	<li><a href="personal/user/addUserOther">完善资料</a></li></c:if>
	<li><a href="personal/common/initIndex?toPage=1&userId=${user.id }">查看个人信息</a></li>
	<li><a href="personal/resume/createResume">新建简历</a></li>
	<li><a href="personal/common/deleteRecord?userId=${user.id }">查看删除记录</a></li>
	<li><a href="#">查看消费记录</a></li>
	<li><a href="personal/user/findById?id=${user.id }">修改用户信息</a></li>
</ul>