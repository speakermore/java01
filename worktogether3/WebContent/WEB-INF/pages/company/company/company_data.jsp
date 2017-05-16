<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.*"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<title>企业资料</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/main.css" rel="stylesheet" />
<style type="text/css">
	td>img{
		max-height: 200px;
		max-width: 160px;
	}
	.table tbody>tr:nth-child(odd){
		background: #f5f5f5;
	}
	.table{
		border: 1px solid #f5f5f5;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>
<c:set var="COMPANY_SIZE" value="${CommonStatus.COMPANY_SIZE }"></c:set>
<c:set var="COMPANY_TYPE" value="${CommonStatus.COMPANY_TYPE }"></c:set>

<div class="container">
	<div class="row clearfix">
		<div class="col-sm-3 column">
		<%@include file="/WEB-INF/pages/company/menu.jsp" %>
		</div>
		<div class="col-sm-6 column">
			
			
			<div class="tabbable" id="tabs-627235">
	<ul class="nav nav-tabs">
		<li class="active">
			 <a href="#companySource" data-toggle="tab" >公司基本资料</a>
		</li>
		<li>
			 <a href="#companyInt" data-toggle="tab">公司简介</a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="companySource">
			<ul class="list-unstyled">
				<table class="table ">
				<tbody>
					<tr>
						<td>
							公司全称：
						</td>
						<td>
							${user.companyName}
						</td>
						
					</tr>
					<tr>
						<td>
							公司简称：
						</td>
						<td>
							${user.companySimpleName}
						</td>
						
					</tr>
					<tr>
						<td>
							公司logo：
						</td>
						<td>
							<img src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${user.companyLogo}" />
						</td>
						
					</tr>
					<tr>
						<td>
							公司营业执照（图）:
						</td>
						<td>
							<img src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${user.companyLicenseImg}" />
						</td>
					</tr>
					<tr>
						<td>
							公司营业执照码：
						</td>
						<td>
							${user.companyLicenseNo}
						</td>
						
					</tr>
					<tr>
						<td>
							公司法人：
						</td>
						<td>
							${user.companyCorporator}
						</td>
						
					</tr>
					<tr>
						<td>
							公司邮件：
						</td>
						<td>
							${user.companyEmail}
						</td>
						
					</tr>
					<tr>
						<td>
							公司地址：
						</td>
						<td>
							${user.companyAddress}
						</td>
					</tr>
					</tr>
				</tbody>
			</table>
				<li>
					<a href="company/company/updateCompany/">编辑</a>
				</li>
			</ul>
		</div>
		
	



	<div class="tab-pane" id="companyInt">
		<ul class="list-unstyled">
		<table class="table">
				<tbody>
					<tr>
						<td>
							公司简介：
						</td>
						<td>
							${companyInt.cmpIntroduction }
						</td>
						
					</tr>
					<tr>
						<td>
							公司性质：
						</td>
						<td>
							${COMPANY_TYPE[companyInt.cmpIntQuality] }
						</td>
						
					</tr>
					<tr>
						<td>
							公司规模：
						</td>
						<td>
							${COMPANY_SIZE[companyInt.cmpIntPeopleNum] }
						</td>
						
					</tr>
					<tr>
						<td>
							公司福利：
						</td>
						<td>
							${companyInt.cmpIntComforts}	
						</td>
					</tr>
					<tr>
						<td>
							公司休息制度：		
						</td>
						<td>
							${companyInt.cmpIntRest}
						</td>
						
					</tr>
					<tr>
						<td>
							公司保险：
						</td>
						<td>
							${companyInt.cmpIntInsurance}
						</td>
						
					</tr>
					<tr>
						<td>
							职业薪资：		
						</td>
						<td>
							${companyInt.cmpIntWage}
						</td>
			
				</tbody>
			</table>	
		<li><input type="hidden" value="${companyInt.cmpIntStatus}"></li>
		<li>
			<a href="company/company/updateCompanyInt">编辑</a>
		</li>
										
		</ul>
		</div>
	</div>
</div>
		</div>
		<div class="col-sm-3 column">
			广告位招租
		</div>
	</div>
</div>
		
</body>
</html>