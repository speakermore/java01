<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业注册</title>
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<%@include file="/WEB-INF/pages/company/footer.jsp"%>

</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-sm-3">
				
			</div>
			<div class="col-sm-6">
				<h3>企业用户注册</h3>
				<hr />
			
			
				<form class="form-horizontal" role="form"
					action="company/company/addCompany" method="post" id="addCompany">
					<div class="form-group">
						<div class="col-sm-3">公司手机:</div>
						<div class="col-sm-7">
							<input type="text" class="form-control"
								id="exampleInputPassword1" name="companyLoginId" autocomplete="off"/>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-3">密码:</div>
						<div class="col-sm-7">
							<input type="password" class="form-control"
								id="exampleInputPassword1" name="companyPassword" autocomplete="off"/>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-3">确认密码:</div>
						<div class="col-sm-7">
							<input type="password" class="form-control"
								id="exampleInputPassword1" name="realCompanyPassword" autocomplete="off"/>
						</div>
					</div>



					<!-- <form action="company/company/addCompany" method="post">
			<input type="text" name="companyLoginId"><br/>
			密码:<input type="password" name="companyPassword"><br/>
			确认密码:<input type="password" name="realCompanyPassword"><br/> -->
					<!-- 公司名称:<input type="text" name="companyName"><br/>
			公司简称:<input type="text" name="companySimpleName"><br/>
			公司logo:<input type="text" name="companyLogo"><br/>
			公司营业执照:<input type="text" name="companyLicenseImg"><br/>
			公司营业执照码:<input type="text" name="companyLicenseNo"><br/>
			公司法人:<input type="text" name="companyCorporator"><br/>
			公司电话:<input type="text" name="companyTel"><br/>
			公司电子邮件:<input type="text" name="companyEmail"><br/>
			公司地址:<input type="text" name="companyAddress"><br/>
			公司环境照片:<input type="text" name="companyDetailImg"><br/>
			公司状态:<input type="text" name="companyStatus">	<br/> -->
					<div class="col-sm-3">
						<button type="submit" class="form-control btn btn-success"
							style="color: black;">注册</button>
					</div>

				</form>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>
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
											message : 'This value is not valid',
											feedbackIcons : {/*输入框不同状态，显示图片的样式*/
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {/*验证*/
												companyLoginId : {/*键名username和input name值对应*/
													validators : {
														notEmpty : {/*非空提示*/
															message : '手机号码不能为空'
														},
														stringLength : {/*长度提示*/
															min : 6,
															max : 30,
															message : '用户名长度必须在6到30之间'
														} /*最后一个没有逗号*/,
														regexp : {//匹配规则
															regexp : /^0?(13[0-9]|15[012356789]|18[0-9]|17[0-9])[0-9]{8}$/,
															message : '请输入有效的手机号码'
														}
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