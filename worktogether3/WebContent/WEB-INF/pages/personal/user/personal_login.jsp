<%@page import="java.util.Date"%>
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
<link href="css/login.css" rel="stylesheet" />
<link rel="shortcut icon" href="img/21495074072_.pic.png" mce_href="img/21495074072_.pic.png" type="image/x-icon" />
<!--<link href="css/main.css" rel="stylesheet" />-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet"
	href="thirdpart/dist/css/bootstrapValidator.min.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
#validateCodeToolTip {
	color: red;
}
</style>
</head>
<body>
	<!--wt-姓名首字母-相关文字-->
	<div class="container">
		<%@include file="/WEB-INF/pages/nav.jsp"%>
		<div class="row clearfix">
			<div class="col-sm-offset-4 col-sm-4 wrok-together-login-border">
				<div class="tabbable">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-login" data-toggle="tab">已有账号看这里</a></li>
						<li><a href="#panel-register" data-toggle="tab">没有账号看这里</a></li>
					</ul>
					<div class="tab-content">
						<!-- 用户登录 -->
						<div class="tab-pane active" id="panel-login">
							<form autocomplete="off" class="form-horizontal" method="post"
								action="personal/user/login" id="loginForm">
								<h3 class="form-signin-heading">欢迎个人用户登录</h3>
								<div class="form-group">
									<input autocomplete="off" type="text" id="userLoginId" class="form-control"
										name="userLoginId" required placeholder="手机号">
								</div>

								<div class="form-group">
									<input autocomplete="off" type="password" id="userPassword" class="form-control "
										name="userPassword" placeholder="密码" required>
									<c:if test="${errorInfo!=null }">
										<div id="validateCodeToolTip">${errorInfo }</div>
									</c:if>
								</div>
								<div class="form-group">
									<!--请求验证码---->
									<input type="text" id="validateCode" class="form-control "
										name="validateCode" placeholder="请输入验证码" required
										autocomplete="off" />
									<c:if test="${operatorInfo!=null }">
										<div id="validateCodeToolTip">${operatorInfo }</div>
									</c:if>
								</div>
								<img id="validateCode" alt="validateCode "
									src="admin/codeValidate?time=<%=new Date().getTime()%>" /> <a
									class="btn btn-default" href="javascript:void(0)" role="button"
									class="btn btn-primary btn-sm">看不清，换一张</a>
								<div class="form-group">
									<div class="checkbox col-md-12 ">
										<input name="re_remember" type="checkbox"
											onclick="remember();" id="remFlag">记住密码 <a href="#"
											class="col-md-offset-6">忘记密码？</a>
									</div>
								</div>
								<button class="btn btn-lg btn-success btn-block" type="submit">立即登录</button>
							</form>
						</div>
						<!-- 用户登录结束 -->
						<!-- 用户注册 -->
						<div class="tab-pane" id="panel-register">
							<form autocomplete="off" class="form-horizontal" method="post"
								action="personal/user/addUser" id="registerForm">
								<h3 class="form-signin-heading">欢迎个人用户注册</h3>
								<div class="form-group">
									<input autocomplete="off" type="text" id="userLoginId" class="form-control"
										name="userLoginId" placeholder="请输入常用手机号" required autofocus>
								</div>
								<div class="form-group">
									<label for="userPassword" class="sr-only">密码</label> <input
										autocomplete="off" type="password" id="userPassword" class="form-control"
										name="userPassword" placeholder="请输入密码" required>
								</div>
								<div class="form-group">
									<input autocomplete="off" type="password" id="confirmPassword"
										class="form-control" name="confirmPassword" placeholder="请再次输入密码"
										required>
								</div>
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
						<!-- 用户注册结束 -->
					</div>
				</div>
			</div>
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
	
		$(document).ready(function() {
			$("body").click(function() {
				$("#validateCodeToolTip").hide();
			});
			//记住密码功能
			var str = getCookie("loginInfo");
			if (str != null) {
				str = str.substring(1, str.length - 1);
				var userLoginId = str.split(",")[0];
				var userPassword = str.split(",")[1];
				//自动填充用户名和密码
				$("#userLoginId").val(userLoginId);
				$("#userPassword").val(userPassword);
			}
		});
		//获取cookie
		function getCookie(cname) {
			var name = cname + "=";
			var ca = document.cookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ')
				c = c.substring(1);
				if (c.indexOf(name) != -1)
					return c.substring(name.length, c.length);
			}
			return "";
		}
	
		//记住密码功能
		function remember() {
			var remFlag = $("input[type='checkbox']").is(':checked');
			if (remFlag == true) { //如果选中设置remFlag为1
				//cookie存用户名和密码,回显的是真实的用户名和密码,存在安全问题.
				var conFlag = confirm("记录密码功能不宜在公共场所(如网吧等)使用,以防密码泄露.您确定要使用此功能吗?");
				if (conFlag) { //确认标志
					$("#remFlag").val("1");
				} else {
					$("input[type='checkbox']").removeAttr('checked');
					$("#remFlag").val("");
				}
			} else { //如果没选中设置remFlag为""
				$("#remFlag").val("");
			}
		}
	
		$(document).ready(function() {
			$("#validateCode+a").click(function() {
				var path = "${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/";
				$("img").attr("src", path + "admin/codeValidate?time=" + new Date().getTime());
			});
	
			$("#loginForm").bootstrapValidator({
				message : '这个值不能通过验证！！',
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
								message : '用户名长度必须在{min}到{max}位之间'
							}
						}
					},
					userPassword : {
						validators : {
							stringLength : {
								min : 6,
								max : 50,
								message : '密码长度必须在6到50位之间'
							},
							regexp : {
								regexp : /^[a-zA-Z0-9_]+$/,
								message : '密码只能包含大写、小写、数字和下划线'
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
			$("#registerForm").bootstrapValidator({
				message : '这个值不能通过验证！',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					userLoginId : {
						//有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，11字符以上才开始）
						threshold : 11,
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							},
							regexp : {
								regexp : '^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$',
								message : '用户名应该是一个手机号码'
							}/* ,
							remote : {
								url : "personal/user/verificationUserLoginId",
								message : '用户名已被注册',
								delay : 5000,
								type : 'post'
							} */
						}
					},
					userPassword : {
						verbose : false, //多验证的情况下默认第一验证错误，则提示当前错误信息后面的验证不执行
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
