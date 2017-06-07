<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>添加内容</title>
<!-- Bootstrap -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<%@include file="header.jsp"%>
</head>
<body>
	<%@include file="menu.jsp"%>
<!--发送消息对象-->
	<div class="col-sm-offset-1 col-sm-3">
		<form  class="form-horizontal" action="admin/messagePush" method="post">	
				<div class="col-sm-12">		
						<div class="form-group">
							<select class="form-control" name="sysmScope">
								<option value="1">所有人</option>
								<option value="2">个人用户</option>
								<option value="3">企业用户</option>
							</select>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="sysmContent" placehoder="请输入消息内容" style="height:220px;"></textarea>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-8" >
							<a id="modal-566287" href="#confirm-send"
								role="button" class="btn btn-success" data-toggle="modal">发送内容</a>
							</div>
						</div>
					</div>	
						<div class="modal fade" id="confirm-send" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">提示：</h4>
									</div>
									<div class="modal-body">你确定要发送了吗？</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-primary">确定</button>
									</div>
								</div>
							</div>
						</div>
		</form>
	</div>
<!-- 发送消息对象结束 -->
<!-- 历史消息列表 -->
	<c:if test="${sysMessages==null}">
		<jsp:forward page="/admin/findSysMessages"></jsp:forward>
	</c:if>	
	<div class="col-sm-8">
		<table class="table">
			<thead>
				<tr>
					<th>No:</th>
					<th>时间</th>
					<th>内容</th>
					<th>管理员</th>
				</tr>
			</thead>
			<tbody>
			<%int index=1; %>
				<c:forEach items="${sysMessages}" var="sysMessage">
					<c:if test="${sysMessage.sysmScope==1}"><!-- 全体用户消息效果 -->
						<tr style="background-color:#F0FFF0;">
							<td><%=index++%></td>
							<td><fmt:formatDate value="${sysMessage.sysmCreateTime}" pattern="yyyy年MM月dd日  HH时mm分ss秒" /></td>
							<td>${sysMessage.sysmContent}</td>
							<td>${sysMessage.adminLoginId}</td>
						</tr>
					</c:if>
					<c:if test="${sysMessage.sysmScope==2}"><!-- 个人用户消息效果 -->
						<tr style="background-color:#EEE8AA;">
							<td><%=index++%></td>
							<td><fmt:formatDate value="${sysMessage.sysmCreateTime}" pattern="yyyy年MM月dd日  HH时mm分ss秒" /></td>
							<td>${sysMessage.sysmContent}</td>
							<td>${sysMessage.adminLoginId}</td>
						</tr>
					</c:if>
					<c:if test="${sysMessage.sysmScope==3}"><!-- 企业用户消息效果 -->
						<tr style="background-color:#C6E2FF;">
							<td><%=index++%></td>
							<td><fmt:formatDate value="${sysMessage.sysmCreateTime}" pattern="yyyy年MM月dd日  HH时mm分ss秒" /></td>
							<td>${sysMessage.sysmContent}</td>
							<td>${sysMessage.adminLoginId}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<%@include file="footer.jsp"%>
</body>
</html>