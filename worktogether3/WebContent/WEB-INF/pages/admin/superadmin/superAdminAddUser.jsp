<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--html开始  -->
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加管理员</title>
    <!-- Bootstrap -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%@include file="header.jsp" %>
   
	
  </head>
  <body>
  <div class="container">
  	<h3 class="col-md-offset-2">请填写新管理员信息</h3>
    <form id="add-admin" role="form" class="form-horizontal" action="superAdmin/addAdmin" method="post">
		<div class="form-group">
			<label for="userName" class="col-sm-2 control-label">管理员名字：</label>
			<div class="col-sm-5">
				<input id="userName" class="form-control" name="adminName" value="${superAdm.adminName }" />
			</div>
		</div>
		<div class="form-group">
			<label for="userLoginId" class="col-sm-2 control-label">管理员账号：</label>
			<div class="col-sm-5">
				<input class="form-control" id="adminLoginId" name="adminLoginId" value="" />
			</div>
			<div id="adminLoginId_info">&nbsp;</div>
		</div>
		<div class="form-group">
			<label for="adminPassword" class="col-sm-2 control-label">管理员密码：</label>
			<div class="col-sm-5">
				<input type="password" class="form-control" name="adminPassword" value="" />
			</div>
		</div>
		<div class="form-group">
			<label for="adminPasswordRepeat" class="col-sm-2 control-label">重复密码：</label>
			<div class="col-sm-5">
				<input type="password" class="form-control" name="adminPasswordRepeat" value="" />
			</div>
		</div>
		<div class="form-group">
			<label for="adminEmail" class="col-sm-2 control-label">管理员邮箱：</label>
			<div class="col-sm-5">
				<input class="form-control" name="adminEmail" value="" />
			</div>
		</div>
		<div class="form-group">
			<label for="adminTel" class="col-sm-2 control-label">管理员电话：</label>
			<div class="col-sm-5">
				<input class="form-control" name="adminTel" value="" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5">
				<input class="btn btn-success" type="submit" value="提交用户信息" />
			</div>
		</div>
	</form>
	</div>
	<div><%@include file="superAdminHome.jsp" %></div>
	<div><%@include file="footer.jsp" %></div>
  </body>
  <script type="text/javascript">
  $("#adminLoginId").bind("blur",function(){
  	$.ajax({
  		type:"POST",
		url:"superAdmin/testAdminLoginId",
		data:"adminLoginId="+$("#adminLoginId").val(),
		dataType:"json",
		success:function(data){
			if(data){
				$("#adminLoginId_info").html("帐号已存在");
			}else{
				$("#adminLoginId_info").html("可用");
			}
		}
  	});
  });
  </script>
  <script type="text/javascript">
		$(document).ready(function() {
        $("#add-admin").bootstrapValidator({
        	 message: '不符合要求',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    adminName: {
                        validators: {
                            notEmpty: {                            	
                                message: '这是必填的！！！'                                
                            },
                            stringLength:{
                            	min:1,
                            	max:18,
                            	message:"长度在1~18个字符之间"
                            },
                            regexp: {
                            	regexp: (/[\u4e00-\u9fa5]/g),
                            	message: "请输入中文名字"
                        	}

                        }
                    },
                    adminLoginId: {
                    	validators:{
                    		notEmpty: {                            	
                                message: '这是必填的！！！'                                
                           },
                           stringLength:{
                        	 	min:6,
                        	 	max:20,
                        	 	message:"最小6个字符，最大20个字符"
                           }
                    	}
                    },
                    adminPassword:{
                    	validators:{
                    		notEmpty: {                            	
                                message: '这是必填的！！！'                                
                           },
                           stringLength:{
	                       	 	min:6,
	                       	 	max:20,
	                       	 	message:"最小6个字符，最大20个字符"
                          }
                    	}
                    },
                    adminPasswordRepeat:{
                    	validators:{
                    		identical:{
                    			field:"adminPassword",
                    			message:"两次输入不一致"
                    		}
                    	}
                    },
                    adminTel: {
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
                    adminEmail:{
                    	validators:{
                    		notEmpty:{
                    			message:'这是必填的！！！'
                    		},
                    		regexp:{
                    			regexp:(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/),
                    			message:"请输入正确的邮箱地址！！！"
                    		}
                    	}
                    }
                }
        });
    });
	</script>
	 <script type="text/javascript" src="admin/js/jquery-1.10.2.min.js" ></script>
    <script type="text/javascript" src="admin/js/bootstrap.js" ></script>
    <script type="text/javascript" src="admin/dist/js/bootstrapValidator.min.js" ></script>
    <link rel="stylesheet" href="admin/dist/css/bootstrapValidator.min.css" />
  <!--html结束  -->
</html>
