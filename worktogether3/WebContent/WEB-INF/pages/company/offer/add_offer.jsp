<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
<title>发送面试邀请</title>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/main.css"/>
<link rel="stylesheet" href="thirdpart/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css"/>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="thirdpart/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="thirdpart/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>

<%@include file="/WEB-INF/pages/nav.jsp" %>
<div class="container">
	<div class="row clearfix">
		
		<div class="col-sm-3"><%@include file="/WEB-INF/pages/company/menu.jsp" %></div>
			
		<div class="col-sm-9 column">
			<div class="col-sm-10 col-sm-offset-0">
				<form class="form-horizontal" action="offer/add_offer" method="post" onsubmit="return checknull(this)" name="addOffer" id="addOffer">
					
					<div class="form-group">
				    	<label class="col-sm-2 control-label">招聘岗位</label>
				    	<div class="col-sm-7">					    			
				      		<input class="form-control" placeholder="请输入岗位" name="offerJob" id="offerJob">
				   		</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">面试时间</label>
						<div class="col-md-7">
							<input class="form-control form_datetime" placeholder="点击选择时间" name="offerInvitationTime" id="offerInvitationTime">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">邀请详情</label>
						<div class="col-sm-10">
							<textarea  class="ckeditor" name="offerContent" id="offerContent"></textarea>
						</div>
					</div>
				
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-2">
							<button class="btn btn-primary" type="submit" onClick="return Mycheck(this.form)">发送</button>
						</div>
						<div class="col-sm-2 col-sm-offset-6">
							<a class="btn btn-primary" href="offer/window_offer">返回</a>
						</div>
					</div>	
																			
				</form>	
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function Mycheck(form){
	if(document.addOffer.offerJob.value==""){
		alert("请填写岗位!");
		document.getElementById("offerJob").focus();
		return false;
	}else if(document.addOffer.offerInvitationTime.value==""){
		alert("请选择时间!");
		document.getElementById("offerInvitationTime").focus();
		return false;
	}else if(CKEDITOR.instances.offerContent.getData()==""){
		alert("请填写详细内容!");
		return false;
	}else{
		if(confirm("确定要发送吗？")){
			return true;
		}else{
			return false;
		}
	}	
}
</script>

<script type="text/javascript">
window.onload = function(){
	document.getElementById("offerJob").focus();
}
</script>

<script type="text/javascript">
$(function(){
	$("#offerInvitationTime").datetimepicker({
		format : 'yyyy-mm-dd hh:ii:00',
		language : 'zh-CN',
		startDate : '2017-01-01',
		autoclose : true,
		minView : 0
	});	
});
</script>

</body>
</html>