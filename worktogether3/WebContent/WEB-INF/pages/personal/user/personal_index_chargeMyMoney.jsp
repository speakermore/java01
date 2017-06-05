<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="panel">
	<div class="panel-body">
		<form action="personal/user/chargeMoney" class="form-horizontal"
			method="post">
			<input type="hidden" name="id" value="${user.id }" /><br />
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">充值</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-md-3 control-label">用户名：</label>
					<div class="col-md-8">
						<p class="form-control-static">${user.userName }</p>
					</div>
				</div>
				<div class="form-group">
					<label for="userMoney" class="col-md-3 control-label">充值金额：</label>
					<div class="col-md-8">
						<input class="form-control" name="userMoney" id="userMoney" />
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-success">保存</button>
			</div>
		</form>
	</div>
</section>