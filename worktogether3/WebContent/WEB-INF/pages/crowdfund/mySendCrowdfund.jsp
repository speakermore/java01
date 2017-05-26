<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="img/21495074072_.pic.png" href="img/21495074072_.pic.png" type="image/x-icon" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="css/bootstrap.min.css.map"></script>
<title>我的众筹</title>
<style type="text/css">
	.nopointer:hover{
		cursor:not-allowed;
	}
	.table th, .table td { 
		text-align: center;
		vertical-align: middle!important;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="col-sm-1 col-xs-hidden"></div>
	<div class="col-sm-10 col-xs-12">
	<table class="table table-hover table-striped">
		<tr>
			<th>众筹项目</th>
			<th>发布类型</th>
			<th>项目金额</th>
			<th>申请时间</th>
			<th>审核状态</th>
			<th>操作</th>
		</tr>
		<%--众筹推荐列表 --%>
		<c:if test="${mylist!=null}">
			<c:forEach items="${mylist}" var="cf">
			<tr>
				<td><a title="查看" href="crowdfund/crowdfundOnlyInfo?id=${cf.id}">${cf.crowdfundProjectName}</a></td>
				<td>
					<c:if test="${cf.publisherId<1234567891}">
						企业
					</c:if>
					<c:if test="${cf.publisherId>1234567890}">
						个人
					</c:if>
				</td>
				<td><fmt:formatNumber value="${cf.crowdfundProjectMoney}" pattern="##,###,###.00元"></fmt:formatNumber></td>
				<c:if test="${cf.crowdfundProjectEndDate.time>=now.time}">
					<td><fmt:formatDate value="${cf.crowdfundProjectStartDate}" pattern="yyyy年MM月dd日 E"/> </td>
				</c:if>
				<c:if test="${cf.crowdfundProjectEndDate.time<=now.time}">
					<td>已失效</td>
				</c:if>
				<c:if test="${cf.crowdfundProjectCheckState==1}">
					<td>审核中</td>
					<td>
					<a title="管理" href="crowdfund/updateCrowdfund?id=${cf.id}"><span class="glyphicon glyphicon-pencil"></span></a>
					<a title="删除" onClick="return confirm('您真的确定要撤回吗?')" href="crowdfund/deleteCrowdfund?id=${cf.id}"><span class="glyphicon glyphicon-trash"></span></a>
					</td>
				</c:if>
				<c:if test="${cf.crowdfundProjectCheckState==2}">
					<td>审核通过</td>
					<td>
					<a class="nopointer" style="color: #cccccc;" title="禁止修改" href="javascript:void(0)"><span class="glyphicon glyphicon-pencil"></span></a>
					<a title="删除" onClick="return confirm('您确定要删除该众筹信息？')" href="crowdfund/deleteCrowdfund?id=${cf.id}"><span class="glyphicon glyphicon-trash"></span></a>
					</td>
				</c:if>
				<c:if test="${cf.crowdfundProjectCheckState==3}">
					<td>审核未通过</td>
					<td>
					<a class="nopointer" style="color: #cccccc;" title="禁止修改" href="javascript:void(0)"><span class="glyphicon glyphicon-pencil"></span></a>
					<a title="删除" onClick="return confirm('您确定要删除该众筹信息？')" href="crowdfund/deleteCrowdfund?id=${cf.id}"><span class="glyphicon glyphicon-trash"></span></a>
					</td>
				</c:if>
			</tr>
			</c:forEach>
		</c:if>
		
		</table>
		<!-- 无消息提示 -->
		<div id="showTips" style="display: none;">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">
					&times;
				</button>
				Tips:亲！你还没有发布过众筹信息！
			</div>
		</div>
		<!-- 模态框提示 -->
		<input type="hidden" id="info" value="${info}">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">提示！</h4>
				</div>
				<div id="infoCon" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" 
							data-dismiss="modal">关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	
	</div>
<script type="text/javascript">
$(function(){
	if($("table tr td:first").text().length===0){
		 $("#showTips").css("display","block"); 
	}
	if($("#info").val()=='Y'){
		$("#myModalLabel").html("提示！");
		 $('#infoCon').html('该众筹项目已成功移除！');
		 $('#myModal').modal();
	}
	if($("#info").val()=='N'){
		$("#myModalLabel").html("警告！");
		 $('#infoCon').html('系统异常，信息移除失败，请稍后再试！');
		 $('#myModal').modal();
	}
	
});
</script>
</body>
</html>