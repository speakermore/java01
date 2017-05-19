<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="alert alert-success alert-dismissable">
	<button type="button" class="close" data-dismiss="alert"
		aria-hidden="true">×</button>
	<h4>注意!</h4>
	完善信息的后拥有更多权限. <a href="personal/user/gotoIndex" class="alert-link">点我返回首页</a>
</div>
<section class="panel">
	<form role="form" class="form-horizontal"
		action="personal/user/addUserOther" method="post"
		enctype="multipart/form-data" id="otherForm">
		<input type="hidden" name="userLoginId" value="${user.userLoginId }" /><br />
		<div class="form-group">
			<label for="userName" class="col-md-3 control-label">昵称：</label>
			<div class="col-md-8">
				<input class="form-control" name="userName" id="userName" />
			</div>
		</div>
		<div class="form-group">
			<label for="userGender" class="col-md-3 control-label">性别：</label>
			<div class="col-md-8">
				<div class="col-md-6">
					<input type="radio" name="userGender" id="userGender" value="1"
						checked="checked"> <label>男</label>
				</div>
				<div class="col-md-6">
					<input type="radio" name="userGender" id="userGender" value="0">
					<label>女</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="time" class="col-md-3 control-label">出生日期：</label>
			<div class="col-md-8">
				<input class="form_datetime form-control" placeholder="请选择日期"
					name="userBirthday" id="time" readonly type="text" />
			</div>
		</div>
		<div class="form-group">
			<label for="userEmail" class="col-md-3 control-label">邮箱：</label>
			<div class="col-md-8">
				<input class="form-control" name="userEmail" id="userEmail" />
			</div>
		</div>
		<div class="form-group">
			<label for="userHeadImgPath" class="col-md-3 control-label">头像：</label>
			<!-- userHeadImgPath -->
			<div class="col-md-8">
				<input class="form-control file" name="files" type="file"
					id="userHeadImgPath" multiple data-min-file-count="1" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-9">
				<input class="btn btn-success" type="submit" value="保存" /> <input
					class="btn btn-success" type="reset" value="重置" />
			</div>
		</div>
	</form>
</section>

<script type="text/javascript">
	$("#time").datetimepicker({
		format : 'yyyy-mm-dd',
		language : 'zh-CN',
		startDate : '1900-01-01', //选择器的开始日期
		autoclose : true,
		todayHighlight : true,
		minView : "month"
	});

	$("#userHeadImgPath").fileinput({
		uploadAsync : false,
		'language' : 'zh',
		'showUpload' : false,
		'previewFileType' : 'any'
	});

	$("#otherForm").bootstrapValidator({
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