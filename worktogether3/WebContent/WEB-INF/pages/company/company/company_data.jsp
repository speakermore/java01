<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>


<div class="container">
	<div class="row clearfix">
		<div class="col-sm-3 column">
			<%@include file="/WEB-INF/pages/company/menu.jsp" %>
		</div>
		
		
		<div class="col-sm-6 column">			
			<div class="tabbable" id="tabs-627235">
	<ul class="nav nav-tabs">
		<li class="active">
			 <a href="#panel-100327" data-toggle="tab" >公司基本资料</a>
		</li>
		<li>
			 <a href="#panel-464269" data-toggle="tab">公司简介</a>
		</li>
	</ul>
	<div class="tab-content">
	
		<div class="tab-pane active" id="panel-100327">
			<ul class="list-unstyled">
				<table class="table">
				<tbody>
					<tr class="success">
						<td>
							公司全称：
						</td>
						<td>
							${company.companyName}
						</td>
						
					</tr>
					<tr class="error">
						<td>
							公司简称：
						</td>
						<td>
							${company.companySimpleName}
						</td>
						
					</tr>
					<tr class="warning">
						<td>
							公司logo：
						</td>
						<td>
							${company.companyLogo}
						</td>
						
					</tr>
					<tr class="info">
						<td>
							公司营业执照（图）:
						</td>
						<td>
							${company.companyLicenseImg}
						</td>
					</tr>
					<tr class="success">
						<td>
							公司营业执照码：
						</td>
						<td>
							${company.companyLicenseNo}
						</td>
						
					</tr>
					<tr class="error">
						<td>
							公司法人：
						</td>
						<td>
							${company.companyCorporator}
						</td>
						
					</tr>
					<tr class="warning">
						<td>
							公司邮件：
						</td>
						<td>
							${company.companyEmail}
						</td>
						
					</tr>
					<tr class="info">
						<td>
							公司地址：
						</td>
						<td>
							${company.companyAddress}
						</td>
					</tr>
					<tr class="success">
						<td>
							公司环境图片（图）：
						</td>
						<td>
							${company.companyDetailImg}
						</td>
						
					</tr>
				</tbody>
			</table>
				<li>
					<a href="company/company/updateCompany/">编辑</a>
				</li>
			</ul>
		</div>
		
	



	<div class="tab-pane" id="panel-464269">
		<ul class="list-unstyled">
		<table class="table">
				<tbody>
					<tr class="success">
						<td>
							公司简介：
						</td>
						<td>
							${companyInt.cmpIntroduction }
						</td>
						
					</tr>
					<tr class="error">
						<td>
							公司性质：
						</td>
						<td>
							${companyInt.cmpIntQuality}
						</td>
						
					</tr>
					<tr class="warning">
						<td>
							公司规模：
						</td>
						<td>
							${companyInt.cmpIntPeopleNum}
						</td>
						
					</tr>
					<tr class="info">
						<td>
							公司福利：
						</td>
						<td>
							${companyInt.cmpIntComforts}	
						</td>
					</tr>
					<tr class="success">
						<td>
							公司休息制度：		
						</td>
						<td>
							${companyInt.cmpIntRest}
						</td>
						
					</tr>
					<tr class="error">
						<td>
							公司保险：
						</td>
						<td>
							${companyInt.cmpIntInsurance}
						</td>
						
					</tr>
					<tr class="warning">
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
				
</div>
</div>
		<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
</body>
</html>