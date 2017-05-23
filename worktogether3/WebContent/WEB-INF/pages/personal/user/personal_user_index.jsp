<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>个人主页</title>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
<style type="text/css">
.box {
	padding-left: 80px;
	padding-right: 80px;
}

.more {
	color: white;
	float: right;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-2 column">
				<img alt="头像"
					src="img/personal/user/${usermg.userLoginId}/${usermg.userHeadImgPath}"
					class="img-circle" width="140px" height="140" />
			</div>
			<div class="col-md-6 column">
				<div class="page-header">
					<h1>${usermg.userRealName}<br /> <small>性别：<c:if
								test="${usermg.userGender==0 }">男</c:if> <c:if
								test="${usermg.userGender==1 }">女</c:if></small><small>年龄：${usermg.resumeBirthday}</small><small>学历：${usermg.resumeEducation}</small>
					</h1>
				</div>
			</div>
			<div class="col-md-4 column">
				<div class="col-md-12 column">
					<div class="btn-group btn-group-lg">
						<a class="btn btn-default" type="button btn-primary"> <em
							class="glyphicon glyphicon-align-left"></em> 关注
						</a> <a class="btn btn-default" type="button"> <em
							class="glyphicon glyphicon-align-center"></em> 邀请面试
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<div class="list-group">
							<a href="#" class="list-group-item active">基本资料</a>
							<div class="box">
								<div class="list-group-item">期望职位：</div>
								<div class="list-group-item">
									<h4 class="list-group-item-heading">${usermg.resumeJor}</h4>
								</div>
								<div class="list-group-item">期望薪资：</div>
								<div class="list-group-item">
									<h4 class="list-group-item-heading">${usremg.resumeWages}
									</h4>
								</div>
								<div class="list-group-item">自我评价：</div>
								<div class="list-group-item">
									<h4 class="list-group-item-heading">
										${usermg.resumeSelfEvaluation}</h4>
								</div>
							</div>
						</div>
						<div class="list-group">
							<a href="#" class="list-group-item active">工作经验</a>
							<c:forEach items="${usermg }" var="usermg">
								<div class="box">
									<div class="list-group-item">公司名称：</div>
									<div class="list-group-item">
										<h3 class="list-group-item-heading">
											${usermg.workFirmName}</h3>
									</div>
									<div class="list-group-item">工作时间：</div>
									<div class="list-group-item">
										<h4 class="list-group-item-heading">
											${usermg.workBeginTime}-${usermg.workEndTime}</h4>
									</div>
									<div class="list-group-item">在职职位：</div>
									<div class="list-group-item">
										<h4 class="list-group-item-heading">${usermg.workUnit}</h4>
									</div>
									<div class="list-group-item">工作职责：</div>
									<div class="list-group-item">
										<h4 class="list-group-item-heading">
											${usermg.workDescription}</h4>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="list-group">
							<a href="#" class="list-group-item active">教育经历</a>
							<c:forEach items="${usermg }" var="usermg">
								<div class="box">
									<div class="list-group-item">学校名称：</div>
									<div class="list-group-item">
										<h3 class="list-group-item-heading">
											${usermg.educationSchool}</h3>
									</div>
									<div class="list-group-item">专业：</div>
									<div class="list-group-item">
										<h4 class="list-group-item-heading">
											${usermg.educationContent}</h4>
									</div>
									<div class="list-group-item">学习时间：</div>
									<div class="list-group-item">
										<h4 class="list-group-item-heading">
											${usermg.educationBeginTime}-${usermg.educationEndTime}</h4>
									</div>

								</div>
							</c:forEach>
						</div>
						<div class="list-group">
							<div class="list-group-item active">
								<span>他的发布</span> <a href="#" class="more">更多...</a>
							</div>
							<div class="box">
								<div class="col-md-12 column">
									<div class="row">
										<div class="col-md-4">
											<div class="thumbnail">
												<div class="caption">
													<h3>${usermg.articleTitle}</h3>
													<p>${usermg.articleContent}</p>
													<p>
														<a class="btn btn-primary" href="#">详细...</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<div class="caption">
													<h3>${usermg.articleTitle}</h3>
													<p>${usermg.articleContent}</p>
													<p>
														<a class="btn btn-primary" href="#">详细...</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<div class="caption">
													<h3>${usermg.articleTitle}</h3>
													<p>${usermg.articleContent}
													<p>
														<a class="btn btn-primary" href="#">详细...</a>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
