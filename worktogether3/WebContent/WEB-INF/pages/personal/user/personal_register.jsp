<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>首页</title>
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--<link href="css/main.css" rel="stylesheet" />-->
<link href="css/login.css" rel="stylesheet" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet"
	href="thirdpart/dist/css/bootstrapValidator.min.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<!--wt-姓名首字母-相关文字-->
	<div id="wt-hby-login">
		<%@include file="/WEB-INF/pages/nav.jsp"%>
		<div class="bs-docs-header wt-hby-login-center" id="content"
			tabindex="-1">
			<div class="container bs-docs-container">
				<form class="form-signin" method="post"
					action="personal/user/addUser" id="registerForm">
					<h2 class="form-signin-heading">还没有账号吗？</h2>
					<div class="form-group">
						<label for="userLoginId" class="sr-only">邮箱/手机号</label> <input
							type="text" id="userLoginId" class="form-control"
							name="userLoginId" placeholder="手机号" required autofocus>
					</div>
					<div class="form-group">
						<label for="userPassword" class="sr-only">密码</label> <input
							type="password" id="userPassword" class="form-control"
							name="userPassword" placeholder="密码" required>
					</div>
					<div class="form-group">
						<label for="confirmPassword" class="sr-only">确认密码：</label> <input
							type="password" id="confirmPassword" class="form-control"
							name="confirmPassword" placeholder="确认密码" required>
					</div>
					<!-- <div id="inputagree checkbox">
						<input name="acceptTerms" type="checkbox" /> 
					</div> -->
					<div class="form-group">
						<div class="col-md-offset-1 column">
							<div class="checkbox">
								<input type="checkbox" name="acceptTerms" /><a href="#">我已阅读并同意服务条款</a>
							</div>
						</div>
					</div>
					<button class="btn btn-lg btn-success btn-block" type="submit">个人用户注册</button>

				</form>
			</div>
		</div>
		<div class="wt-hby-login-bottom">
			<img src="img/1-1-2.jpg" /> <a class="back-to-top" href="#top">返回顶部</a>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="personal/js/jquery-3.1.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="thirdpart/dist/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript"
		src="thirdpart/dist/js/language/zh_CN.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#registerForm").bootstrapValidator({
				message : '这个值不能通过验证！',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					userLoginId : {
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},
							stringLength : {
								min : 6,
								max : 50,
								message : '用户名长度必须在6到50位之间'
							}
						}
					},
					userPassword : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							},
							stringLength : {
								min : 6,
								max : 50,
								message : '密码长度必须在6到50位之间'
							},
							regexp : {
								regexp : /^[a-zA-Z0-9_]+$/,
								message : '密码只能包含大写、小写、数字和下划线'
							},
							identical : {
								field : 'confirmPassword',
								message : '两次密码不一致'
							},
							different : {
								field : 'userLoginId',
								message : '密码不能和用户名相同'
							}
						}
					},
					confirmPassword : {
						validators : {
							notEmpty : {
								message : '确认密码不能为空'
							},
							stringLength : {
								min : 6,
								max : 50,
								message : '密码长度必须在6到50位之间'
							},
							regexp : {
								regexp : /^[a-zA-Z0-9_]+$/,
								message : '密码只能包含大写、小写、数字和下划线'
							},
							identical : {
								field : 'userPassword',
								message : '两次密码不一致'
							},
							different : {
								field : 'userLoginId',
								message : '密码不能和用户名相同'
							}
						}
					},
					acceptTerms : {
						validators : {
							notEmpty : {
								message : '你必须已阅读并同意服务条款'
							}
						}
					}
				}
			});
		});
	</script>
</body>
</html>
