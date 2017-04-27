<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- html开始 -->
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理用户</title>
<%@include file="header.jsp"%>
</head>
<body>
	<div><%@include file="superAdminHome.jsp"%></div>
	<form action="/disableAdmin" method="post">
		<div class="col-md-offset-4">
			<div class="row">
				<div class="col-sm-10" style="border: 1px solid black">
					<div class="row" style="background-color: #CCCCCC;">
						<div class="col-sm-12">
							<h2>所有管理员：</h2>
							<section class="panel">
								<heading class="panel-heading"> <c:if
									test="${list==null}">
									<jsp:forward page="/superAdmin/findAllAdmin/0" />
								</c:if>
								<table>
									<tr class="tb">
										<td></td>
										<td>id</td>
										<td>账号</td>
										<td>电话</td>
										<td>邮箱</td>
										<td>昵称</td>
										<td>是否在线</td>
										<td>状态</td>
										<td>操作</td>
									</tr>
									<c:forEach items="${list}" var="list">
										<tr class="tb">
											<td><input name="id" type="checkbox" value="${list.id }"></input></td>
											<td>${list.id }</td>
											<td><a href="superAdmin/disableAdmin?id=${list.id}">${list.adminLoginId}
											</a></td>

											<td>${list.adminTel }</td>
											<td>${list.adminEmail }</td>
											<td>${list.adminName }</td>
											<td>${list.adminStatusNow }</td>
											<td>${list.adminStatus }</td>
											<td><a href="findId/${list.id}"></a> <a
												href="javascript:if(confirm('你确定要禁用吗？')){location.href='superAdmin/disableAdmin?adminStatus=1&id=${list.id}'}">恢复</a>|
												<a
												href="javascript:if(confirm('你确定要禁用吗？')){location.href='superAdmin/disableAdmin?adminStatus=0&id=${list.id}'}">禁用</a></td>
										</tr>
									</c:forEach>
								</table>
								</heading>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<%@include file="footer.jsp"%>
</body>
<!-- html结束 -->
</html>