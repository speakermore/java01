<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--发表状态小节-->
<section class="panel">
	<form role="form" class="form-horizontal" method="post"
		id="updatePasswordForm">
		<div class="form-group">
			<label for="usersPassword" class="col-md-3 control-label">密码：</label>
			<div class="col-md-8">
				<input type="password" class="form-control" id="usersPassword"
					name="userPassword" placeholder="密码" autocomplete="off"/>
			</div>
		</div>
		<div class="form-group">
			<label for="confirmPassword" class="col-md-3 control-label">确认密码：</label>
			<div class="col-md-8">
				<input type="password" class="form-control" id="confirmPassword"
					name="confirmPassword" placeholder="确认密码" autocomplete="off" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-9">
				<input class="btn btn-success" type="button"  onclick="ajaxFormUpdatePassword();"  value="完成" />
				<input class="btn btn-success" type="reset" value="重置" />
			</div>
		</div>
	</form>
</section>
<script type="text/javascript">
	function ajaxFormUpdatePassword(){
		var form = new FormData(document.getElementById("updatePasswordForm"));
		$.ajax({
            url:"personal/user/updateUserPasswordById",
            type:"post",
            data:form,
            dataType:"json",
            processData:false,
            contentType:false,
            success:function(data){
            	if (data.status=='success') {
            		alert("恭喜你，密码修改成功！");
            		window.location.href="personal/user/login";
				}else if(data.status=='error'){
					alert("很遗憾,密码修改失败！");
					window.location.href="personal/user/gotoIndex";
				} 
            }
        });        
	}

	$("#updatePasswordForm").bootstrapValidator({
		message : '这个值不能通过验证！！',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
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
		}
	});
</script>