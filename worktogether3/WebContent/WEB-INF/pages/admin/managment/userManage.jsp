<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<!-- Bootstrap -->
<%@include file="../header.jsp"%>
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<script type="text/jscript" src="admin/js/jquery-1.10.2.min.js"></script> 
<script type="text/javascript" src="admin/js/bootstrap.js" ></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
	<body>
		<%@include file="../menu.jsp"%>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="tabbable" id="tabs-183201">
						<ul class="nav nav-tabs">
							<li>
								<a href="#panel-322984" data-toggle="tab">Section 1</a>
							</li>
							<li class="active">
								<a href="#panel-784612" data-toggle="tab">Section 2</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane" id="panel-322984">
								<p>
									I'm in Section 1.
								</p>
							</div>
							<div class="tab-pane active" id="panel-784612">
								<p>
									Howdy, I'm in Section 2.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
<%@include file="../footer.jsp"%>
</html>