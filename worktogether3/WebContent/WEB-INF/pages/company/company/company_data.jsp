 <%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.*" pageEncoding="UTF-8"%>
 <%@ page autoFlush="true" buffer="1024kb"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<title>企业用户-企业信息</title>

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	var evt = new Event();
    m = new Magnifier(evt);
</script>

<style type="text/css">
	td>img{
		max-height: 200px;
		max-width: 160px;
	}
	.wt-hby-top{
		margin-top: 30px;
		border-right: 1px solid #f5f5f5;
		border-left: 1px solid #f5f5f5;
	}
	.panel-default{
		border-width:1px 0px 0px 0px;
		border-radius:0px;
		
	}
	.panel-group .panel{
		border-radius: 0px;
	}
	.panel-title{
		color: #fa941b; 
	}
	.panel-collapse{
		   
	}
	.wt-hby-edit{
		text-align: right;
	}
</style>
<style>
		/* 企业环境的样式 */
		
		/* Carousel base class */
		.carousel {
		  height: 400px;
		  margin-bottom: 60px;
		}
		/* Since positioning the image, we need to help out the caption */
		.carousel-caption {
		  z-index: 10;
		}
		
		/* Declare heights because of positioning of img element */
		.carousel .item {
		  height: 400px;
		  background-color: #fff;
		}
		.carousel-inner > .item > img {
		  position: absolute;
		  top: 0;
		  left: 0;
		  min-width: 100%;
		  height: 400px;
		}
		</style>
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>
<c:set var="COMPANY_TYPE" value="${CommonStatus.COMPANY_TYPE }"></c:set>
<c:set var="COMPANY_SIZE" value="${CommonStatus.COMPANY_SIZE }"></c:set>
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
<div class="container">
	<div class="row clearfix">
		<div class="col-sm-3 column">
		<%@include file="/WEB-INF/pages/company/menu.jsp" %>
		</div>
		<div class="col-sm-9 column wt-hby-top">
			<!-- 企业基本资料 -->
			<div class="panel-group" id="accordion" >
				<div class="panel panel-default">
					<div class="panel-heading">
					   	<h4 class="panel-title"><a data-toggle="collapse" href="#collapseOne">公司简介</a></h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="tab-content">
							<div class="tab-pane active" id="companySource">
								<table class="table ">
									<tbody>
										<tr>
											<td class="col-sm-5">公司全称：</td>
											<td>${user.companyName}</td>
										</tr>
										<tr>
											<td>公司简称：</td>
											<td>${user.companySimpleName}</td>
										</tr>
										<tr>
											<td>公司logo：</td>
											<td>
												<img src="company/img/${user.companyLoginId }/${user.companyLogo}" />
											</td>
										</tr>
										<tr>
											<td>公司营业执照（图）:</td>
											<td>
												<img src="company/img/${user.companyLoginId }/${user.companyLicenseImg}" />
											</td>
										</tr>
										<tr>
											<td>社会信用统一代码：</td>
											<td>${user.companyLicenseNo}</td>
										</tr>
										<tr>
											<td>公司法人：</td>
											<td>${user.companyCorporator}</td>
										</tr>
										<tr>
											<td>公司邮件：</td>
											<td>${user.companyEmail}</td>
										</tr>
										<tr>
											<td>公司地址：</td>
											<td>${user.companyAddress}</td>
										</tr>
										<c:if test="${companyConnections==null }">
											<tr>
												<td>公司联系电话：</td>
													<td></td>
											</tr>
										</c:if>
										<c:forEach var="connections" items="${companyConnections }">
											<tr>
												<td>公司联系电话：</td>
													<td>${connections.cmpConnectionName }:${connections.cmpConnection }</td>
											</tr>
										</c:forEach>
										
										<tr>
											<td>审核状态：</td>
											<td>${AUDIT_STATUS[user.companyStatus] }</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
								<div class="wt-hby-edit">
									<a href="company/company/updateCompany/0" >编辑</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 企业基本资料结束 -->
			<!-- 企业环境图片 -->
			<div class="panel-group" id="accordion">
				<div class="panel panel-default" style="border-top:0px;">
					<div class="panel-heading">
						   <h4 class="panel-title"><a data-toggle="collapse" href="#envirment-pic">公司环境图片</a></h4>
					</div>
					<div id="envirment-pic" class="panel-collapse collapse">
						<div class="tab-content">
							<div class="tab-pane active" id="companySource">
								<div class="row clearfix">
								<div class="col-sm-12 column">
									<!-- 环境图片动画 -->
									<div class="carousel slide" id="envirment-pic-slide">
										<ol class="carousel-indicators">
											<li class="active" data-slide-to="0" data-target="#envirment-pic-slide"></li>
											<li data-slide-to="1" data-target="#envirment-pic-slide"></li>
											<li data-slide-to="2" data-target="#envirment-pic-slide"></li>
											<li data-slide-to="3" data-target="#envirment-pic-slide"></li>
											<li data-slide-to="4" data-target="#envirment-pic-slide"></li>
											<li data-slide-to="5" data-target="#envirment-pic-slide"></li>
										</ol>
										<div class="carousel-inner">
											 <c:forEach items="${detailImgs }" var="imgs" varStatus="st">
											 	<div class="item ${st.index==0?"active":"" }">
												<img src="company/img/${user.companyLoginId }/${imgs.companyDetailImg}" />
												<div class="carousel-caption">
													<h4 style="color:#fff">
														${imgs.companydetailDisc }
													</h4>
													<p>
														<!-- 牟勇：详情描述，目前暂无内容 -->
													</p>
												</div>
											</div>
											</c:forEach>
										</div> <a class="left carousel-control" href="#envirment-pic-slide" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#envirment-pic-slide" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
									</div><!-- 环境图片动画结束 -->
								</div><!-- .com-sm-12 end -->
							</div>
								<div class="wt-hby-edit">
									<a href="company/company/updateCompany/1" >编辑</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
			<!-- 企业环境图片结束 -->
			<!-- 企业详细资料 -->
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						   <h4 class="panel-title"><a data-toggle="collapse" href="#collapseThree">公司详细资料</a></h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse">
						<div class="tab-content">
							<div class="tab-pane active" id="companySource">
								<table class="table ">
									<tbody>
										<tr>
											<td class="col-sm-5">公司简介：</td>
											<td>${companyInt.cmpIntroduction }</td>
										</tr>
										<tr>
											<td>公司性质：</td>
											<td>${COMPANY_TYPE[companyInt.cmpIntQuality] }</td>
										</tr>
										<tr>
											<td>公司规模：</td>
											<td>${COMPANY_SIZE[companyInt.cmpIntPeopleNum] }</td>
										</tr>
										<tr>
											<td>公司福利：</td>
											<td>${companyInt.cmpIntComforts}</td>
										</tr>
										<tr>
											<td>公司休息制度：</td>
											<td>${companyInt.cmpIntRest}</td>
										</tr>
										<tr>
											<td>公司保险：</td>
											<td>${companyInt.cmpIntInsurance}</td>
										</tr>
										<tr>
											<td>职业薪资：</td>
											<td>${companyInt.cmpIntWage}</td>
										</tr>
										<tr><td></td><td></td></tr>
									</tbody>
								</table>
								<div><input type="hidden" value="${companyInt.cmpIntStatus}"></div>
								<div class="wt-hby-edit">
									<a href="company/company/updateCompanyInt">编辑</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 企业详细资料结束 -->
		</div>
	</div>
</div>
<script type="text/javascript">
/* 牟勇：环境图片特效的代码 */
$(function() {
	
	var magnifierConfig = {
		magnifier : "#magnifier1",//最外层的大容器
		width : 500,//承载容器宽
		height : 370,//承载容器高
		moveWidth : null,//如果设置了移动盒子的宽度，则不计算缩放比例
		zoom : 5//缩放比例
	};

	var _magnifier = magnifier(magnifierConfig);
});
</script>
</body>

</html>