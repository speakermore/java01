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
<div><%@include file="../header.jsp"%></div>
</head>
<body>
	<!-- 加入显示数组 -->
	<c:set var="genders" value="${CommonStatus.SEX }"></c:set>
	<c:set var="MARRIAGE" value="${CommonStatus.MARRIAGE }"></c:set>
	<div><%@include file="../menu.jsp"%></div>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-1 page-header">
				<h1>${resume.resumeTitle}<small>${resume.resumeCreateDate}</small>
				</h1>
			</div>
			<div class="col-md-offset-1">
				<div class="col-sm-2">
					<img src="" width="90px" height="120px">
				</div>
				<div class="col-sm-10">
					<div class="col-sm-4">姓名:${resume.resumeName}</div>
					<div class="col-sm-4">性别：${genders[resume.resumeGender]}</div>
					<div class="col-sm-4">民族：${resume.resumeNation}</div>
					<div class="col-sm-4">籍贯：${resume.resumePlace}</div>
					<div class="col-sm-4">
						生日：
						<fmt:formatDate value="${resume.resumeBirthday}"
							pattern="yyyy年 MM月 dd日" />
					</div>
					<div class="col-sm-4">婚姻状况：${MARRIAGE[resume.resumeMarriage]}</div>
					<div class="col-sm-4">身高：${resume.resumeHeight}</div>
					<div class="col-sm-4">体重：${resume.resumeWeight}</div>
					<div class="col-sm-4">毕业院校：${resume.resumeGraduationSchool}</div>
					<div class="col-sm-4">
						毕业时间：
						<fmt:formatDate value="${resume.resumeGraduationTime}"
							pattern="yyyy年 MM月 dd日" />
					</div>
					<div class="col-sm-4">学历：${resume.resumeEducation}</div>
					<div class="col-sm-4">专业：${resume.resumeMajor}</div>
				</div>
			</div>
			<!-- end of simpleInfo -->
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<div class="label label-default col-md-1 col-md-offset-1">联系方式</div>
				<div class=" col-md-12 col-md-offset-1">
					<div class="col-md-6">电话：${resume.resumePhone}</div>
					<div class="col-md-6">QQ：${resume.resumeQQ}</div>
				</div>
			</div>
			<!-- end of communication Info -->
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<div class="label label-default col-md-1 col-md-offset-1">技能信息</div>
				<div class=" col-md-12 col-md-offset-1">
					<div class="col-md-6">外语类型：${resume.resumeFLType}</div>
					<div class="col-md-6">外语水平：${resume.resumeFLAbility}</div>
					<div class="col-md-6">计算机水平：${resume.resumeComputerAbility}</div>
				</div>
			</div>
			<!-- end of communication Info -->
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12">
				<div class="label label-default col-md-1 col-md-offset-1">综合信息</div>
				<div class=" col-md-12 col-md-offset-1">
					<div class="col-md-12">特点描述：${resume.resumePersonality}</div>
					<div class="col-md-12">自我评价：${resume.resumeSelfEvaluation}</div>
				</div>
			</div>
			<!-- end of total Info -->
			<div class="col-md-12">
				&nbsp;
				<c:if test="${works==null}">
					<jsp:forward page="/admin/work/?resumeId=${resume.id}" />
				</c:if>
			</div>
			<div class="col-md-12">
				<c:forEach items="${works}" var="work" varStatus="status">
					<div class="label label-default col-md-1 col-md-offset-1">
						工作经历&nbsp;${status.index+1}</div>
					<div class=" col-md-12 col-md-offset-1">
						<div class="col-md-12">工作单位：${work.workFirmName}</div>
						<div class="col-md-6">
							开始时间：
							<fmt:formatDate value="${work.workBeginTime}"
								pattern="yyyy年  MM月 dd日" />
						</div>
						<div class="col-md-6">
							结束时间：
							<fmt:formatDate value="${work.workEndTime}"
								pattern="yyyy年  MM月 dd日" />
						</div>
						<div class="col-md-12">所在岗位：${work.workUnit}</div>
						<div class="col-md-12">工作内容：${work.workDescription}</div>
					</div>
				</c:forEach>
			</div>
			<!-- end of work -->
			<div class="col-md-12">
				&nbsp;
				<c:if test="${projects==null}">
					<jsp:forward page="/admin/project/?resumeId=${resume.id}" />
				</c:if>
			</div>
			<div class="col-md-12">
				<c:forEach items="${projects}" var="project" varStatus="status">
					<div class="label label-default col-md-1 col-md-offset-1">
						项目经验&nbsp;${status.index+1}</div>
					<div class=" col-md-12 col-md-offset-1">
						<div class="col-md-12">项目名称：${project.projectName}</div>
						<div class="col-md-6">
							开始时间：
							<fmt:formatDate value="${project.projectBeginTime}"
								pattern="yyyy年  MM月 dd日" />
						</div>
						<div class="col-md-6">
							结束时间：
							<fmt:formatDate value="${project.projectEndTime}"
								pattern="yyyy年  MM月 dd日" />
						</div>
						<div class="col-md-12">项目岗位：${project.projectJob}</div>
						<div class="col-md-12">项目描述：${project.projectDescription}</div>
					</div>
				</c:forEach>
			</div>
			<!-- end of project -->
			<div class="col-md-12">
				&nbsp;
				<c:if test="${edus==null}">
					<jsp:forward page="/admin/edu/?resumeId=${resume.id}" />
				</c:if>
			</div>
			<div class="col-md-12">
				<c:forEach items="${edus}" var="edu" varStatus="status">
					<div class="label label-default col-md-1 col-md-offset-1">
						培训经历&nbsp;${status.index+1}</div>
					<div class=" col-md-12 col-md-offset-1">
						<div class="col-md-6">
							开始时间：
							<fmt:formatDate value="${edu.educationBeginTime}"
								pattern="yyyy年  MM月 dd日" />
						</div>
						<div class="col-md-6">
							结束时间：
							<fmt:formatDate value="${edu.educationEndTime}"
								pattern="yyyy年  MM月 dd日" />
						</div>
						<div class="col-md-12">培训地点：${edu.educationSchool}</div>
						<div class="col-md-12">培训内容：${edu.educationContent}</div>
					</div>
				</c:forEach>
			</div>
			<!-- end of education -->
			<div class="col-md-12">&nbsp;</div>
			<div class="col-md-12 col-md-offset-1">
				<div class="col-md-6">
					<a href="admin/auditResume/${resume.id}/2" class="btn btn-default">
						<span class="glyphicon glyphicon-ok"
						aria-hidden="true">
						</span>
						通过审核
					</a>
				</div>
				<div class="col-md-6">
					<a href="admin/auditResume/${resume.id}/3" class="btn btn-default">
						<span class="glyphicon glyphicon-remove"
						aria-hidden="true">
						</span>
						不能通过审核
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
