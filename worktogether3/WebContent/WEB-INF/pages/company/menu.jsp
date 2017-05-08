<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.wt-ly li{
		background-color: #fffcb8;
	}
	.wt-ly li>a{
		color:#000000;
	}
</style>
</head>
<body>
<ul class="nav nav-pills nav-stacked wt-ly" >
				<li>
					 <a href="company/artanddis/">首页</a>
				</li>
				<li>
					 <a href="company/company/findById/${company.id }">我的资料</a>
				</li>
				<li>
					 <a href="company/charge/company_charge/${company.id }">我的钱包</a>
				</li>
				<li>
					 <a href="company/charge/charge">充值</a>
				</li>
				<li>
					 <a href="#">帮助中心</a>
				</li>
				<li>
					 <a href="company/cmprs/companyRecruit/">发布招聘信息</a>
				</li>
				<li class="disabled">
					 <a href="#">信息</a>
				</li>
				<li class="dropdown pull-right">
					 <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							 <a href="#">操作</a>
						</li>
						<li>
							 <a href="#">设置栏目</a>
						</li>
						<li>
							 <a href="#">更多设置</a>
						</li>
						<li class="divider">
						</li>
						<li>
							 <a href="#">分割线</a>
						</li>
					</ul>
				</li>
			</ul>

</body>
</html>