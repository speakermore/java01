<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page autoFlush="true" buffer="1024kb"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员后台</title>

<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
</head>
<body>
	<%@include file="../menu.jsp"%>
	<div class="container">
	<!-- 充值 -->
	<div class="modal fade" id="modal-charge" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">充值</h4>
				</div>
				<!-- 充值表单 -->
					<div class="modal-body">
					<label class="alert alert-warning col-sm-12" id="charge-tip"></label>
					<form id="charge-form" action="admin/cmp/charge" class="form-horizontal" role="form" method="post">
						<input type="hidden" id="companyId" name="companyId" />
						<input type="hidden" name="adminId" value="${admin.id }" />
						<div class="form-group">
							<div class="col-sm-12">
								<div class="radio">
									<label>
										<input type="radio" name="money" value="1000" checked="checked" />
										充值1000，无优惠
									</label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="money" value="2100" />
										充值2000，送100额度
									</label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" name="money" value="3300" />
										充值3000，送300额度
									</label>
								</div>
							</div>
						</div>
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<input type="button" id="btn-charge" class="btn btn-primary" value="充值" />
					</div>
				
			</div>
		</div>
	</div>
	
	<script>
	<!-- 完成动态获得企业id并传递给表单的hidden元素 -->
	$('#modal-charge').on('show.bs.modal', function(e) {    
	    // 这里的btn就是触发元素，即你点击的删除按钮
	    var btn = $(e.relatedTarget),
	        companyId = btn.data("company-id"); 
	        $('#companyId').val(companyId);
	        $('#charge-tip').html('准备给&nbsp;<strong>'+btn.data('company-name')+'<strong>充值');
	  })
	  //充值的ajax提交
	  $('#btn-charge').click(function(){
		  var formData=$('#charge-form').serialize();
		  $.ajax({
			  url:'admin/cmp/charge',
			  data:formData,
			  type:'POST',
			  dataType:'html',
			  success:function(data){
				  alert(JSON.parse(data));
				  location.href='admin/cmp/find_all';
			  }
		  });
	  });
	</script>
	<!-- 充值结束 -->
		<!-- 主体内容 -->
		<div class="row">
			<div class="col-sm-offset-1 col-sm-11">
				<!-- 企业信息列表 -->
				<section class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">企业信息列表</h3>
					</div>
					<div class="panel-body">
					<table class="table table-hover table-striped">
						<thead>
						<tr>
							<th>公司id</th>
							<th>公司名称</th>
							<th>公司简称</th>
							<th>公司余额</th>
							<th>是否在招聘</th>
							<th>是否在众筹</th>
							<th>资质审核</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
							<!-- 加入显示数组 -->
							<c:set var="COMPANY_RECRUIT_STATUS" value="${CommonStatus.COMPANY_RECRUIT_STATUS }"></c:set>
							<c:set var="USER_CROWDFUND_STATUS" value="${CommonStatus.USER_CROWDFUND_STATUS }"></c:set>
							<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
							<c:forEach items="${companies}" var="cmp" varStatus="status">
							<tr>
								<td>${cmp.id}</td>
								<td>${cmp.companyName}</td>
								<td>${cmp.companySimpleName}</td>
								<td>${cmp.companyMoney}额度</td>
								<td>${COMPANY_RECRUIT_STATUS[cmp.userIsRecruit] }</td>
								<td>${USER_CROWDFUND_STATUS[cmp.userIsCrowdFund] }</td>
								<td>${AUDIT_STATUS[cmp.companyStatus] }</td>
								<td><a title="充值" data-toggle="modal" data-company-name="${cmp.companyName}" data-company-id="${cmp.id }" href="#modal-charge" class="btn btn-success btn-sx">充值</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</section>
				<!-- 企业信息列表结束 -->
			</div>
			<!-- 主体内容结束 -->
		</div>
	</div>
	
</body>
</html>