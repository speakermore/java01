<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑资料</title>
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<%@include file="/WEB-INF/pages/company/footer.jsp"%>
<style>
#file {
	height: 100px;
	width: 400px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-sm-3">
				<%@include file="/WEB-INF/pages/company/menu.jsp"%>
			</div>
			<div class="col-sm-6">
				<h3>基本资料修改</h3>
				<hr />
				<form class="form-horizontal" role="form"
					action="company/company/update" method="post"
					enctype="multipart/form-data" id="updateCompany">
					<input type="hidden" value=${user.id } name="id"> <input
						type="hidden" value=${user.companyLoginId } name="companyLoginId">
					<input type="hidden" value=${user.companyPassword }
						name="companyPassword"> <input type="hidden"
						value=${user.companyStatus } name="companyStatus">
					<div class="form-group">
						<div class="col-sm-3">公司全称：</div>
						<div class="col-sm-9">
							<input type="text" class="form-control disabled"
								name="companyName" value=${user.companyName }>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-3">公司简称：</div>
						<div class="col-sm-9">
							<input type="text" class="form-control disabled"
								id="" name="companySimpleName"
								value=${user.companySimpleName }>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">公司Logo：</div>
						<div class="col-sm-9">
							<input id="logo" name="logo" multiple type="file"
								class="form-control file" >
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">组织机构代码：</div>
						<div class="col-sm-9">
							<input type="text" class="form-control disabled"
								name="companyLicenseNo"
								value=${user.companyLicenseNo }>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">营业执照：</div>
						<div class="col-sm-9">
							<input id="companyLicense" name="licenseImg" multiple type="file"
								class="form-control file">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-3">公司法人：</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								name="companyCorporator"
								value=${user.companyCorporator }>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">公司电话：</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								name="companyTel"
								value=${user.companyTel }>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">Email：</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								name="companyEmail"
								value=${user.companyEmail }>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">公司地址：</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								name="companyAddress"
								value=${user.companyAddress }>
						</div>
					</div>
					<input type="hidden" name="companyStatus" value=${companyStatus } id="companyStatus">
					<div class="form-group">
						<div class="col-sm-3">公司环境：</div>
						<div class="col-sm-9">
							<span class="label label-default">大门</span><input id="companyImg1"
								name="companyImgs1" multiple type="file"
								class="form-control file"> <span
								class="label label-default">前台</span><input id="companyImg2"
								name="companyImgs2" multiple type="file"
								class="form-control file"> <span
								class="label label-default">办公区</span><input id="companyImg3"
								name="companyImgs3" multiple type="file"
								class="form-control file"> <span
								class="label label-default">会议室</span><input id="companyImg4"
								name="companyImgs4" multiple type="file"
								class="form-control file"> <span
								class="label label-default">休息区</span><input id="companyImg5"
								name="companyImgs5" multiple type="file"
								class="form-control file"> <span
								class="label label-default">其他</span><input id="companyImg6"
								name="companyImgs6" multiple type="file"
								class="form-control file">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3">
							<button type="submit" class="form-control btn btn-success">修改</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm-3 column">日常广告位</div>
		</div>
	</div>
</body>
<!-- <script>
$("#logo").fileinput({	
	 'language': 'zh',
	'showUpload':false,
	'showRemove':false,
	allowedFileExtensions:["jpg", "png", "gif"]
	});
</script> -->
<script type="text/javascript">
	 $("#logo").fileinput({
	 'uploadAsync' : false,
	 'language' : 'zh',
	 'showUpload' : false,
	 'initialPreview' : [
	 '<img width="160" height="200" src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${user.companyLogo}"/>'],
	 'previewFileType' : 'any'
	 });
	 $("#companyLicense").fileinput({
		 'uploadAsync' : false,
		 'language' : 'zh',
		 'showUpload' : false,
		 'initialPreview' : [
		 '<img width="160" height="200" src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${user.companyLicenseImg}"/>'],
		 'previewFileType' : 'any'
		 });
	$("#companyImg1").fileinput({
		'uploadAsync' : false,
		'language' : 'zh',
		'showUpload' : false,
		'initialPreview' : [
		'<img width="160" height="200" src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${detailImgs[0]}"/>'],
		'previewFileType' : 'any'
	 });
	
	$("#companyImg2").fileinput({
		 'uploadAsync' : false,
		 'language' : 'zh',
		 'showUpload' : false,
		 'initialPreview' : [
		 '<img width="160" height="200" src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${detailImgs[1]}"/>'],
		 'previewFileType' : 'any'
		 });
	 $("#companyImg3").fileinput({
		 'uploadAsync' : false,
		 'language' : 'zh',
		 'showUpload' : false,
		 'initialPreview' : [
		 '<img width="160" height="200" src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${detailImgs[2]}"/>'],
		 'previewFileType' : 'any'
		 });
	 $("#companyImg4").fileinput({
		 'uploadAsync' : false,
		 'language' : 'zh',
		 'showUpload' : false,
		 'initialPreview' : [
		 '<img width="160" height="200" src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${detailImgs[3]}"/>'],
		 'previewFileType' : 'any'
		 });
	 $("#companyImg5").fileinput({
		 'uploadAsync' : false,
		 'language' : 'zh',
		 'showUpload' : false,
		 'initialPreview' : [
		 '<img width="160" height="200" src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${detailImgs[4]}"/>'],
		 'previewFileType' : 'any'
		 });
	 $("#companyImg6").fileinput({
		 'uploadAsync' : false,
		 'language' : 'zh',
		 'showUpload' : false,
		 'initialPreview' : [
		 '<img width="160" height="200" src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${detailImgs[5]}"/>'],
		 'previewFileType' : 'any'
		 }); 
	/* var fileupdateTest = function(id, src) {
		$("#" + id + "").fileinput({
			'uploadAsync' : false,
			'language' : 'zh',
			'showUpload' : false,
			'initialPreview' : [ "<img src="+src+"/>" ],
			'previewFileType' : 'any'
		});
	} */
	/* window.onload = function() {
		fileupdateTest("logo", "img/head.gif");
		fileupdateTest("companyImg1", "img/head.gif");
	} */
	$(document)
			.ready(
					function() {
						/* *
						 * 下面是进行插件初始化
						 * 你只需传入相应的键值对
						 * */
						$('#updateCompany')
								.bootstrapValidator(
										{
											message : 'This value is not valid',
											feedbackIcons : {/*输入框不同状态，显示图片的样式*/
												valid : 'glyphicon glyphicon-ok',
												invalid : 'glyphicon glyphicon-remove',
												validating : 'glyphicon glyphicon-refresh'
											},
											fields : {
												companyName : {
													validators : {
														notEmpty : {/*非空提示*/
															message : '公司名不能为空'
														},
														stringLength : {
															min : 6,
															max : 40,
															message : '名称必须在6到50位之间'
														}
													}

												},
												companySimpleName : {
													validators : {
														notEmpty : {/*非空提示*/
															message : '公司简称不能为空'
														},
														StringLength : {
															min : 2,
															max : 20,
															message : '长度不符规定'
														}
													}
												},
												logo : {
													validators : {
														notEmpty : {/*非空提示*/
															message : '用户名不能为空'
														}
													}
												},
												companyLicenseNo : {
													validators : {
														notEmpty : {/*非空提示*/
															message : '组织机构代码不能为空'
														}
													}
												},
												licenseImg : {
													validators : {
														notEmpty : {
															message : '营业执照不能为空'
														}
													}
												},
												companyCorporator : {
													validators : {
														notEmpty : {
															message : '公司法人不能为空'
														},
														StringLength : {
															min : 4,
															max : 50,
															message : "公司法人代表长度不符合规定"
														}
													}
												},
												companyTel : {
													validators : {
														notEmpty : {
															message : '公司电话不能为空'
														},
														StringLength : {
															min : 13,
															max : 13,
															message : '公司电话不能为空'
														},
														regexp : {//匹配规则
															regexp : /^0?(13[0-9]|15[012356789]|18[0-9]|17[0-9])[0-9]{8}$/,
															message : '请输入有效的手机号码'
														}
													}
												},
												companyEmail : {
													validators : {
														notEmpty : {
															message : '公司邮件不能为空'
														},
														emailAddress : {
															message : 'hello'
														}
													/* regexp:{
														regexp:/^[a-z]([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[\.][a-z]{2,3}([\.][a-z]{2})?$/i,
														message:'你输出入的电子邮箱不合法'
													 } */
													}
												},
												companyAddress : {
													validators : {
														notEmpty : {
															message : '公司地址不能为空'
														},
														StringLength : {
															min : 4,
															max : 50,
															message : "地址长度不符合规定"
														}
													}
												}

											}
										});
					});
	

</script>
<script type="text/javascript">
$(document).ready(function(){
	/* var i=$("#companyStatus").value();
	alert(i); */
	if(${user.companyStatus}==1||${user.companyStatus}==2){
		$(".disabled").attr("readonly",true);
	}
	
});

</script>

</html>