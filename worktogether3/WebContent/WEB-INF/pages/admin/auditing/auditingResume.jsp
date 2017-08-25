<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员简历审核</title>
<style>
.col-sm-1, .col-sm-3, .col-sm-2,.col-sm-4,.col-sm-7 {
	padding: 0px;
}
blockquote h1 {
	font-size: 18px;
	color: #fa941b;
	margin-bottom: 20px;
	margin-top: 15px;
}
</style>
<!-- Bootstrap -->
<%@include file="../header.jsp"%>
</head>
<body>
	<!-- 加入显示数组 -->
	<c:set var="genders" value="${CommonStatus.SEX }"></c:set>
	<c:set var="MARRIAGE" value="${CommonStatus.MARRIAGE }"></c:set>
	<c:set var="flAbility" value="${CommonStatus.FL_ABILITY}"></c:set>
	<c:set var="flType" value="${CommonStatus.FL_TYPE}"></c:set>
	<c:set var="englishGrade" value="${CommonStatus.ENGLISH_GRADE}"></c:set>
	<c:set var="computerAbility" value="${CommonStatus.COMPUTER_ABILITY}"></c:set>
	<div><%@include file="../menu.jsp"%></div>
	<div class="container">
		<div class="row">
			<div class="col-sm-offset-1">
				<blockquote>
					<h1>${resume.resumeName }的简历（创建于：<time><fmt:formatDate value="${resume.resumeCreateDate}" pattern="yyyy年 MM月 dd日"></fmt:formatDate> </time>）</h1>
				</blockquote>
				<label class="control-label">求职岗位：</label>${resume.resumeTitle}
			</div>
			<div class="col-sm-offset-1 col-md-offset-1 col-xs-offset-1">
				<div class="col-sm-2">
					<img src="/img/upload/personal/${resumeOwner.userLoginId}/${resume.resumeHeadImg}" width="90px" height="120px" />
				</div>
				<div class="col-sm-10">
					<div class="row">
						<div class="col-xs-12">
							<div id="name-space">
								姓名：<strong>${resume.resumeName}</strong>
							</div>
						</div>
					</div>
					<div class="row">
						
						<div class="col-sm-2">${resume.resumePlace}人|</div>
						<div class="col-sm-1">
							&nbsp;${genders[resume.resumeGender]}&nbsp;|</div>
						<div class="col-sm-1">
							&nbsp;${MARRIAGE[resume.resumeMarriage]}&nbsp;|</div>
						<div class="col-sm-3">
							<fmt:formatDate value="${resume.resumeBirthday}" pattern="yyyy年 MM月 dd日" />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<em class="glyphicon glyphicon-phone-alt"></em>&nbsp;${resume.resumePhone}
						</div>
						<div class="col-sm-3 communication-info">
							<span class="glyphicon glyphicon-cloud"></span>&nbsp;${resume.resumeQQ}
						</div>
						<div class="col-sm-6 communication-info">
							<span class="glyphicon glyphicon-envelope"></span>&nbsp;${resume.resumeEmail}
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-offset-1 col-sm-11 top-space-small bottom-border">
				<blockquote>
					<h1>
						&nbsp;&nbsp;<span class="glyphicon glyphicon-wrench"></span>&nbsp;&nbsp;技能信息
					</h1>
				</blockquote>
					<div class="row" >
						<div class="col-sm-4">${flType[resume.resumeFLType]}</div>
						<div class="col-sm-4">${flAbility[resume.resumeFLAbility]}</div>
					</div>
			</div>
			<div class="col-sm-offset-1 col-sm-11 top-space-small bottom-border">
				<blockquote>
					<h1>
						&nbsp;&nbsp;<span class="glyphicon glyphicon-education"></span>&nbsp;&nbsp;教育信息
					</h1>
				</blockquote>
					<div class="row">
						<div class="col-sm-2">
							<fmt:formatDate value="${resume.resumeGraduationTime}" pattern="yyyy年 MM月 dd日" />
						</div>
						<div class="col-sm-4">毕业于${resume.resumeGraduationSchool}</div>
						<div class="col-sm-1">${resume.resumeEducation}</div>
						<div class="col-sm-4">所学专业：${resume.resumeMajor}</div>
					</div>
			</div>
			<div class="col-sm-offset-1 col-sm-11 top-space-small bottom-border">
				<blockquote>
					<h1>
						&nbsp;&nbsp;<span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;自我认识
					</h1>
				</blockquote>
					<div class="row">
						<div class="col-sm-12">
							<div class="col-sm-2 right-aline">
								<span class="item">自我评价：</span>
							</div>
							<div class="col-sm-10">
								${resume.resumeSelfEvaluation}
							</div>
						</div>	
					</div>
				
			</div>
			<!-- end of total Info -->
			<div class="col-sm-12 top-space">
				
			</div>
			<div class="col-sm-offset-1 col-sm-11 top-space-small">
				<blockquote>
					<h1>
						&nbsp;&nbsp;<span class="glyphicon glyphicon-briefcase"></span>&nbsp;&nbsp;工作经历
					</h1>
				</blockquote>
				<div class="row">
				<c:forEach items="${works}" var="work" varStatus="status">
					<div class="col-sm-12 top-space-small bottom-border-dashed">
						<div class="row" >
							<div class="col-sm-4">
								<span ><strong>${work.workFirmName}</strong></span>
							</div>
							<div class="col-sm-6 item">
								<span> <fmt:formatDate value="${work.workBeginTime}" pattern="yyyy年  MM月 dd日" />
								</span>-- <span> <fmt:formatDate
										value="${work.workEndTime}" pattern="yyyy年  MM月 dd日" /></span>
							</div>
							<div class="col-sm-2">
								<strong>${work.workUnit}</strong>
							</div>
						</div>
							<div class="row">
								<div class="col-sm-1"><span class="item">工作描述</span></div>	
								<div class="col-sm-11">${work.workDescription}</div>			
							</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<!-- end of work -->

			<div class="col-sm-offset-1 col-sm-11 top-space">
				<blockquote>
					<h1>
						&nbsp;&nbsp;<span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;项目经验
					</h1>
				</blockquote>
				<div class="row">
				<c:forEach items="${projects}" var="project" varStatus="status">
					<div class="col-sm-12 top-space-small bottom-border-dashed">
						<div class="row">
							<div class="col-sm-7">
								<strong>${project.projectName}</strong>
							</div>
							<div class="col-sm-5 item">
								<span> <fmt:formatDate value="${project.projectBeginTime}" pattern="yyyy年  MM月 dd日" />
								</span>-- 
								<span> <fmt:formatDate value="${project.projectEndTime}" pattern="yyyy年  MM月 dd日" />
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-1"><span class="item">项目岗位</span></div>
							<div class="col-sm-11"><strong>${project.projectJob}</strong></div>
						</div>
						<div class="row">
							<div class="col-sm-1"><span class="item">项目描述</span></div>
							<div class="col-sm-11">${project.projectDescription}</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<!-- end of project -->
			<div class="col-sm-offset-1 col-sm-11 top-space">
				<blockquote>
					<h1>
						&nbsp;&nbsp;<span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;培训经历
					</h1>
				</blockquote>
				<div class="row">
				<c:forEach items="${edus}" var="edu" varStatus="status">
					<div class="col-sm-12 top-space-small bottom-border-dashed">
						<div class="row">
							<div class="col-sm-7">
								<strong>${edu.educationSchool}</strong>
							</div>
							<div class="col-sm-5 item">	
								<span><fmt:formatDate value="${edu.educationBeginTime}" pattern="yyyy年  MM月 dd日" />--<fmt:formatDate
										value="${edu.educationEndTime}" pattern="yyyy年  MM月 dd日" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-1"><span class="item">培训内容</span></div>
							<div class="col-sm-11">
								${edu.educationContent}
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<!-- end of education -->
			<div class="col-sm-12">&nbsp;</div>
			<div class="col-sm-12 col-sm-offset-1">
				<div class="col-sm-6">
					<a href="admin/auditResume/${resume.id}/2" class="btn btn-default">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"> </span>
						通过审核
					</a>
				</div>
				<div class="col-sm-6">
					<a href="admin/auditResume/${resume.id}/3" class="btn btn-default">
						<span class="glyphicon glyphicon-remove" aria-hidden="true">
					</span> 不能通过审核
					</a>
				</div>
			</div>
		</div>
		<!-- end of row -->
	</div>
	<!-- end of container -->

	<div><%@include file="../footer.jsp"%></div>
</body>
</html>
