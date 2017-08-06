<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-12">
	<div class="row">
		<div class="col-sm-12">
			<h2>
				您的余额：${user.companyMoney }
			</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-8 col-sm-4">
		<p>
			 <a class="form-control btn btn-success" href="javascript:ajaxPage('redirect:company/charge/chargeRecord/${user.id}')" class="form-control btn btn-success">消费记录</a>
		</p>
		</div>
	</div>
</div>