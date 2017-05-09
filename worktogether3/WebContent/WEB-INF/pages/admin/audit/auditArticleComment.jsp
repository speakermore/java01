<%@ page language="java" import="java.util.*,ynjh.common.util.*"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>审核文章评论</title>
<%@include file="../header.jsp"%>
<style>
	#comment_result_info{
		display:none;
	}
</style>
</head>
<body>
	<div><%@include file="../menu.jsp"%></div>
	<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
	<div class="col-sm-offset-2">
		<div class="row">
			<div class="col-sm-11" >
				<div class="row" style="background-color: #FFFFFF;">
					<form id="audit_comment" action="admin/auditCommentsArticle" onsubmit="return false" method="post">
						<input id="commentArticleStatus" type="hidden"
							name="commentArticleStatus" />
						<div class="col-sm-12">
							待审核文章评论：
							<p id="comment_result_info" role="alert" class="alert alert-warning"><i class="glyphicon glyphicon-ok"></i>提交成功！</p>
							<table class="table table-hover table-striped">
								<c:if test="${commentarticle==null }">
									<jsp:forward page="/admin/findAuditCommentsArticle/1" />
								</c:if>
								<thead>
									<tr>
										<th><a id="a_select_all" href="javascript:select_all()">全选</a></th>
										<th>评论内容</th>
										<th>评论时间</th>
										<th>审核</th>
									</tr>
								</thead>
								<c:forEach items="${commentarticle}" var="comArt">
									<tr>
										<td><input name="id" type="checkbox"
											value="${comArt.id}" /></td>
										<td><a
											href="admin/findAuditCommentsArticleById?id=${comArt.id}">
												${comArt.commentArticleContent}</a></td>
										<td>${comArt.commentArticleTime}</td>
										<td>${AUDIT_STATUS[comArt.commentArticleStatus]}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<button onclick="check(2)">通过</button>
						<button onclick="check(3)">不通过</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div><%@include file="../footer.jsp"%></div>
	<script type="text/javascript"
		src="thirdpart/dist/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript"
		src="thirdpart/dist/js/language/zh_CN.js"></script>
</body>
<script type="text/javascript">

	//全选或取消
	var select_all = function() {
		var select = $("#a_select_all");
		if (select.html() == "全选") {
			$("input[type='checkbox']").prop("checked", true);
			select.html("取消");
		} else {
			$("input[type='checkbox']").prop("checked", false);
			select.html("全选");
		}

	};
	//审核通过或不通过
	//status:传入审核状态：2代表通过审核，3代表审核不通过
	var check = function(status) {
		$("#commentArticleStatus").val(status);
		submitAuditComment();
	};
	
	//jaxa方法，完成对审核状态的服务器端调用及客户端对状态描述字段的修改
	var submitAuditComment=function(){
		var commentStatus=$("#commentArticleStatus").val();
		$.ajax({
			type:"POST",
			url:"admin/auditCommentsArticle",
			data:$("#audit_comment").serialize(),
			dataType:"json",
			success:function(data){
				//默认样式
				$("#comment_result_info").css("display","none");
				$("#comment_result_info").removeClass();
				$("#comment_result_info").addClass("alert alert-warning");
				$("#comment_result_info").html("<i class=\"glyphicon glyphicon-ok\"></i>提交成功！");
				if(data){//提交成功
					$("#comment_result_info").slideDown(1000);
				
					//更改提交状态
					var inputData=$("input[type='checkbox']");
					for(var i=0;i<inputData.length;i++){
						if(inputData[i].checked==true){
							if(commentStatus==2){
								$($("input[type='checkbox']")[i].parentNode.parentNode).children().last().html("审核通过");
							}else{
								$($("input[type='checkbox']")[i].parentNode.parentNode).children().last().html("审核不通过");
							}
							
						}
					}
				}else{//提交失败
					//失败样式
					$("#comment_result_info").removeClass();
					$("#comment_result_info").addClass("alert alert-danger");
					$("#comment_result_info").html("<i class=\"glyphicon glyphicon-remove\"></i>提交失败或未勾选评论！");
					$("#comment_result_info").slideDown(1000);
				}
			}
		});
	}
</script>
</html>

