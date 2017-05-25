<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
<title>面试邀请详情</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>

<!-- 上边栏 -->
<%@include file="/WEB-INF/pages/nav.jsp" %>
<div class="container">
	<div class="row clearfix">
		
		<!-- 左边栏 -->
		<div class="col-sm-3"><%@include file="/WEB-INF/pages/company/menu.jsp" %></div>
		
		<!-- offer详细信息 -->
		<div class="col-sm-9">
			<div class="col-sm-12 col-sm-offset-0">
				<form class="form-horizontal" action="offer/update_offerAction/${o.id }" method="post">
					
					<div class="form-group">
						<label class="col-sm-2 control-label">公司全称:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${o.companyName }</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">招聘岗位:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${o.offerJob }</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">面试日期:</label>
						<div class="col-sm-10">
							<p class="form-control-static"><fmt:formatDate value="${o.offerInvitationTime }" pattern="MM月dd日"/></p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">面试时间:</label>
						<div class="col-sm-10">
							<p class="form-control-static"><fmt:formatDate value="${o.offerInvitationTime }" pattern="HH点mm分"/></p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">详细信息:</label>
						<div class="col-sm-10">
							<p class="form-control-static">${o.offerContent }</p>
						</div>
					</div>
					
					<!-- 如果offer尚未阅读或尚未决定则可以选择是否接受邀请 -->
					<c:if test="${o.offerAction==1 or o.offerAction==4}">
					<hr/>
						<div class="form-group">
							<div class="col-sm-offset-2">
								<label class="checkbox-inline"><input type="radio" name="offerAction" value="2">接受邀请</label>
								<label class="checkbox-inline"><input type="radio" name="offerAction" value="3">拒绝邀请</label>
								<label class="checkbox-inline"><input type="radio" name="offerAction" value="4" checked>考虑一下</label>
							</div>
						</div>
					<hr/>
						<div class="form-group">
							<div class="col-sm-1 col-sm-offset-2">
								<button class="btn btn-warning" type="submit" onClick="return Mycheck(this.form)">提交</button>
							</div>
							<div class="col-sm-1 col-sm-offset-8">
								<a class="btn btn-warning" href="javascript:history.back()">返回</a>
							</div>
						</div>
					</c:if>				
					
					<!-- 如果已经接受或拒绝邀请，则不可更改 -->
					<c:if test="${o.offerAction==2 or o.offerAction==3}">
					<hr/>
						<div class="form-group">
							<div class="col-sm-1 col-sm-offset-11">
								<a class="btn btn-warning" href="javascript:history.back()">返回</a>
							</div>
						</div>
					</c:if>
						
				</form>
			</div>
		</div>
	</div>
</div>

<script>
// 接受或拒绝邀请时弹出确认框
function Mycheck(form){
	if($(":radio:checked").val()==2){
		if(confirm("确定要接受吗？")){
			return true;
		}else{
			return false;
		}
	}else if($(":radio:checked").val()==3){
		if(confirm("确定要拒绝吗？")){
			return true;
		}else{
			return false;
		}
	}
}
</script>

</body>
</html>