<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="UTF-8">
		<%@include file="../header.jsp"%>
		<link href="admin/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="admin/js/jquery-1.10.2.min.js" ></script>
		<script type="text/javascript" src="admin/js/bootstrap.js" ></script>
		<link rel="stylesheet"  type="text/css" href="admin/dist/css/bootstrapValidator.min.css" />	
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		    <!-- WARNING: Respond.Sjs doesn't work if you view the page via file:// -->
		    <!--[if lt IE 9]>
		      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
		    <![endif]-->
		<title>管理员信息维护</title>
		<style type="text/css">
			div{
				outline: 0px solid goldenrod;
			}
		</style>
	</head>
	<body>
	<%@include file="../menu.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-sm-1">
					&nbsp;
				</div>	
			<div id="left_part" class="col-sm-6">
				<div class="col-sm-12">
					<p class="text-muted">你好，${admin.adminLoginId}</p>
				</div>
				<div id="enlightenment" class="col-sm-7" >
					<p class="text-danger"><strong><h3>修改信息前，请务必确认输入的邮箱地址为真实有效邮箱，否则有可能造成密码无法重置</h3></strong></p>
				</div>
				<div id="adin_info" class="col-sm-5">
					<p style="color:red;">${operatorInfo}</p>
					<p class="text-info">管理员姓名：${admin.adminName}</p>
					<p class="text-info">管理员手机：${admin.adminTel}</p>
					<p class="text-info">管理员邮箱：${admin.adminEmail}</p>
				</div>
			</div>
			<div id="maintenance"   class="col-sm-5">
				<form action="admin/maIntegerainAdmin" method="post" id="form_maintenance">
				  <div class="form-group">
				    <label for="real_name">新的管理员姓名</label>
				    <input type="text" class="form-control" id="real_name" name="adminName" placeholder="请输入管理员的真实姓名">
				  </div>
				  <div class="form-group">
				    <label for="phone_number">新的手机号码</label>
				    <input type="text" class="form-control" id="phone_number" name="adminTel" placeholder="请输入新的手机号">
				  </div>
				  <div class="form-group">
				    <label for="email_address">新的Email</label>
				    <input type="text" class="form-control" id="admin_email"  name="adminEmail" placeholder="请输入真实有效的Email地址">
				  </div>
				  <div class="col-sm-offset-9">
				  	<button type="submit" class="btn btn-default" >确定</button>
				  </div>
				  
				</form>
			</div>
			</div>
			</div>
		<script type="text/javascript">
		$(document).ready(function() {
        $('#form_maintenance').bootstrapValidator({
        	 message: '不符合要求',
        	
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    admin_name: {
                        validators: {
                            notEmpty: {                            	
                                message: '这是必填的！！！'                                
                            },
                            stringLength:{
                            	min:1,
                            	max:5,
                            	message:"长度在0~5个字符之间"
                            },
                            regexp: {
                            	regexp: (/[\u4e00-\u9fa5]/g),
                            	message: "请输入中文名字"
                        	}

                        }
                    },
                    admin_phone: {
                    	validators:{
                    		notEmpty: {                            	
                                message: '这是必填的！！！'                                
                           },
                    		regexp:{
                    			regexp:(/^[1][3-9][0-9]{9}$/),
                    			message:"请输入有效的手机号"
                    		}
                    	}
                    },
                    admin_email:{
                    	validators:{
                    		notEmpty:{
                    			message:'这是必填的！！！'
                    		}
                    	}
                    }
                }
        });
    });
	</script>
	<%@include file="../footer.jsp"%>
	<%@include file="/WEB-INF/pages/copyright.jsp" %>
	<script type="text/javascript" src="admin/dist/js/bootstrapValidator.min.js" ></script>
	</body>
</html>