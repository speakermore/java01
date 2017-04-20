<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<a id="modal-work" href="#modal-container-work" role="button"
	class="btn" data-toggle="modal">添加工作记录</a>
<div class="modal fade" id="modal-container-work" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="personal/resume/CreateWork"
				class="form-horizontal" method="post">
				<input type="hidden" name="resumeId" value="${resume.id }" /><br/>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加工作记录</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="workFirmName" class="col-md-3 control-label">企业名称：</label>
						<div class="col-md-8">
							<input class="form-control" name="workFirmName"
								id="workFirmName" />
						</div>
					</div>
					<div class="form-group">
						<label for="workUnit" class="col-md-3 control-label">工作岗位：</label>
						<div class="col-md-8">
							<input class="form-control" name="workUnit"
								id="workUnit" />
						</div>
					</div>
					<div class="form-group">
						<label for="workDescription" class="col-md-3 control-label">工作描述：</label>
						<div class="col-md-8">
							<input class="form-control" name="workDescription"
								id="workDescription" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">日期：</label>
						<div class="col-md-4">
							<input class="form-control" name="workBeginTime" size="30"
								type="text" id="datetimeStart1" readonly class="form_datetime"
								placeholder="请选择起始日期">
						</div>
						<div class="col-md-4">
							<input class="form-control" name="workEndTime" size="30"
								type="text" id="datetimeEnd1" readonly class="form_datetime"
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