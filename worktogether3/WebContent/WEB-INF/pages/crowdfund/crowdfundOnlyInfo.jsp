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
<link href="css/login.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="shortcut icon" href="img/21495074072_.pic.png" href="img/21495074072_.pic.png" type="image/x-icon" >
<title>众筹详情</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="css/bootstrap.min.css"></script>
</head>
<style type="text/css">
	#project{
		margin-bottom:25px;
	}
	
	.pj,.job{
		margin-bottom: 15px;
	}
	.jobdemand{
		margin-top: 10px;
	}
	#jobName{
		background-color:#f5f5f5;
	}
	.jobdemand{
		padding:10px;
		border-radius:5px;
		border: 1px #cccccc solid;
	}
	.jobdemand:hover{
		box-shadow: 5px 5px 5px #cccccc;
	}
	
	
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12"><%@include file="/WEB-INF/pages/nav.jsp"%></div>
		</div>
		<div class="row">
			<div class="col-sm-1 col-xs-hidden"></div>
			<div class="col-sm-10 col-xs-12">
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 id="project" class="col-xs-12">${crowdfund.crowdfundProjectName}</h3>
							<div class="pj col-xs-12"> 
								发布者：
								${userorcom}
							</div>
							<div class="pj col-xs-12">
								项目周期：
								${crowdfund.crowdfundProjectCycle}
							</div>
							<div class="pj col-xs-12">
								项目金额：
								<fmt:formatNumber value="${crowdfund.crowdfundProjectMoney}" pattern="##,###,###.00元"></fmt:formatNumber>  
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">项目简介：</h3>
							</div>
							<div class="panel-body">
								<div class="col-xs-12">${crowdfund.crowdfundProjectSummary}</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">众筹方式：</h3>
							</div>
							<div class="panel-body">
								${crowdfund.crowdfundProjectMethod}
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">需求岗位：</h3>
							</div>
							<div class="panel-body">
								<c:forEach items="${crowdfundDemandList}" var="cfd" >
								<div class="job row">
									<div class="col-xs-12">
										<button id="jobName" type="button" class="btn btn-default jobName" 
											data-toggle="collapse" data-target="#${cfd.id}">
											${cfd.demandJobName}
											<span class="glyphicon glyphicon-chevron-down"></span>
										</button>
									</div>
									<div id="${cfd.id}" class="jobdemand collapse col-xs-12">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h3 class="panel-title">岗位要求：</h3>
											</div>
											<div class="panel-body">
												${cfd.demandSummary}
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h3 class="panel-title">需求人数：
													<span class="badge">${cfd.demandPeopleCount}</span>
												</h3>
											</div>
										</div>
										<div class="col-xs-12">
										<div class="col-sm-4 col-xs-hidden"></div>
										<c:if test="${cfd.demandPeopleCount>=1}">
											<div class="col-sm-6 col-xs-12"><a href="javascript:void(0)"><button class="btn btn-info">加入我们！</button></a></div>
										</c:if>
										<c:if test="${cfd.demandPeopleCount<=0}">
											<div class="col-sm-6 col-xs-12"><a href="javascript:void(0)"><button class="btn btn-danger">人数已满！</button></a></div>
										</c:if>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
				</div>
			</div>
		</div>
		<div style="margin: 10px;" class="col-xs-12">
			<div class="col-sm-4 col-xs-hidden"></div>
			<a href="javascript:history.go(-1)"><button class="btn btn-warning col-sm-4 col-xs-12">返回</button></a>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	var $string="";
	$(".jobName").click(function(){
		var that = $(this);
		var index = that.html();
		if(index.indexOf("glyphicon-chevron-down")>0){
			$string = that.html();
			$string=$string.replace("glyphicon-chevron-down","glyphicon-chevron-up");
			that.html($string);
		};
		if(index.indexOf("glyphicon-chevron-up")>0){
			$string = that.html();
			$string=$string.replace("glyphicon-chevron-up","glyphicon-chevron-down");
			that.html($string);
		};
	});

});
</script>
</html>