<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<title>企业用户-首页</title>
<%@include file="/WEB-INF/pages/company/footer.jsp"%>
</head>
<body>
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
							<form autocomplete="off" class="form-horizontal" action="company/company/login"
								method="post" id="login">
								<h3 class="form-signin-heading">欢迎企业用户登录</h3>
								<div class="form-group">
									<input autocomplete="off" type="text" id="companyLoginId" class="form-control"
										name="companyLoginId" required placeholder="手机号" value="${companyLoginId }">
								</div>
								<div class="form-group">
									<input type="password" id="companyPassword"
										autocomplete="off" class="form-control" name="companyPassword" placeholder="密码"
										required>
								</div>

								<div class="form-group">
									<!--请求验证码---->
									<input type="text" id="validateCode" class="form-control"
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


								<div class="checkbox col-md-12">
									<input name="remFlag" type="checkbox" onclick="remember();"
										id="remFlag">记住密码 <a href="#" class="col-md-offset-6">忘记密码？</a>
								</div>
								<button class="btn btn-lg btn-success btn-block" type="submit">立即登录</button>
							</form>
						</div>
						<!-- 用户登录结束 -->
						<!-- 用户注册 -->
						<div class="tab-pane" id="panel-register">
							<form autocomplete="off" class="form-horizontal" role="form"
								action="company/company/addCompany" method="post"
								id="addCompany">
								<h3 class="form-signin-heading">欢迎企业用户注册</h3>
								<div class="form-group">
									<input autocomplete="off" placeholder="请输入联系人手机号（即以后的登录账号）" type="text"
										class="form-control" id="companyLoginId"
										name="companyLoginId" autocomplete="off" />
								</div>

								<div class="form-group">
									<input autocomplete="off" placeholder="请输入密码" type="password" class="form-control"
										id="companyPassword" name="companyPassword"
										autocomplete="off" />
								</div>
								<div class="form-group">
									<input autocomplete="off" placeholder="确认密码" type="password" class="form-control"
										id="realCompanyPassword" name="realCompanyPassword"
										autocomplete="off" />
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-lg btn-success btn-block">注册</button>
								</div>

							</form>
						</div>
						<!-- 用户注册结束 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../footer.jsp"%>
</body>
<script type="text/javascript">
	$("#validateCode+a")
		.click(
			function() {
				var path = "${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/";
				$("img")
					.attr(
						"src",
						path
						+ "admin/codeValidate?time="
						+ new Date().getTime());
			});
	$(document).ready(function() {
		//记住密码功能
		var str = getCookie("loginInfo");
		str = str.substring(1, str.length - 1);
		var companyLoginId = str.split(",")[0];
		var companyPassword = str.split(",")[1];
		//自动填充用户名和密码
		$("#companyLoginId").val(companyLoginId);
		$("#companyPassword").val(companyPassword);
	});

	//获取cookie
	function getCookie(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') c = c.substring(1);
			if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
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
		/* *
		 * 下面是进行插件初始化
		 * 你只需传入相应的键值对
		 * */
		$('#login').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : { /*输入框不同状态，显示图片的样式*/
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				companyLoginId : {
					validators : {
						notEmpty : {
							message : '手机号不能为空！'
						},
						StringLength : {
							min : 13,
							max : 13,
							message : '公司电话不能为空'
						},
						regexp : { //匹配规则
							regexp : /^0?(13[0-9]|15[012356789]|18[0-9]|17[0-9])[0-9]{8}$/,
							message : '请输入有效的手机号码'
						}
					}
				},
				companyPassword : {
					validators : {
						notEmpty : {
							message : '密码不能为空！'
						},
						StringLength : {
							min : 0,
							max : 6,
							message : '请输入至少6位密码'
						}
					}
				},
				validateCode:{
					validators : {
						notEmpty : {
							message : '验证码不能为空！'
						}
					}
				}
			}
		});
	});
</script>
<script type="text/javascript">
	$(document)
		.ready(
			function() {
				/**
				 * 下面是进行插件初始化
				 * 你只需传入相应的键值对
				 * */
				$('#addCompany')
					.bootstrapValidator(
						{
							message : '请填写正确的信息',
							feedbackIcons : { /*输入框不同状态，显示图片的样式*/
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : { /*验证*/
								 companyLoginId : { /* 键名username和input name值对应 */
									validators : {
										notEmpty : { /* 非空提示 */
											message : '手机号码不能为空'
										},
										stringLength : { /* 长度提示 */
											min : 6,
											max : 30,
											message : '用户名长度必须在6到30之间'
										} /* 最后一个没有逗号 */
										
										 /* remote: {
											url:"company/company/verificationCompanyLoginId",
											message: '用户名已被注册',
											delay: 5000,
											type : 'post'
										} */ 
									}
								}, 

								companyPassword : {
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
											field : 'realCompanyPassword',
											message : '两次密码不一致'
										},
										different : {
											field : 'companyLoginId',
											message : '密码不能和账号相同'
										}
									}
								},
								realCompanyPassword : {
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
											field : 'companyPassword',
											message : '两次密码不一致'
										},
										different : {
											field : 'companyLoginId',
											message : '密码不能和账号相同'
										}
									}
								}
							}
						});
			});
</script>
</html>
