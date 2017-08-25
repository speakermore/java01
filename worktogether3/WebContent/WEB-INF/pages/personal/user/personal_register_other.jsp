<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<article class="col-sm-12">
<div class="alert ${CommonStatus.USER_STATUS_STYLE[user.userStatus] } alert-dismissable">
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	<h4>注意!</h4>
	完善个人信息，让大家更好的认识你. <a href="personal/common/initIndex?userId=${user.id }" class="alert-link">点我返回首页</a>
</div>
<section class="panel panel-default">
	<div class="panel-heading">
		<div class="panel-title">完善信息</div>
	</div>
	<div class="panel-body">
	<form role="form" class="form-horizontal" action="personal/user/addUserOther" method="post" enctype="multipart/form-data" id="otherForm">
		<input type="hidden" name="id" value="${user.id }" />
		<div class="form-group">
			<label for="userName" class="col-md-3 control-label">昵称：</label>
			<div class="col-md-8">
				<input class="form-control" name="userName" id="userName" value="${user.userName }" />
			</div>
		</div>
		<div class="form-group">
			<label for="userGender" class="col-md-3 control-label">性别：</label>
			<div class="col-md-8">
				<label class="radio-inline">
					<input type="radio" name="userGender" id="userGender" value="1" ${user.userGender==1?"checked=\"checked\"":"" }> 男
				</label>
				<label class="radio-inline">
					<input type="radio" name="userGender" id="userGender" value="0" ${user.userGender==0?"checked=\"checked\"":"" }> 女
				</label>
			</div>
		</div>
		<div class="form-group">
			<label for="time" class="col-md-3 control-label">出生日期：</label>
			<div class="col-md-8">
				<input class="form_datetime form-control" value="<fmt:formatDate value="${user.userBirthday }" pattern="yyyy-MM-dd"/>"   placeholder="请选择日期" name="userBirthday" id="time" readonly type="text" />
			</div>
		</div>
		<div class="form-group">
			<label for="userEmail" class="col-md-3 control-label">邮箱：</label>
			<div class="col-md-8">
				<input class="form-control" name="userEmail" id="userEmail" value="${user.userEmail }" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-9">
				<input class="btn btn-success" type="submit" value="保存" />
				<input class="btn btn-success" type="reset" value="重置" />
			</div>
		</div>
	</form>
	</div>
</section>

<script type="text/javascript">
	$("#time").datetimepicker({
		format : 'yyyy-mm-dd',
		language : 'zh-CN',
		startDate : '1900-01-01', //选择器的开始日期
		autoclose : true,
		todayHighlight : true,
		minView : "month"
	}).on('hide',function(e) {  
        $('#otherForm').data('bootstrapValidator')  
        .updateStatus('userBirthday', 'NOT_VALIDATED',null)  
        .validateField('userBirthday');  
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
						max : 6,
						message : '昵称长度必须在2到6位之间'
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
			}
		}
	});
</script>
</article>