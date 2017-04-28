<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div><%@include file="../menu.jsp"%></div>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-1 page-header">
				 <h1>${resume.resumeTitle}<small>${resume.resumeCreateDate}</small></h1>
			</div>
			<div class="col-md-offset-1">
				<div class="col-sm-2">
					<img src="" width="90px" height="120px">
				</div>
				<div class="col-sm-10">
					<div class="col-sm-4">姓名:${resume.resumeName}</div>
					<div class="col-sm-4">性别：${resume.resumeGender}</div>
					<div class="col-sm-4">民族：${resume.resumeNation}</div>
					<div class="col-sm-4">籍贯：${resume.resumePlace}</div>
					<div class="col-sm-4">生日：${resume.resumeBirthday}</div>
					<div class="col-sm-4">婚姻状况：${resume.resumeMarriage}</div>
					<div class="col-sm-4">身高：${resume.resumeHeight}</div>
					<div class="col-sm-4">体重：${resume.resumeWeight}</div>
					<div class="col-sm-4">毕业院校：${resume.resumeGraduationSchool}</div>
					<div class="col-sm-4">毕业时间：${resume.resumeGraduationTime}</div>
					<div class="col-sm-4">学历：${resume.resumeEducation}</div>
					<div class="col-sm-4">专业：${resume.resumeMajor}</div>
				</div>
			</div><!-- end of simpleInfo -->
			<div class="col-md-12">
			&nbsp;
			</div>
			<div class="col-md-12">
				<div class="label label-default col-md-1 col-md-offset-1">联系方式</div>
				<div class=" col-md-12 col-md-offset-1">
					<div class="col-md-6">电话：${resume.resumePhone}</div>
					<div class="col-md-6">QQ：${resume.resumeQQ}</div>
				</div>
			</div><!-- end of communication Info -->
			<div class="col-md-12">
			&nbsp;
			</div>
			<div class="col-md-12">
				<div class="label label-default col-md-1 col-md-offset-1">技能信息</div>
				<div class=" col-md-12 col-md-offset-1">
					<div class="col-md-6">外语类型：${resume.resumeFLType}</div>
					<div class="col-md-6">外语水平：${resume.resumeFLAbility}</div>
					<div class="col-md-6">计算机水平：${resume.resumeComputerAbility}</div>
				</div>
			</div><!-- end of communication Info -->
			<div class="col-md-12">
			&nbsp;
			</div>
			<div class="col-md-12">
				<div class="label label-default col-md-1 col-md-offset-1">综合信息</div>
				<div class=" col-md-12 col-md-offset-1">
					<div class="col-md-12">特点描述：${resume.resumePersonality}</div>
					<div class="col-md-12">自我评价：${resume.resumeSelfEvaluation}</div>
				</div>
			</div><!-- end of total Info -->
		</div>
	</div>

	<div><%@include file="../footer.jsp"%></div>
</body>
</html>
