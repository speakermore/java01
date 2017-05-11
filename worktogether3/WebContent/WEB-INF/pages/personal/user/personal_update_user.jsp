<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>用户中心-修改用户信息</title>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix ">
					<div class="col-md-1 column"></div>
					<div class="col-md-6 column ">
						<!--左侧状态栏位-->
						<article
							class="col-md-12 work-together-margin-left-30 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
							<div class="row">
								<!--发表状态小节-->
								<section class="panel">
									<form role="form" class="form-horizontal"
										action="personal/user/updateUser" method="post"
										id="updateUserForm">
										<input type="hidden" name="userLoginId" value="${user.id }" /><br />
										<div class="form-group">
											<label for="userHeadImgPath" class="col-md-3 control-label">头像：</label>
											<!-- userHeadImgPath -->
											<div class="col-md-8">
												<input class="form-control file" name="files" type="file"
													id="userHeadImgPath" multiple data-min-file-count="1" />
											</div>
										</div>
										<div class="form-group">
											<label for="userName" class="col-md-3 control-label">昵称：</label>
											<div class="col-md-8">
												<input class="form-control" name="userName" id="userName"
													value="${user.userName }" />
											</div>
										</div>
										<div class="form-group">
											<label for="usersPassword" class="col-md-3 control-label">密码：</label>
											<div class="col-md-8">
												<input type="password" class="form-control"  id="usersPassword"
													name="userPassword" placeholder="密码" />
											</div>
										</div>
										<div class="form-group">
											<label for="confirmPassword" class="col-md-3 control-label">确认密码：</label>
											<div class="col-md-8">
												<input type="password" class="form-control" id="confirmPassword"
													name="confirmPassword" placeholder="确认密码" />
											</div>
										</div>
										<div class="form-group has-success">
											<label for="userGender" class="col-md-3 control-label">性别：</label>
											<div class="col-md-8">
												<c:if test="${user.userGender==1 }">
													<div class="col-md-6 radio">
														<input type="radio" name="userGender" id="userGender" 
															value="1" checked="checked"> <label>男</label>
													</div>
													<div class="col-md-6 radio">
														<input type="radio" name="userGender" id="userGender" 
															value="0"> <label>女</label>
													</div>
												</c:if>
												<c:if test="${user.userGender==0 }">
													<div class="col-md-6 radio">
														<input type="radio" name="userGender" id="userGender" 
															value="1"> <label>男</label>
													</div>
													<div class="col-md-6 radio">
														<input type="radio" name="userGender" id="userGender" 
															value="0" checked="checked"> <label>女</label>
													</div>
												</c:if>
											</div>
										</div>
										<div class="form-group">
											<label for="userEmail" class="col-md-3 control-label">邮箱：</label>
											<div class="col-md-8">
												<input class="form-control" name="userEmail" id="userEmail"
													value="${user.userEmail }" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-offset-9">
												<input class="btn btn-success" type="submit" value="完成" />
												<input class="btn btn-success" type="reset" value="重置" />
											</div>
										</div>
									</form>
								</section>
							</div>
						</article>
					</div>
					<div class="col-md-4 column ">
						<%@include file="/WEB-INF/pages/personal/common/user_right.jsp"%>
					</div>
					<div class="col-md-1 column"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#userHeadImgPath").fileinput({
			uploadAsync : false,
			'language' : 'zh',
			'showUpload' : false,
			'previewFileType' : 'any'
		});
		$("#updateUserForm").bootstrapValidator({
			message : '这个值不能通过验证！！',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				userName : {
					validators : {
						notEmpty : {
							message : '昵称不能为空'
						},
						stringLength : {
							min : 2,
							max : 10,
							message : '昵称长度必须在2到10位之间'
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
						}
					}
				},
				userGender : {
					validators : {
						notEmpty : {
							message : '请选择性别'
						}
					}
				},
				userBirthday : {
					validators : {
						notEmpty : {
							message : '日期不能为空'
						}
					}
				},
				userEmail : {
					validators : {
						notEmpty : {
							message : '邮箱地址不能为空'
						},
						emailAddress : {
							message : '邮箱地址格式有误'
						}
					}
				},
				userHeadImgPath : {
					validators : {
						notEmpty : {
							message : '头像不能为空'
						}
					}
				}
			}
		});
	</script>
</body>

</html>