<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
    
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>
    <%@include file="/WEB-INF/pages/company/header.jsp" %>
	<%@include file="/WEB-INF/pages/company/footer.jsp" %>
   </head>
  <body>
		<!--wt-姓名首字母-相关文字-->
		<div id="wt-hby-login">
				<%@include file="/WEB-INF/pages/nav.jsp" %> 
			<div class="bs-docs-header wt-hby-login-center"  id="content" tabindex="-1">
				<div class="container bs-docs-container">
					<form class="form-signin" action="company/company/login" method="post">
					<h2 class="form-signin-heading">欢迎企业用户登录</h2>
					<div class="form-group">
						<label for="companyLoginId" class="sr-only">手机号</label> <input
							type="text" id="companyLoginId" class="form-control"
							name="companyLoginId" required placeholder="手机号">
					</div>
					<div class="form-group">
						<label for="companyPassword" class="sr-only">密码</label> <input
							type="password" id="companyPassword" class="form-control"
							name="companyPassword" placeholder="密码" required>
					</div>
        		
        		<div class="form-group">
						<!--请求验证码---->
						<input type="text" id="validateCode" class="form-control"
							name="validateCode" placeholder="请输入验证码" required autocomplete="off"/>
							<c:if test="${operatorInfo!=null }">
						<div id="validateCodeToolTip" >${operatorInfo }</div></c:if>
					</div>
					<img id="validateCode" alt="validateCode "
						src="admin/codeValidate?time=<%=new Date().getTime()%>" />

					<a class="btn btn-default" href="javascript:void(0)" role="button"
						class="btn btn-primary btn-sm">看不清，换一张</a>
        		
        		
        		<div class="checkbox col-md-12" >
	            	<!-- <input type="checkbox" value="remember-me" id="remeberPassword"> 记住密码 -->
	            	<input name="remFlag" type="checkbox" onclick="remember();" id="remFlag">记住密码 
	            	<a href="#" class="col-md-offset-6">忘记密码？</a>
        		</div>
        		<button class="btn btn-lg btn-success btn-block" type="submit" id="btn">立即登录</button>
        		<label for="remember-me">
    
</label>
      		</form>
    		</div>
			</div>
			<div class="wt-hby-login-bottom">
				<img src="img/1-1-2.jpg"/>
				<a class="back-to-top" href="#top">返回顶部</a>
			</div>
		</div>
   	<%@include file="../footer.jsp" %>
  </body>
  <script type="text/javascript">
  $("#validateCode+a")
	.click(
			function() {
				var path = "${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/";
				$("img")
						.attr(
								"src",
								path
										+ "admin/codeValidate?time="
										+ new Date().getTime());
			});
$(document).ready(function(){
        //记住密码功能
        var str = getCookie("loginInfo");
        str = str.substring(1,str.length-1);
        var companyLoginId = str.split(",")[0];
        var companyPassword = str.split(",")[1];
        //自动填充用户名和密码
        $("#companyLoginId").val(companyLoginId);
        $("#companyPassword").val(companyPassword);
});

//获取cookie
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
}

//记住密码功能
function remember(){
    var remFlag = $("input[type='checkbox']").is(':checked');
    if(remFlag==true){ //如果选中设置remFlag为1
        //cookie存用户名和密码,回显的是真实的用户名和密码,存在安全问题.
        var conFlag = confirm("记录密码功能不宜在公共场所(如网吧等)使用,以防密码泄露.您确定要使用此功能吗?");
        if(conFlag){ //确认标志
            $("#remFlag").val("1");
        }else{
            $("input[type='checkbox']").removeAttr('checked');
            $("#remFlag").val("");
        }
    }else{ //如果没选中设置remFlag为""
        $("#remFlag").val("");
    }
}

$(document).ready(function() {
    /* *
     * 下面是进行插件初始化
     * 你只需传入相应的键值对
     * */
    $('#updateCompany').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	companyLoginId:{
					validators:{
						notEmpty:{
							message:'手机号不能为空！'
						},
						StringLength:{
							min:13,
							max:13,
							message:'公司电话不能为空'
						},
						regexp: {//匹配规则
	                    	regexp: /^0?(13[0-9]|15[012356789]|18[0-9]|17[0-9])[0-9]{8}$/,
	                        message: '请输入有效的手机号码'
	                    }
					}
				},
				companyPassword:{
					validators:{
						notEmpty:{
							message:'手机号不能为空！'
						},
						StringLength:{
							min:13,
							max:13,
							message:'公司电话不能为空'
						},
						regexp: {//匹配规则
	                    	regexp: /^0?(13[0-9]|15[012356789]|18[0-9]|17[0-9])[0-9]{8}$/,
	                        message: '请输入有效的手机号码'
	                    }
					}
				}
				
            }
        });
});
</script>
</html>
