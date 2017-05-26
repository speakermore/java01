<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
<title>发送面试邀请</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="thirdpart/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="thirdpart/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="thirdpart/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="thirdpart/ckeditor/ckeditor.js"></script>
</head>
<body>

<!-- 上边栏 -->
<%@include file="/WEB-INF/pages/nav.jsp" %>
<div class="container">
	<div class="row clearfix">
		
		<!-- 左边栏 -->
		<div class="col-sm-3"><%@include file="/WEB-INF/pages/company/menu.jsp" %></div>
		
		<!-- 填写offer -->
		<div class="col-sm-9">
			<div class="col-sm-10 col-sm-offset-0">
				<form class="form-horizontal" action="offer/add_offer" method="post" name="addOffer" id="addOffer">
					
					<div class="form-group">
				    	<label class="col-sm-2 control-label">招聘岗位</label>
				    	<div class="col-sm-6">					    			
				      		<input class="form-control" placeholder="请输入岗位" name="offerJob" id="offerJob" maxlength="20">
				   		</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">面试时间</label>
						<div class="col-md-6">
							<input class="form-control" placeholder="请选择时间" name="offerInvitationTime" id="offerInvitationTime" maxlength="10">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">详细内容</label>
						<div class="col-sm-6">
							<textarea  class="form-control" name="offerContent" id="offerContent"></textarea>
						</div>
					</div>
				
					<!-- 发送和返回 -->
					<div class="form-group">
						<div class="col-sm-1 col-sm-offset-2">
							<button class="btn btn-warning" type="submit" onClick="return check(this.form)">发送</button>
						</div>
						<div class="col-sm-1 col-sm-offset-8">
							<a class="btn btn-warning" href="javascript:history.back()">返回</a>
						</div>
					</div>
																		
				</form>	
			</div>
		</div>
	</div>
</div>

<script>
// 加载页面时焦点为招聘岗位
window.onload=function(){
	document.getElementById("offerJob").focus();
}

// 验证表单非空，空则焦点该输入框
function check(form){
	if(document.addOffer.offerJob.value==""){
		alert("请填写岗位!");
		document.getElementById("offerJob").focus();
		return false;
	}else if(document.addOffer.offerInvitationTime.value==""){
		alert("请选择时间!");
		document.getElementById("offerInvitationTime").focus();
		return false;
	}else if(CKEDITOR.instances.offerContent.getData()==""){
		alert("请填写内容!");
		return false;
	}else{
		if(confirm("确定要发送吗？")){
			return true;
		}else{
			return false;
		}
	}	
}

// 时间选择器配置
$(function(){
	$("#offerInvitationTime").datetimepicker({
		format : 'yyyy-mm-dd hh:ii:00',		
		startDate : '2017-01-01',
		autoclose : true,
		minView : 0 ,
		language : 'zh-CN'
	});
});

// CKEDITOR配置，提示当前字数
$(function(){    
    var maxlength=500;
    editor=CKEDITOR.replace("offerContent",{height:'333px',width:'666px'});
    editor.on("key",function(event){
         var content1=editor.document.getBody().getHtml();
         var content2=content1.replace(/<.*?>/ig,"");
         var site=$("#cke_1_top");
         var words=maxlength-content2.length;
         var message=$("<label id='message'></label>");
         if(site.find("#message").length<1){
        	 message.css({border:'1px #eeeeee solid','line-height':'25px',color:'#ff9876'});
        	 site.prepend(message);
         }
         var label=site.find("#message");
         if(content2.length>maxlength){
             label.html("字数超出无法提交");
         }else{
             label.html("还可输入"+words+"字");
         }
     });
});
</script>

</body>
</html>