<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="alert alert-success alert-dismissable">
	<button type="button" class="close" data-dismiss="alert"
		aria-hidden="true">×</button>
	<h4>注意!</h4>
	实名认证通过后才能投递简历. <a href="personal/user/gotoIndex" class="alert-link">点我返回首页</a>
</div>
<section class="panel">
	<form role="form" class="form-horizontal"
		action="personal/user/addUserReal" method="post"
		enctype="multipart/form-data" id="realForm">
		<input type="hidden" name="userLoginId" value="${user.userLoginId }" /><br />
		<div class="form-group">
			<label for="userRealName" class="col-md-3 control-label">真实姓名：</label>
			<div class="col-md-8">
				<input class="form-control" name="userRealName" id="userRealName" />
			</div>
		</div>
		<div class="form-group">
			<label for="userIDCard" class="col-md-3 control-label">身份证号码：</label>
			<div class="col-md-8">
				<input class="form-control" name="userIDCard" id="userIDCard" />
			</div>
		</div>
		<div class="form-group">
			<label for="userIDImgFace" class="col-md-3 control-label">身份证正面图片：</label>
			<div class="col-md-8">
				<input class="form-control file" name="fileface" type="file"
					id="userIDImgFace" multiple data-min-file-count="1" />
			</div>
		</div>
		<div class="form-group">
			<label for="userIDImgCon" class="col-md-3 control-label">身份证反面图片：</label>
			<div class="col-md-8">
				<input class="form-control file" name="filecon" type="file"
					id="userIDImgCon" multiple data-min-file-count="1" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-8">
				<input class="btn btn-success" type="submit" value="保存" /> <input
					class="btn btn-success" type="reset" value="重置" />
			</div>
		</div>
	</form>
</section>
<script type="text/javascript">
	$("#userIDImgFace").fileinput({
		uploadAsync : false,
		'language' : 'zh',
		'showUpload' : false,
		'previewFileType' : 'any'
	});
	$("#userIDImgCon").fileinput({
		uploadAsync : false,
		'language' : 'zh',
		'showUpload' : false,
		'previewFileType' : 'any'
	});
	$("#realForm")
			.bootstrapValidator(
					{
						message : '这个值不能通过验证！！',
						feedbackIcons : {
							valid : 'glyphicon glyphicon-ok',
							invalid : 'glyphicon glyphicon-remove',
							validating : 'glyphicon glyphicon-refresh'
						},
						fields : {
							userRealName : {
								validators : {
									notEmpty : {
										message : '真实姓名不能为空'
									},
									stringLength : {
										min : 2,
										max : 10,
										message : '请输入正确姓名'
									},
									regexp : {
										regexp : (/[\u4e00-\u9fa5]/g),
										message : "请输入正确姓名"
									}
								}
							},
							userIDCard : {
								validators : {
									notEmpty : {
										message : '身份证号码不能为空'
									},
									regexp : {
										regexp : (/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/),
										message : "请输入正确的身份证号码"
									}
								}
							},
							fileface : {
								validators : {
									notEmpty : {
										message : '身份证正面图片不能为空'
									}
								}
							},
							filecon : {
								validators : {
									notEmpty : {
										message : '身份证反面图片不能为空'
									}
								}
							},
						}
					});
</script>