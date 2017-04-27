<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<a id="modal-education" href="#modal-container-education" role="button"
	class="btn" data-toggle="modal">添加项目记录</a>
<div class="modal fade" id="modal-container-education" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="personal/resume/CreateProject"
				class="form-horizontal" method="post" id="projectForm">
				<input type="hidden" name="resumeId" value="${resume.id }" /><br/>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加项目记录</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="projectName" class="col-md-3 control-label">项目名称：</label>
						<div class="col-md-8">
							<input class="form-control" name="projectName"
								id="projectName" />
						</div>
					</div>
					<div class="form-group">
						<label for="projectJob" class="col-md-3 control-label">项目岗位：</label>
						<div class="col-md-8">
							<input class="form-control" name="projectJob"
								id="projectJob" />
						</div>
					</div>
					<div class="form-group">
						<label for="projectDescription" class="col-md-3 control-label">项目描述：</label>
						<div class="col-md-8">
							<textarea class="form-control" name="projectDescription"
								id="projectDescription" /></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">日期：</label>
						<div class="col-md-4">
							<input class="form-control" name="projectBeginTime" size="30"
								type="text" id="datetimeStart2" readonly class="form_datetime"
								placeholder="请选择起始日期" />
						</div>
						<div class="col-md-4">
							<input class="form-control" name="projectEndTime" size="30"
								type="text" id="datetimeEnd2" readonly class="form_datetime"
								placeholder="请选择结束日期" />
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