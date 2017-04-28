<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑资料</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<link href="css/main.css" rel="stylesheet" />
<link href="thirdpart/fileupload/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="thirdpart/fileupload/js/fileinput.min.js"></script>
<script src="thirdpart/fileupload/language/zh.js"></script>

<style>
	#file{
		height: 100px;
		width: 400px;
	}
</style>

</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>
		<div class="container">
	<div class="row clearfix">
		<div class="col-sm-3">
			<%@include file="/WEB-INF/pages/company/menu.jsp" %>
		</div>
		<div class="col-sm-6">
			<form class="form-horizontal" role="form" action="company/company/update" method="post" enctype="multipart/form-data">
				<input type="hidden" value=${user.id } name="id">
				<input type="hidden" value=${user.companyLoginId } name="companyLoginId">
				<input type="hidden" value=${user.companyPassword } name="companyPassword">
				<input type="hidden" value=${user.companyStatus } name="companyStatus">
						<div class="form-group" >
					 		<div class="col-sm-3">公司全称：</div>
					 		<div class="col-sm-9">
					 			<input type="text" class="form-control" id="exampleInputEmail1" value=${user.companyName } name="companyName"/>
					 		</div>
						</div> 
							
				<div class="form-group">
					<div class="col-sm-3"> 公司简称：</div>	
					 <div class="col-sm-9">
					 	<input type="text" class="form-control" id="exampleInputPassword1" value=${user.companySimpleName } name="companySimpleName"/>
					</div>
			
				</div>
				<div class="form-group">
					<div class="col-sm-3">公司Logo：</div>	
					<div class="col-sm-9"><input id="companyLogo" name="logo" multiple type="file" class="form-control file">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3">组织机构代码：</div>	
					<div class="col-sm-9">  <input type="text" class="form-control" id="exampleInputPassword1" value=${user.companyLicenseNo } name="companyLicenseNo"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-3">营业执照：</div>
					<div class="col-sm-9"> <input type="text" class="form-control" id="exampleInputPassword1" value=${user.companyLicenseImg } name="companyLicenseImg"/>
					</div>
				</div>
				
				<div class="form-group">
					 	<div class="col-sm-3">公司法人：</div>
					<div class="col-sm-9"> <input type="text" class="form-control" id="exampleInputPassword1" value=${user.companyCorporator } name="companyCorporator"/>
					</div>
				</div>
				<div class="form-group">
					 	<div class="col-sm-3">公司电话：</div>
					<div class="col-sm-9"> <input type="text" class="form-control" id="exampleInputPassword1" value=${user.companyTel } name="companyTel"/>
					</div>
				</div>
				<div class="form-group">
					 	<div class="col-sm-3">Email：</div>
					<div class="col-sm-9"> <input type="email" class="form-control" id="exampleInputPassword1" value=${user.companyEmail } name="companyEmail"/>
					</div>
				</div>
				<div class="form-group">
					 	<div class="col-sm-3">公司地址：</div>
					 <div class="col-sm-9"><input type="text" class="form-control" id="exampleInputPassword1" value=${user.companyAddress } name="companyAddress"/>
					</div>
				</div>
				
				
				<div class="form-group">
					<div class="col-sm-3">公司环境：</div>
					<div class="col-sm-9"> 
                    		<input id="file-zh" name="companyDetails" multiple type="file" class="form-control">
					</div>
				</div>
                
				
				<div class="form-group">
				<div class="col-sm-12">
					<button type="submit" class="form-control btn btn-success">修改</button>
				</div>
				</div>
			</form>
		</div>
		<div class="col-sm-3 column">
			日常广告位
		</div>
	</div>
</div>
<script>
	$("#companyLogo").fileinput({	
	 'language': 'zh',
	'showUpload':false,
	'showRemove':false,
	'previewFileType':'any'});
	
	$("#file-zh").fileinput({
		multiple:true,
		uploadAsync:false,
		maxFileCount:6,
		language:'zh',
	    allowedFileExtensions:["jpg", "png", "gif"],
	    minImageWidth:50,
	    minImageHeight:50
	});

</script>
</body>

	
</html>