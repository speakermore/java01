<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员简历审核</title>

<!-- Bootstrap -->
<%@include file="../header.jsp"%>
</head>
<body>
	<!-- 加入显示数组 -->
	<c:set var="genders" value="${CommonStatus.SEX }"></c:set>
	<c:set var="MARRIAGE" value="${CommonStatus.MARRIAGE }"></c:set>
	<div><%@include file="../menu.jsp"%></div>
	<div class="container">
		<div class="row">
			<div class="col-sm-offset-1 page-header">
				<h1>${resume.resumeTitle}<small>${resume.resumeCreateDate}</small>
				</h1>
			</div>
			<div class="col-sm-offset-1 bottom-border-large">
				<div class="col-sm-2">
					<img
						src="/img/upload/personal/${resumeOwner.userLoginId}/${resume.resumeHeadImg}"
						width="90px" height="120px">
				</div>
				<div class="col-sm-10">
					<div class="row">
						<span class="right-border">姓名：<strong>${resume.resumeName}</strong></span>
						<span class="right-border">性别：${genders[resume.resumeGender]}</span>
						<span>民族：${resume.resumeNation}</span>
					</div>
					<div class="row">
						<span class="right-border">籍贯：${resume.resumePlace}</span> <span>生日：
							<fmt:formatDate value="${resume.resumeBirthday}"
								pattern="yyyy年 MM月 dd日" />
						</span>
					</div>
					<div class="row">
						<span class="right-border">婚姻状况：${MARRIAGE[resume.resumeMarriage]}</span>
						<span class="right-border">身高：${resume.resumeHeight}</span> <span>体重：${resume.resumeWeight}</span>
					</div>
					<div class="row">
						<span class="right-border">毕业院校：${resume.resumeGraduationSchool}</span>
						<span>毕业时间：<fmt:formatDate
								value="${resume.resumeGraduationTime}" pattern="yyyy年 MM月 dd日" /></span>
					</div>
					<div class="row">
						<span class="right-border">学历：${resume.resumeEducation}</span> <span>专业：${resume.resumeMajor}</span>
					</div>
				</div>
			</div>
			<!-- end of simpleInfo -->
			<div class="col-sm-offset-1 col-sm-11 top-space bottom-border">
				<div class="label label-default col-sm-1">联系方式</div>
				<div class=" col-sm-12">
					<span class="right-space-large">电话：${resume.resumePhone}</span> <span>QQ：${resume.resumeQQ}</span>
				</div>
			</div>
			<!-- end of communication Info -->
			<div class="col-sm-offset-1 col-sm-11 top-space-small bottom-border">
				<div class="label label-default col-sm-1">技能信息</div>
				<div class=" col-sm-12">
					<span class="right-space-large">外语类型：${resume.resumeFLType}</span>
					<span>外语水平：${resume.resumeFLAbility}</span>
					<div>计算机水平：${resume.resumeComputerAbility}</div>
				</div>
			</div>
			<!-- end of communication Info -->
			<div class="col-sm-offset-1 col-sm-11 top-space-small bottom-border">
				<div class="label label-default col-sm-1">综合信息</div>
				<div class=" col-sm-12">
					<div>特点描述：${resume.resumePersonality}</div>
					<div>自我评价：${resume.resumeSelfEvaluation}</div>
				</div>
			</div>
			<!-- end of total Info -->
			<div class="col-sm-12 top-space">
				<c:if test="${works==null}">
					<jsp:forward page="/admin/work/?resumeId=${resume.id}" />
				</c:if>
			</div>
			<div class="col-sm-12">
				<div class="label label-default col-sm-1 col-sm-offset-1">
					工作经历</div>
				<c:forEach items="${works}" var="work" varStatus="status">
					<div class=" col-sm-11 col-sm-offset-1">
						<span class="right-space-large"><strong>${work.workFirmName}</strong></span>
						<span> <fmt:formatDate value="${work.workBeginTime}"
								pattern="yyyy年  MM月 dd日" />
						</span>-- <span class="right-space-large"> <fmt:formatDate
								value="${work.workEndTime}" pattern="yyyy年  MM月 dd日" />
						</span> <span><strong>${work.workUnit}</strong></span>
						<div class="bottom-border">工作内容：${work.workDescription}</div>
					</div>
				</c:forEach>
			</div>
			<!-- end of work -->

			<c:if test="${projects==null}">
				<jsp:forward page="/admin/project/?resumeId=${resume.id}" />
			</c:if>

			<div class="col-sm-12 top-space">
				<div class="label label-default col-sm-1 col-sm-offset-1">
					项目经验</div>
				<c:forEach items="${projects}" var="project" varStatus="status">
					<div class=" col-sm-11 col-sm-offset-1">
						<span class="right-space-large"><strong>${project.projectName}</strong></span>
						<span> <fmt:formatDate value="${project.projectBeginTime}"
								pattern="yyyy年  MM月 dd日" />
						</span>-- <span> <fmt:formatDate value="${project.projectEndTime}"
								pattern="yyyy年  MM月 dd日" />
						</span>
						<div>
							项目岗位：<strong>${project.projectJob}</strong>
						</div>
						<div class="bottom-border">项目描述：${project.projectDescription}</div>
					</div>
				</c:forEach>
			</div>
			<!-- end of project -->
			<c:if test="${edus==null}">
				<jsp:forward page="/admin/edu/?resumeId=${resume.id}" />
			</c:if>
			<div class="col-sm-12 top-space">
				<div class="label label-default col-sm-1 col-sm-offset-1">
					培训经历</div>
				<c:forEach items="${edus}" var="edu" varStatus="status">
					<div class=" col-sm-11 col-sm-offset-1">
						<span class="right-space-large"><strong>${edu.educationSchool}</strong></span>
						<span><fmt:formatDate value="${edu.educationBeginTime}"
								pattern="yyyy年  MM月 dd日" /> </span>-- <span><fmt:formatDate
								value="${edu.educationEndTime}" pattern="yyyy年  MM月 dd日" /> </span>
						<div class="bottom-border">培训内容：${edu.educationContent}</div>
					</div>
				</c:forEach>
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
