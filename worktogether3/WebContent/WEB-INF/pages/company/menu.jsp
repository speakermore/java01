<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	/* ul{
		margin-top: 30px;
		line-height: 200%;
	} */
	.wt-ly li{
		/* border:1px solid #f5f5f5; */
		border-radius: 4px;
	}
	/* .wt-ly li:NTH-CHILD(odd){
		background-color: #f5f5f5;
	} */
	.wt-ly li>a{
		color:#fa941b;
		text-align: center;
	}
</style>
<!-- 牟勇：菜单重制 -->
<div class="row clearfix">
		<div class="col-sm-12 column">
			<div class="panel-group" id="my-menu">
				<!-- 企业中心 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#my-menu" href="#my-center">企业中心</a>
					</div>
					<div id="my-center" class="panel-collapse collapse">
						<div class="panel-body">
							<ul class="nav">
								<li><a href="company/company/company_data">企业信息</a></li>
								<li><a href="company/artanddis/company_index">企业首页</a></li>
								<li><a href="company/charge/companyCharge/${user.id}">企业余额</a></li>
								<li><a href="company/charge/charge">充值</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 企业中心结束 -->
				<!-- 文章管理 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#my-menu" href="#my-news">文章管理</a>
					</div>
					<div id="my-news" class="panel-collapse collapse">
						<div class="panel-body">
						<ul class="nav">
							<li><a href="company/artanddis/add_companyarticle">文章发布</a></li>
						</ul>
						</div>
					</div>
				</div>
				<!-- 文章管理结束 -->
				<!-- 招聘管理 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#my-menu" href="#my-recruit">招聘管理</a>
					</div>
					<div id="my-recruit" class="panel-collapse collapse">
						<div class="panel-body">
						<ul class="nav">
							<li><a href="company/cmprs/companyRecruit/add_companyRecruit ">添加招聘信息</a></li>
							<li><a href="company/cmprs/companyRecruit/">招聘信息列表</a></li>
							<li><a href="offer/company_offer_list/1">发送offer</a></li>
						</ul>
						</div>
					</div>
				</div>
				<!-- 招聘管理结束 -->
			</div>
		</div>
	</div>