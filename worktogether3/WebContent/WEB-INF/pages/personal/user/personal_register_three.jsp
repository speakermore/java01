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
										action="personal/user/addUserReal" method="post">
										<input type="hidden" name="userLoginId"
											value="${user.userLoginId }" /><br />
										<div class="form-group">
											<label for="userRealName" class="col-md-3 control-label">真实姓名：</label>
											<div class="col-md-9">
												<input class="form-control" name="userRealName"
													id="userRealName" />
											</div>
										</div>
										<div class="form-group">
											<label for="userIDCard" class="col-md-3 control-label">身份证号码：</label>
											<div class="col-md-9">
												<input class="form-control" name="userIDCard"
													id="userIDCard" />
											</div>
										</div>
										<div class="form-group">
											<label for="userIDImgFace" class="col-md-3 control-label">身份证正面图片：</label>
											<div class="col-md-9">
												<input class="form-control" name="userIDImgFace"
													id="userIDImgFace" />
											</div>
										</div>
										<div class="form-group">
											<label for="userIDImgCon" class="col-md-3 control-label">身份证反面图片：</label>
											<div class="col-md-9">
												<input class="form-control" name="userIDImgCon"
													id="userIDImgCon" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-offset-8">
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
		$("#boy").click(function() {
			$("#userGender").val(1);
		});
		$("#girl").click(function() {
			$("#userGender").val(2);
		});
	</script>
</body>

</html>