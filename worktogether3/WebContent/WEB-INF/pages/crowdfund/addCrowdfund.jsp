<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/login.css"/>
<link rel="stylesheet" href="dist/css/bootstrapValidator.min.css">
<link rel="shortcut icon" href="img/21495074072_.pic.png" href="img/21495074072_.pic.png" type="image/x-icon" >

<title>我的众筹-发布众筹</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">
	#crowdfundProjectEndDate{
		height: 33px;
	}
	.cfTitle{
		margin: 20px;
	}
	.jobcoo option{
		height: 33px;
	}

</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12"><%@include file="/WEB-INF/pages/nav.jsp"%></div>
		</div>
		<div class="row">
			<div class="col-sm-1 col-xs-hidden"></div>
			<div class="col-sm-10 col-xs-12">
			<div class="row">
			<div class="col-sm-2 hidden-xs"></div>
			<div class="col-sm-10 col-xs-12">
			<div class="row cfTitle">
				<div class="col-sm-3 col-xs-2"></div>
				<div class="col-sm-9 col-xs-10"><h3>添加众筹项目信息</h3></div>
			</div>
			<form id="addCf" role="form" class="form-horizontal" action="crowdfund/addCrowdfund" method="post">
				<!-- 项目名称 -->
				<div class="form-group">
					<label for="crowdfundProjectName" class="col-xs-4 col-sm-2 control-label">项目名称：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="crowdfundProjectName" id="crowdfundProjectName" placeholder="众筹项目的名称" />
					</div>
				</div>
				<!-- 项目金额 -->
				<div class="form-group">
					<label for="crowdfundProjectMoney" class="col-xs-4 col-sm-2 control-label">项目金额：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="crowdfundProjectMoney" id="crowdfundProjectMoney" placeholder="众筹项目的金额" />
					</div>
				</div>
				<!-- 项目周期 crowdfundProjectCycle-->
				<div class="form-group">
					<label for="crowdfundProjectCycle" class="col-xs-4 col-sm-2 control-label">项目周期：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="crowdfundProjectCycle" id="crowdfundProjectCycle" placeholder="项目预计完成时间，天、周、月等" />
					</div>
				</div>
				<!-- 众筹截止日期 crowdfundProjectEndDate -->
				<div class="form-group">
					<label for="crowdfundProjectEndDate" class="col-xs-12 col-sm-2 control-label">众筹截止日期：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="Wdate form-control bg" onClick="WdatePicker({minDate:'%y-%M-{%d+1}'})" name="crowdfundProjectEndDate" id="crowdfundProjectEndDate" placeholder="众筹结束时间" />
					</div>
				</div>
				<!-- 项目简介crowdfundProjectSummary  -->
				<div class="form-group">
					<label for="crowdfundProjectSummary" class="col-xs-12 col-sm-2 control-label">项目简介：</label>
					<div class="col-sm-6 col-xs-12">
						<textarea class="form-control" id="crowdfundProjectSummary" name="crowdfundProjectSummary" rows="3" cols="30"></textarea>
					</div>
				</div>
				<!-- 项目众筹方法 crowdfundProjectMethod-->
				<div class="form-group">
					<label for="crowdfundProjectMethod" class="col-xs-12 col-sm-2 control-label">众筹办法：(2000字以内)</label>
					<div class="col-sm-6 col-xs-12">
						<textarea class="form-control" id="crowdfundProjectMethod" name="crowdfundProjectMethod" rows="5" cols="30"></textarea>
					</div>
				</div>
				<!-- 项目需求岗位添加 -->
				
				<div class="form-group">
					<label class="col-xs-12 col-sm-2 control-label"></label>
					<div class="col-sm-6 col-xs-12">
						<div class="panel panel-default">
	    					<div class="panel-heading">
	      					  <h3 class="panel-title">需求岗位：</h3>
	      					</div>
	      					<!-- 添加开始 -->
	      					<div class="onejob">
	      					 <div class="panel-body">
	      					   	 <div class="row">
									<label class="panel-heading">职务：</label>
									<div class="col-xs-12">
										<!-- <input class="form-control bg" name="demandJobName" /> -->
										
										<select size="1" id="job1" name="job1" class="col-xs-6 jobcoo">
											<c:forEach items="${listJob1}" var="job1">
												<option value="${job1.jobName}">${job1.jobName}</option>
											</c:forEach>
										</select>
										<select style="display: none" size="1" name="job2" class="job2 col-xs-6 jobcoo"></select>
										
									</div>
								 </div>
								 
								 <div class="row">
									<label class="panel-heading">需求人数：</label>
									<div class="col-xs-12">
										<input class="form-control bg" type="text" name="demandPeopleCount" placeholder="请输入数字"/>
									</div>
								</div>
								
								<div class="row">
									<label class="panel-heading">岗位描述(500字以内)：</label>
									<div class="col-xs-12">
										<textarea class="form-control" id="demandSummary" 
											name="demandSummary" rows="5" cols="30"></textarea>
									</div>
								</div>
							</div>
							</div>
							<!-- 添加结束 -->
							<div class="newjob"></div>
							
							<div class="panel-heading">
	      					  <h3 class="panel-title">
	      					 	 <a id="addjob" title="新增岗位" href="javascript:void(0)">
	      					 	 	<span class="glyphicon glyphicon-plus"></span>
	      					 	 </a>
	      					 	 <a id="deletejob" title="删除最后一个岗位" style="display: none;">
	      					 	 	<span class="glyphicon glyphicon-minus"></span>
	      					 	 </a>
	      					 	
	      					  </h3>
	      					</div>
	      				 
						</div>
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-hidden col-sm-2 control-label"></label>
					<div class="col-xs-12 col-sm-6">
						<button class="btn btn-info form-control" type="submit">提交</button>
					</div>
				</div>
				
			</form>
			</div>
			</div>
		</div>
	</div>
	<!-- 提示消息 -->
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
<script type="text/javascript" src="date/WdatePicker.js" ></script>
<script type="text/javascript" src="js/addcrowdfund.js" ></script>
<script type="text/javascript" src="dist/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
$(function(){
	
	if($("#info").val()=='noUser'){
		 $('#infoCon').html('用户状态异常，添加失败');
		 //跳转登录界面xxx
		 $('#myModal').modal();
	}
	if($("#info").val()=='noJob'){
		 $('#infoCon').html('岗位信息添加失败');
		 $('#myModal').modal();
	}
	if($("#info").val()=='yesJob'){
		 $('#infoCon').html('众筹信息添加成功！等待管理员审核');
		 $('#myModal').modal();
	}
	if($("#info").val()=='nocf'){
		 $('#infoCon').html('众筹信息有误！添加失败!');
		 $('#myModal').modal();
	}
	
	
	
});

</script>
</body>
</html>