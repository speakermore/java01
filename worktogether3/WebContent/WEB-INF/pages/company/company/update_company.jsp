<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/company/bootstrap.css"/>
<title>编辑资料</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
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
			<form role="form" action="company/company/update" method="post">
				<input type="hidden" value=${company.id } name="id">
				<input type="hidden" value=${company.companyLoginId } name="companyLoginId">
				<input type="hidden" value=${company.companyPassword } name="companyPassword">
				<div class="row clearfix">
				
					<div class="col-sm-12 colum">
						<div class="form-group" >
					 		<div class="col-sm-4 colum">公司全程：</div>
					 		<div class="col-sm-8 colum">
					 			<input type="text" class="form-control" id="exampleInputEmail1" value=${company.companyName } name="companyName"/>
					 		</div>
						</div> 
							
				<div class="form-group">
					<div class="col-sm-4 colum"> 公司简称：</div>	
					 <div class="col-sm-8 colum">
					 	<input type="text" class="form-control" id="exampleInputPassword1" value=${company.companySimpleName } name="companySimpleName"/>
					</div>
			
				</div>
				<div class="form-group">
					<div class="col-sm-4 colum">公司Logo：</div>	
					<div class="col-sm-8 colum"><input type="text" class="form-control" id="exampleInputPassword1" value=${company.companyLogo } name="companyLogo"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 colum">公司全程：</div>	
					<div class="col-sm-8 colum"> <input type="text" class="form-control" id="exampleInputPassword1" value=${company.companyName } name="companyName"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 colum">公司营业执照码：</div>	
					<div class="col-sm-8 colum">  <input type="text" class="form-control" id="exampleInputPassword1" value=${company.companyLicenseNo } name="companyLicenseNo"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 colum">公司营业执照（图）：</div>
					<div class="col-sm-8 colum"> <input type="text" class="form-control" id="exampleInputPassword1" value=${company.companyLicenseImg } name="companyLicenseImg"/>
					</div>
				</div>
				
				<div class="form-group">
					 	<div class="col-sm-4 colum">公司法人：</div>
					<div class="col-sm-8 colum"> <input type="text" class="form-control" id="exampleInputPassword1" value=${company.companyCorporator } name="companyCorporator"/>
					</div>
				</div>
				<div class="form-group">
					 	<div class="col-sm-4 colum">公司电话：</div>
					<div class="col-sm-8 colum"> <input type="text" class="form-control" id="exampleInputPassword1" value=${company.companyTel } name="companyTel"/>
					</div>
				</div>
				<div class="form-group">
					 	<div class="col-sm-4 colum">Email：</div>
					<div class="col-sm-8 colum"> <input type="email" class="form-control" id="exampleInputPassword1" value=${company.companyEmail } name="companyEmail"/>
					</div>
				</div>
				<div class="form-group">
					 	<div class="col-sm-4 colum">公司地址：</div>
					 <div class="col-sm-8 colum"><input type="text" class="form-control" id="exampleInputPassword1" value=${company.companyAddress } name="companyAddress"/>
					</div>
				</div>
				<div class="form-group">
					 	<div class="col-sm-4 colum">公司环境（图）：</div>
					<div class="col-sm-8 colum"> <input type="text" class="form-control" id="exampleInputPassword1" value=${company.companyDetailImg } name="companyDetailImg"/>
					</div>
				</div>
				<input type="text" value=${company.companyStatus } name="companyStatus">
				<div class="form-group">
					 <label for="exampleInputFile"></label>
				</div>
						
					</div>
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
		<div class="col-sm-3 column">
			日常广告位
		</div>
	</div>
</div>
</body>
</html>