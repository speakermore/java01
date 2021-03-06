<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--左侧状态栏位-->
<div class="row">
	<!--发表状态小节-->
	<section class="panel">
		<form role="form" class="form-horizontal"
			 action="personal/user/updateUser"
			method="post" id="updateUserForm">
			<div class="form-group">
				<label for="userName" class="col-sm-3 control-label">昵称：</label>
				<div class="col-sm-8">
					<input class="form-control" name="userName" id="userName"
						value="${user.userName }" />
				</div>
			</div>
			<div class="form-group">
				<label for="time" class="col-sm-3 control-label">出生日期：</label>
				<div class="col-sm-8">
					<input class="form_datetime form-control" placeholder="请选择日期"
						name="userBirthday" id="time" readonly type="text"
						value="<fmt:formatDate
						value="${user.userBirthday }" pattern="yyyy-MM-dd" />" />

				</div>
			</div>
			<div class="form-group has-success">
				<label for="userGender" class="col-sm-3 control-label">性别：</label>
				<div class="col-sm-8">
					<c:if test="${user.userGender==1 }">
						<div class="col-sm-6 radio">
							<input type="radio" name="userGender" id="userGender" value="1"
								checked="checked"> <label>男</label>
						</div>
						<div class="col-sm-6 radio">
							<input type="radio" name="userGender" id="userGender" value="0">
							<label>女</label>
						</div>
					</c:if>
					<c:if test="${user.userGender==0 }">
						<div class="col-sm-6 radio">
							<input type="radio" name="userGender" id="userGender" value="1">
							<label>男</label>
						</div>
						<div class="col-sm-6 radio">
							<input type="radio" name="userGender" id="userGender" value="0"
								checked="checked"> <label>女</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<label for="userEmail" class="col-sm-3 control-label">邮箱：</label>
				<div class="col-sm-8">
					<input class="form-control" name="userEmail" id="userEmail"
						value="${user.userEmail }" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-9">
					<input class="btn btn-success" type="submit" value="完成" />
					<input class="btn btn-success" type="reset" value="重置" />
				</div>
			</div>
		</form>
	</section>
</div>
<script type="text/javascript">
	$("#time").datetimepicker({
		format : 'yyyy-mm-dd',
		language : 'zh-CN',
		startDate : '1900-01-01', //选择器的开始日期
		autoclose : true,
		todayHighlight : true,
		minView : "month"
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