<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>审核企业</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--全局颜色配置  #fa941b #fe6000
    	.wt-hby-zr自定义样式了类命名规范
    	
    -->
  </head>
  <body>
		<div class="col-md-offset-4">
		<div class="row">
			<div class="col-sm-11" style="border: 1px solid black">
				<div class="row" style="background-color: #CCCCCC;">
					<div class="col-sm-12">
						待审核企业:
						<section class="panel">
							<heading class="panel-heading"> <c:forEach
								items="${company}" var="com">
								<ul class="clean">
									<tr>
										<td><a href="admin/findAuditCompanyById?id=${com.id}">
												${com.companyName} </a></td>
									</tr>

								</ul>
							</c:forEach>
							</heading>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>

