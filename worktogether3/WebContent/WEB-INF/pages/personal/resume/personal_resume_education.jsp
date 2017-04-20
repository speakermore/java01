<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<a id="modal-project" href="#modal-container-project" role="button"
	class="btn" data-toggle="modal">添加教育记录</a>
<div class="modal fade" id="modal-container-project" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="personal/resume/CreateEducation"
				class="form-horizontal" method="post">
				<input type="hidden" name="resumeId" value="${resume.id }" /><br/>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加教育记录</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="educationSchool" class="col-md-3 control-label">学校名称：</label>
						<div class="col-md-8">
							<input class="form-control" name="educationSchool"
								id="educationSchool" />
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="educationContent" class="col-md-3 control-label">专业：</label>
						<div class="col-md-8">
							<input class="form-control" name="educationContent"
								id="educationContent" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">日期：</label>
						<div class="col-md-4">
							<input class="form-control" name="educationBeginTime" size="30"
								type="text" id="datetimeStart" readonly class="form_datetime"
								placeholder="请选择起始日期">
						</div>
						<div class="col-md-4">
							<input class="form-control" name="educationEndTime" size="30"
								type="text" id="datetimeEnd" readonly class="form_datetime"
								placeholder="请选择结束日期">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-success">保存</button>
				</div>
			</form>
		</div>
	</div>
</div>