<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

	<head>
		<meta charset="utf-8" />
		<title></title>
<%@include file="/WEB-INF/pages/company/header.jsp" %>
<%@include file="/WEB-INF/pages/company/footer.jsp" %>
<base href="<%=basePath %>" />
	</head>
	<body>
	<article
	class="col-md-12 work-together-margin-left-30 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
		<!--发表状态小节-->
		<section class="panel">
			<table class="table">
			<c:forEach items="${cmprs }" var="cmprs">

				<tr>
					<td colspan="3">
						<h3 class="text-center">${cmprs.resumeTitle }</h3>
					</td>
				</tr>
				<tr>
					<td rowspan="4" class="col-md-1"><a href="#"><img
							src="img/personal/head.gif" width="180" height="180" /></a></td>
				</tr>
				
				<tr>
					<td class="col-md-4">${cmprs.resumeName }</td>
					<td>${cmprs.resumeGender }</td>
				</tr>
				<tr>
					<td>${cmprs.resumeJor }</td>
					<td>${cmprs.resumeWages }</td>
				</tr>
			</table>
			<div class="panel-group" id="panel">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-one">基本内容</a>
					</div>
					<div id="panel-element-one" class="panel-collapse collapse in">
						<div class="panel-body">
							<table class="table">
								<colgroup>
									<col style="width: 50%">
									<col style="width: 50%">
								</colgroup>
								<tr>
									<td>籍贯：</td>
									<td>${cmprs.resumePlace }</td>
								</tr>
								<tr>
									<td>民族：</td>
									<td>${cmprs.resumeNation }</td>
								</tr>
								<tr>
									<td>生日：</td>
									<td>${cmprs.resumeBirthday }</td>
								</tr>
								<tr>
									<td>电话：</td>
									<td>${cmprs.resumePhone }</td>
								</tr>
								<tr>
									<td>QQ:</td>
									<td>${cmprs.resumeQQ }</td>
								</tr>
								<tr>
									<td>婚姻：</td>
									<td>${cmprs.resumeMarriage }</td>
								</tr>
								<tr>
									<td>毕业学校：</td>
									<td>${cmprs.resumeGraduationSchool }</td>
								</tr>
								<tr>
									<td>毕业时间：</td>
									<td>${cmprs.resumeGraduationTime }</td>
								</tr>
								<tr>
									<td>学历：</td>
									<td>${cmprs.resumeEducation }</td>
								</tr>
								<tr>
									<td>专业：</td>
									<td>${cmprs.resumeMajor }</td>
								</tr>
								<tr>
									<td>英语等级：</td>
									<td>${cmprs.resumeEnglishGrade }</td>
								</tr>
								<tr>
									<td>外语类型：</td>
									<td>${cmprs.resumeFLType }</td>
								</tr>
								<tr>
									<td>外语水平：</td>
									<td>${cmprs.resumeFLAbility }</td>
								</tr>
								<tr>
									<td>计算机水平：</td>
									<td>${cmprs.resumeComputerAbility }</td>
								</tr>
								<tr>
									<td>身高：</td>
									<td>${cmprs.resumeHeight }</td>
								</tr>
								<tr>
									<td>体重：</td>
									<td>${cmprs.resumeWeight }</td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				</div>
			</c:forEach>
		</section>
		</article>
	</body>
</html>
