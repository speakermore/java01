<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	ul{
		margin-top: 30px;
		line-height: 200%;
	}
	.wt-ly li{
		border:1px solid #f5f5f5;
		border-radius: 4px;
	}
	.wt-ly li:NTH-CHILD(odd){
		background-color: #f5f5f5;
	}
	.wt-ly li>a{
		color:#fa941b;
		text-align: center;
	}
</style>
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
					 <a href="company/cmprs/companyRecruit/">招聘信息</a>
				</li>
				
			</ul>