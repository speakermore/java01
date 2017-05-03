<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div><%@include file="menu.jsp"%></div>
	<form  class="form-horizontal" action="admin/messagePush" method="post">
		<div class="col-sm-offset-2 col-sm-5">
						<!--工作对象-->
						<div class="form-group">
							<select class="form-control" name="sysmScope">
								<option value="1">所有人</option>
								<option value="2">个人用户</option>
								<option value="3">企业用户</option>
							</select>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="sysmContent" placehoder="请输入消息内容"></textarea>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-10" >
							<a id="modal-566287" href="#confirm-send"
								role="button" class="btn btn-success" data-toggle="modal">发送内容</a>
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
			
		</div>
	</form>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>