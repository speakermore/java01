<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul{
		margin-top: 50px;
		line-height: 200%;
	}
	
	.wt-ly li:NTH-CHILD(odd){
		background-color: #f5f5f5;
	}
	.wt-ly li>a{
		color:#fa941b;
	}
</style>
</head>
<body>
<ul class="nav nav-pills nav-stacked wt-ly" >
				<li>
					 <a href="company/artanddis/company_index">首页</a>
				</li>
				<li>
					 <a href="company/company/company_data">我的资料</a>
				</li>
				<li>
					 <a href="company/charge/companyCharge/${user.id}">我的钱包</a>
				</li>
				<li>
					 <a href="company/charge/charge">充值</a>
				</li>
				<li>
					<a href="company/artanddis/add_companyarticle">新闻发布</a>
				</li>
				<!-- <li>
					 <a href="#">帮助中心</a>
				</li> -->
				<li>
					 <a href="company/cmprs/companyRecruit/">查看招聘信息</a>
				</li>
				
			</ul>

</body>
</html>