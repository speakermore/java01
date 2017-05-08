<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>个人用户-首页</title>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
<style type="text/css">
table {
	margin: 20px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<input type="hidden" id="getuserid" value="${user.id }" />
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-1 column"></div>
					<div class="col-md-10 column ">
						<div class="tabbable" id="tabs">
							<!-- 主要内容开始 -->
							<article
								class="col-md-12 work-together-dev-height-2000 work-together-shadow work-together-shallow">
								<!--最新状态信息组-->
								<div class="row">
									<section class="panel">
										<!-- <div class="panel-title">企业最新发布消息</div> -->
										<form action="" method="get" name="frm">
											<div id="add">
												<input type="text" name="textfield">
											</div>
										</form>
										<a href="javascript:AddElement('text')">新建文本框</a>
									</section>
									<section class="panel">
										<div class="panel-body">
											${company.title }公司发送了<<<a href="#">${companyRecruit.title }</a>>>
										</div>
										<div class="panel-footer work-together-right">
											1分钟前.<a href="#">更多....</a>
										</div>
									</section>
									<section class="panel">
										<div class="panel-body">
											${user.userName }发表了<<<a href="#">${article.title }</a>>>
										</div>
										<div class="panel-footer work-together-right">
											1分钟前.<a href="#">更多....</a>
										</div>
									</section>
									<section class="panel">
										<div class="panel-body">
											${user1.userName }评论了<<<a href="#">${article.title }</a>>>
										</div>
										<div class="panel-footer work-together-right">
											1分钟前.<a href="#">更多....</a>
										</div>
									</section>
									<section class="panel">
										<div class="panel-body">
											${user2.userName }回复了${user3.userName }对<<<a href="#">${article.title }</a>>>的评论
										</div>
										<div class="panel-footer work-together-right">
											1分钟前.<a href="#">更多....</a>
										</div>
									</section>
									<section class="panel">
										<div class="panel-body">
											${user1.userName }赞了<<<a href="#">${article.title }</a>>><span
												class="">(共10赞)</span>
										</div>
										<div class="panel-footer work-together-right">
											1分钟前.<a href="#">更多....</a>
										</div>
									</section>
								</div>
								<!--//最新状态信息组 -->
							</article>
							<!-- 主要内容结束 -->
						</div>
					</div>
					<div class="col-md-1 column"></div>
				</div>
			</div>
		</div>
	</div>
	<script language="javascript">
		function AddElement(mytype) {
				var TemO = document.getElementById("add");
				var newLabel=document.createElement("label");
				newLabel.innerText="lable1";
				TemO.appendChild(newLabel);
				var newInput = document.createElement("input");
				newInput.type = "text";
				newInput.name = "input1";
				newInput.Class="form-control";
				TemO.appendChild(newInput);
				var newline = document.createElement("br");
				TemO.appendChild(newline);
		}
	</script>
</body>
</html>