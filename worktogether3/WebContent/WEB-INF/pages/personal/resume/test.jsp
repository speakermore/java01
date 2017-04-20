<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<body>
	<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<a id="modal-education" href="#modal-container-education"
					role="button" class="btn" data-toggle="modal">触发遮罩窗体</a>
				<div class="modal fade" id="modal-container-education" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="personal/resume/CreateEducation" class="form-horizontal" method="post">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">标题</h4>
								</div>
								<div class="modal-body">

									<div class="form-group">
										<label for="educationSchool" class="col-md-3 control-label">学校名称：</label>
										<div class="col-md-8">
											<input class="form-control" name="educationSchool" id="educationSchool"/>
										</div>
									</div>
									<br/>
									<div class="form-group">
										<label for="educationContent" class="col-md-3 control-label">专业：</label>
										<div class="col-md-8">
											<input class="form-control" name="educationContent" id="educationContent"/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">日期：</label>
										<div class="col-md-4">
											<input class="form-control" name="educationBeginTime" size="30" type="text" id="datetimeStart" readonly class="form_datetime" placeholder="请选择起始日期">
										</div>
										<div class="col-md-4">
											<input class="form-control" name="educationEndTime"
										size="30" type="text" id="datetimeEnd" readonly
										class="form_datetime" placeholder="请选择结束日期">
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="submit" class="btn btn-success">保存</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
