<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>个人用户-首页</title>
</head>
<body>
	<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix work-together-margin-top-150">
					<div class="col-md-1 column"></div>
					<div class="col-md-6 column ">
						<!--左侧状态栏位-->
						<article
							class="col-md-12 work-together-margin-left-30 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
							<div class="row">
								<!--发表状态小节-->
								<section class="panel">
									<form role="form" class="form-horizontal"
										action="personal/user/addUserOther" method="post">
										<input type="hidden" name="userLoginId"
											value="${user.userLoginId }" /><br />
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
														<input type="radio" name="userGender" id="userGender"
															value="1" checked="checked"> <label>男</label>
													</div>
													<div class="col-md-6">
														<input type="radio" name="userGender" id="userGender"
															value="2"> <label>女</label>
													</div>
											</div>
										</div>
										<div class="form-group">
											<label for="time" class="col-md-3 control-label">出生日期：</label>
											<div class="col-md-8">
												<input class="form_datetime" placeholder="请选择日期"
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
											<div class="col-md-8">
												<input class="form-control" name="userHeadImgPath"
													id="userHeadImgPath" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-offset-9">
												<input class="btn btn-success" type="submit" value="下一步" />
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
	<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
	<script type="text/javascript">
		$("#time").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		});
	/* 	$("#time").blur(function() {
			alert(typeof ("#time"))
		}); */
		$('input').each(function() {
			var self = $(this), label = self.next(), label_text = label.text();
			label.remove();
			self.iCheck({
				checkboxClass : 'icheckbox_line-orange',
				radioClass : 'iradio_line-orange',
				insert : '<div class="icheck_line-icon"></div>' + label_text
			});
		});
	</script>

</body>

</html>