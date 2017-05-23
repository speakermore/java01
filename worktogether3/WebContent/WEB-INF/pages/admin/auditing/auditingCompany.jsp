<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>公司资质审核</title>
<%@include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="admin/css/magnifier.css">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="admin/js/magnifier.js"></script>

<style type="text/css">
td>img {
	max-height: 200px;
	max-width: 160px;
}

.wt-hby-top {
	margin-top: 30px;
	border-right: 1px solid #f5f5f5;
	border-left: 1px solid #f5f5f5;
}

.panel-default {
	border-width: 1px 0px 0px 0px;
	border-radius: 0px;
}

.panel-group .panel {
	border-radius: 0px;
}

.panel-title {
	color: #fa941b;
}

.panel-collapse {
	
}

.wt-hby-edit {
	text-align: right;
}
</style>
<!-- Bootstrap -->
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
</head>
<body>
	<%@include file="../menu.jsp"%>
	<div class="col-sm-offset-2">
		<div class="contianer">
			<div class="row clearfix">
				<div class="col-sm-11 column wt-hby-top">
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" href="#collapseOne">公司简介</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="tab-content">
									<div class="tab-pane active" id="companySource">
										<table class="table ">
											<tbody>
												<tr>
													<td class="col-sm-5">公司全称：</td>
													<td>${auditComIntro.companyName}</td>
												</tr>
												<tr>
													<td>公司简称：</td>
													<td>${auditComIntro.companySimpleName}</td>
												</tr>
												<tr>
													<td>公司logo：</td>
													<td><img
														src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${auditComIntro.companyLoginId }/${auditComIntro.companyLogo}" />
													</td>
												</tr>
												<tr>
													<td>公司营业执照（图）:</td>
													<td><img
														src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${auditComIntro.companyLoginId }/${auditComIntro.companyLicenseImg}" />
													</td>
												</tr>
												<tr>
													<td>公司营业执照码：</td>
													<td>${auditComIntro.companyLicenseNo}</td>
												</tr>
												<tr>
													<td>公司法人：</td>
													<td>${auditComIntro.companyCorporator}</td>
												</tr>
												<tr>
													<td>公司邮件：</td>
													<td>${auditComIntro.companyEmail}</td>
												</tr>
												<tr>
													<td>公司地址：</td>
													<td>${auditComIntro.companyAddress}</td>
												</tr>
												<tr>
													<td>审核情况：</td>
													<td><c:if test="${auditComIntro.companyStatus==2}">
															<div class="pass">
																<span class="glyphicon glyphicon-ok-circle"
																	aria-hidden="true"></span> &nbsp;通过
															</div>
														</c:if> <c:if test="${auditComIntro.companyStatus==3}">
															<div class="reject">
																<span class="glyphicon glyphicon-ban-circle"
																	aria-hidden="true"></span> &nbsp;未能通过审核
															</div>
														</c:if> <c:if test="${auditComIntro.companyStatus==1}">
															<div class="wait-audit">
																<span class="glyphicon glyphicon-question-sign"
																	aria-hidden="true"></span> &nbsp;待审核
															</div>
														</c:if> <c:if test="${auditComIntro.companyStatus==4}">
															<div class="delete">
																<span class="glyphicon glyphicon-remove-circle"
																	aria-hidden="true"></span> &nbsp;公司已被禁用
															</div>
														</c:if></td>
												</tr>
												<tr>
													<td style="text-align: center;"><a class="btn btn-default"
														href="admin/auditArticle/${auditComIntro.id}/2"
														class="btn btn-default"> <span
															class="glyphicon glyphicon-ok" aria-hidden="true">
														</span> 通过审核
													</a></td>
													<td style="text-align: center;"><a
														href="admin/auditArticle/${auditComIntro.id}/3"
														class="btn btn-default"> <span
															class="glyphicon glyphicon-remove" aria-hidden="true">
														</span> 不能通过审核
													</a></td>
												</tr>
											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-group" id="accordion">
						<div class="panel panel-default" style="border-top: 0px;">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" href="#collapseTwo">公司详细图片</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<div class="tab-content">
									<div class="tab-pane active" id="companySource">
										<div class="magnifier" id="magnifier1">
											<div class="magnifier-container">
												<div class="images-cover"></div>
												<!--当前图片显示容器-->
												<div class="move-view"></div>
												<!--跟随鼠标移动的盒子-->
											</div>
											<div class="magnifier-assembly">
												<div class="magnifier-btn">
													<span class="magnifier-btn-left">&lt;</span> <span
														class="magnifier-btn-right">&gt;</span>
												</div>
												<!--按钮组-->
												<div class="magnifier-line">
													<ul class="clearfix animation03">
														<c:forEach items="${detailImgs}" var="imgs">
															<li>
																<div class="small-img">
																	<img
																		src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${auditComIntro.companyLoginId }/${imgs.companyDetailImg}" />
																</div>
															</li>
														</c:forEach>

													</ul>
												</div>
												<!--缩略图-->
											</div>
											<div class="magnifier-view"></div>
											<!--经过放大的图片显示容器-->
										</div>
										<div class="wt-hby-edit">
											<a href="company/company/updateCompany/">编辑</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" href="#collapseThree">公司基本资料</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse in">
								<div class="tab-content">
									<div class="tab-pane active" id="companySource">
										<table class="table ">
											<tbody>
												<tr>
													<td class="col-sm-5">公司简介：</td>
													<td>${auditComIntro.cmpIntroduction }</td>
												</tr>
												<tr>
													<td>公司性质：</td>
													<td>${auditComIntro.cmpIntQuality}</td>
												</tr>
												<tr>
													<td>公司规模：</td>
													<td>${auditComIntro.cmpIntPeopleNum}人</td>
												</tr>
												<tr>
													<td>公司福利：</td>
													<td>${auditComIntro.cmpIntComforts}</td>
												</tr>
												<tr>
													<td>公司休息制度：</td>
													<td>${auditComIntro.cmpIntRest}</td>
												</tr>
												<tr>
													<td>公司保险：</td>
													<td>${auditComIntro.cmpIntInsurance}</td>
												</tr>
												<tr>
													<td>职业薪资：</td>
													<td>${auditComIntro.cmpIntWage}</td>
												</tr>
												<tr>
													<td>审核情况：</td>
													<td><c:if test="${auditComIntro.cmpIntStatus==2}">
															<div class="pass">
																<span class="glyphicon glyphicon-ok-circle"
																	aria-hidden="true"></span> &nbsp;通过
															</div>
														</c:if> <c:if test="${auditComIntro.cmpIntStatus==3}">
															<div class="reject">
																<span class="glyphicon glyphicon-ban-circle"
																	aria-hidden="true"></span> &nbsp;未能通过审核
															</div>
														</c:if> <c:if test="${auditComIntro.cmpIntStatus==1}">
															<div class="wait-audit">
																<span class="glyphicon glyphicon-question-sign"
																	aria-hidden="true"></span> &nbsp;待审核
															</div>
														</c:if> <c:if test="${auditComIntro.cmpIntStatus==4}">
															<div class="delete">
																<span class="glyphicon glyphicon-remove-circle"
																	aria-hidden="true"></span> &nbsp;公司已被禁用
															</div>
														</c:if>
														</td>
												</tr>
												<tr>
													<td style="text-align: center;"><a class="btn btn-default"
														href="admin/auditArticle/${auditComIntro.id}/2"
														class="btn btn-default"> <span
															class="glyphicon glyphicon-ok" aria-hidden="true">
														</span> 通过审核
													</a></td>
													<td style="text-align: center;"><a
														href="admin/auditArticle/${auditComIntro.id}/3"
														class="btn btn-default"> <span
															class="glyphicon glyphicon-remove" aria-hidden="true">
														</span> 不能通过审核
													</a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of contianer -->
	</div>
	<%@include file="../footer.jsp"%>
	<script type="text/javascript">
$(function() {
	
	var magnifierConfig = {
		magnifier : "#magnifier1",//最外层的大容器
		width : 500,//承载容器宽
		height : 370,//承载容器高
		moveWidth : null,//如果设置了移动盒子的宽度，则不计算缩放比例
		zoom : 5//缩放比例
	};

	var _magnifier = magnifier(magnifierConfig);

	/*magnifier的内置函数调用*/
	/*
		//设置magnifier函数的index属性
		_magnifier.setIndex(1);

		//重新载入主图,根据magnifier函数的index属性
		_magnifier.eqImg();
	*/
});
</script>
</body>
</html>
