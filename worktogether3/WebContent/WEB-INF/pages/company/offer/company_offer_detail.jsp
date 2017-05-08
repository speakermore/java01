<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
<title>面试邀请详情</title>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/main.css"/>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>

<%@include file="/WEB-INF/pages/nav.jsp" %>
<div class="container">
	<div class="row clearfix">
		
		<div class="col-sm-3"><%@include file="/WEB-INF/pages/company/menu.jsp" %></div>
			
		<div class="col-sm-9 column">
			<div class="col-sm-12 col-sm-offset-0">
				<form class="form-horizontal" action="offer/update_offerAction/${o.id }" method="post" onsubmit="return checknull(this)">
					
					<div class="form-group">
						<label class="col-sm-2 control-label">应聘者名:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${o.userName }</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">招聘岗位:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${o.offerJob }</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">详细信息:</label>
						<div class="col-sm-10">
							<p class="form-control-static"><textarea rows="10" cols="108" readonly="readonly" style="resize: none;">${o.offerContent}</textarea></p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">面试时间:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${o.offerInvitationTime }</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">发送时间:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${o.offerSendTime }</p>
						</div>
					</div>		
				</form>
									
					<hr/>
						<div class="form-group">
							<div class="col-sm-1 col-sm-offset-11">
								<a class="btn btn-primary" href="offer/window_offer">返回</a>
							</div>
						</div>
					
			</div>
		</div>
	</div>
</div>

</body>
</html>