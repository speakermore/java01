 <%@ page language="java" contentType="text/html; charset=UTF-8"
    import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<title>企业用户-企业信息</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="company/js/magnifier.js"></script>

<style type="text/css">
	td>img{
		max-height: 200px;
		max-width: 160px;
	}
	.wt-hby-top{
		margin-top: 30px;
		border-right: 1px solid #f5f5f5;
		border-left: 1px solid #f5f5f5;
	}
	.panel-default{
		border-width:1px 0px 0px 0px;
		border-radius:0px;
		
	}
	.panel-group .panel{
		border-radius: 0px;
	}
	.panel-title{
		color: #fa941b; 
	}
	.panel-collapse{
		   
	}
	.wt-hby-edit{
		text-align: right;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>
<c:set var="COMPANY_TYPE" value="${CommonStatus.COMPANY_TYPE }"></c:set>
<c:set var="COMPANY_SIZE" value="${CommonStatus.COMPANY_SIZE }"></c:set>
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
<div class="container">
	<div class="row clearfix">
		<div class="col-sm-3 column">
		<%@include file="/WEB-INF/pages/company/menu.jsp" %>
		</div>
		<div class="col-sm-9 column wt-hby-top">
			<div class="panel-group" id="accordion" >
				<div class="panel panel-default">
					<div class="panel-heading">
					   	<h4 class="panel-title"><a data-toggle="collapse" href="#collapseOne">公司简介</a></h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="tab-content">
							<div class="tab-pane active" id="companySource">
								<table class="table ">
									<tbody>
										<tr>
											<td class="col-sm-5">公司全称：</td>
											<td>${user.companyName}</td>
										</tr>
										<tr>
											<td>公司简称：</td>
											<td>${user.companySimpleName}</td>
										</tr>
										<tr>
											<td>公司logo：</td>
											<td>
												<img src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${user.companyLogo}" />
											</td>
										</tr>
										<tr>
											<td>公司营业执照（图）:</td>
											<td>
												<img src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${user.companyLicenseImg}" />
											</td>
										</tr>
										<tr>
											<td>社会信用统一代码：</td>
											<td>${user.companyLicenseNo}</td>
										</tr>
										<tr>
											<td>公司法人：</td>
											<td>${user.companyCorporator}</td>
										</tr>
										<tr>
											<td>公司邮件：</td>
											<td>${user.companyEmail}</td>
										</tr>
										<tr>
											<td>公司地址：</td>
											<td>${user.companyAddress}</td>
										</tr>
										<c:if test="${companyConnections==null }">
											<tr>
												<td>公司联系电话：</td>
													<td></td>
											</tr>
										</c:if>
										<c:forEach var="connections" items="${companyConnections }">
											<tr>
												<td>公司联系电话：</td>
													<td>${connections.cmpConnectionName }:${connections.cmpConnection }</td>
											</tr>
										</c:forEach>
										
										<tr>
											<td>审核状态：</td>
											<td>${AUDIT_STATUS[user.companyStatus] }</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
								<div class="wt-hby-edit">
									<a href="company/company/updateCompany/" >编辑</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-group" id="accordion">
				<div class="panel panel-default" style="border-top:0px;">
					<div class="panel-heading">
						   <h4 class="panel-title"><a data-toggle="collapse" href="#collapseTwo">公司详细图片</a></h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse">
						<div class="tab-content">
							<div class="tab-pane active" id="companySource">
								<div class="magnifier" id="magnifier1">
									<div class="magnifier-container">
										<div class="images-cover"></div>
										<!--当前图片显示容器-->
										<div class="move-view"></div>
										<!--跟随鼠标移动的盒子-->
									</div>
									<div class="magnifier-assembly">
										<div class="magnifier-btn">
											<span class="magnifier-btn-left">&lt;</span>
											<span class="magnifier-btn-right">&gt;</span>
										</div>
										<!--按钮组-->
										<div class="magnifier-line">
											<ul class="clearfix animation03">
											 <c:forEach items="${detailImgs }" var="imgs">
												<li>
													<div class="small-img">
														<img src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${imgs.companyDetailImg}" />
													</div>
												</li>
											</c:forEach>
												
											</ul>
										</div>
										<!--缩略图-->
									</div>
									<div class="magnifier-view"></div>
									<!--经过放大的图片显示容器-->
								</div>	
								<div class="wt-hby-edit">
									<a href="company/company/updateCompany/" >编辑</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						   <h4 class="panel-title"><a data-toggle="collapse" href="#collapseThree">公司详细资料</a></h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse in">
						<div class="tab-content">
							<div class="tab-pane active" id="companySource">
								<table class="table ">
									<tbody>
										<tr>
											<td class="col-sm-5">公司简介：</td>
											<td>${companyInt.cmpIntroduction }</td>
										</tr>
										<tr>
											<td>公司性质：</td>
											<td>${COMPANY_TYPE[companyInt.cmpIntQuality] }</td>
										</tr>
										<tr>
											<td>公司规模：</td>
											<td>${COMPANY_SIZE[companyInt.cmpIntPeopleNum] }</td>
										</tr>
										<tr>
											<td>公司福利：</td>
											<td>${companyInt.cmpIntComforts}</td>
										</tr>
										<tr>
											<td>公司休息制度：</td>
											<td>${companyInt.cmpIntRest}</td>
										</tr>
										<tr>
											<td>公司保险：</td>
											<td>${companyInt.cmpIntInsurance}</td>
										</tr>
										<tr>
											<td>职业薪资：</td>
											<td>${companyInt.cmpIntWage}</td>
										</tr>
										<tr><td></td><td></td></tr>
									</tbody>
								</table>
								<div><input type="hidden" value="${companyInt.cmpIntStatus}"></div>
								<div class="wt-hby-edit">
									<a href="company/company/updateCompanyInt">编辑</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	
	var magnifierConfig = {
		magnifier : "#magnifier1",//最外层的大容器
		width : 500,//承载容器宽
		height : 370,//承载容器高
		moveWidth : null,//如果设置了移动盒子的宽度，则不计算缩放比例
		zoom : 5//缩放比例
	};

	var _magnifier = magnifier(magnifierConfig);

	/*magnifier的内置函数调用*/
	/*
		//设置magnifier函数的index属性
		_magnifier.setIndex(1);

		//重新载入主图,根据magnifier函数的index属性
		_magnifier.eqImg();
	*/
});
</script>
</body>

</html>