<%@ page language="java" import="ynjh.common.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<base href="<%=basePath %>" />
<%@include file="/WEB-INF/pages/company/header.jsp" %>
<%@include file="/WEB-INF/pages/company/footer.jsp" %>
<%@include file="/WEB-INF/pages/nav.jsp" %>
<style type="text/css">
.test{
	outline: 1px solid #E5E5E5;
}
.personal_resume_defualt{
	padding:15px;
	background-color: #F8F8FF;
}
.personal_resume_margin{
	margin: 20px;
}

#personal_border:hover {
	outline: 1px solid #fa941b;
}

.glyphicon {
	font-size: 16px;
	margin: 5px;
}

#hidden_photo {
	visibility: hidden;
	font-size: 20px;
}

a:hover {
	text-decoration: none;
}

a:focus {
	text-decoration: none;
}
.updateHeadImg{
	margin-left: 35px; margin-top: 35px;
}
</style>
<div class="panel panel-default">
	<div id="personal_border">
	<c:forEach items="${companyResumes }" var="cmprs">
		<div class="media">
			<!-- 头像 -->
			<div class="resumeheadImg">
				<img class="pull-left updateHeadImg" src="personal/img/head.gif"
					class="media-object" alt='我的头像' width="100" height="120" />
				<img class="pull-left updateHeadImg" src="img/upload/personal/${company.userLoginId }/${cmprs.resumeHeadImg}"
					class="media-object" alt='我的头像' width="100" height="120" />
			</div>
			<div class="media-body"
				style="padding-top: 35px; padding-left: 35px;">
				<a class="col-lg-offset-10"
					href="personal/resume/updateResume?resumeId=${cmprs.id }"><span
					class="glyphicon glyphicon-edit" id="hidden_photo"></span></a>
				<h4 class="media-heading"
					style="line-height: 35px; height: 35px; font-size: 20px;">
					<label class="control-label">${cmprs.resumeName }</label>
				</h4>
				<!-- 年龄和工作年限需要计算 -->
				<p class="static">${SEX[cmprs.resumeGender]}<fmt:formatDate
						value="${cmprs.resumeBirthday }" pattern="yyyy/MM/dd" />&nbsp;&nbsp;${cmprs.resumeJor }
				</p>
				<label class="control-label"><span
					class="glyphicon glyphicon-envelope"></span>${cmprs.resumeEmail }&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="glyphicon glyphicon-earphone"></span>${cmprs.resumePhone }</label>
			</div>
			<!-- 简历基本信息结束 -->
		</div>
		<div class="panel-group">
			<div class="panel-heading">
				<a class="panel-title col-md-offset-9" data-toggle="collapse"
					data-parent="#panel" href="#panel-element-more">更多展开 <span
					class="glyphicon glyphicon-chevron-down in"></span></a>
			</div>
			<div id="panel-element-more" class="panel-collapse collapse in">
				<div class="panel-body personal_resume_margin ">
					<div class="panel-body col-md-12 test personal_resume_defualt">
							<div class="col-md-6 column">
								<label class="control-label">籍贯：</label> <label
									class="control-label">${cmprs.resumePlace }</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">婚姻状况：</label> <label
									class="control-label">
									<c:if test="${cmprs.resumeMarriage==0 }">已婚
									</c:if>
									<c:if test="${cmprs.resumeMarriage==1 }">未婚
									</c:if>
									</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">求职意向：</label> <label
									class="control-label">${cmprs.resumeJor }</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">期待薪资：</label> <label
									class="control-label">${cmprs.resumeWages }</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">QQ或微信：</label> <label
									class="control-label">${cmprs.resumeQQ }</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">民族：</label> <label
									class="control-label">${cmprs.resumeNation }</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">毕业院校：</label> <label
									class="control-label">${cmprs.resumeGraduationSchool }</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">毕业时间：</label><label
									class="control-label"><fmt:formatDate value="${cmprs.resumeGraduationTime }" pattern="yyyy/MM/dd" />
								</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">学历：</label><label
									class="control-label">${cmprs.resumeEducation }
								</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">专业：</label><label
									class="control-label">${cmprs.resumeMajor }
								</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">外语水平：</label><label
									class="control-label">
									<c:if test="${cmprs.resumeFLAbility==1 }">入门
									</c:if>
									<c:if test="${cmprs.resumeFLAbility==2 }">一般
									</c:if>
									<c:if test="${cmprs.resumeFLAbility==3 }">熟练
									</c:if>
									<c:if test="${cmprs.resumeFLAbility==4 }">精通
									</c:if>
								</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">外语类型：</label><label
									class="control-label">
									<c:if test="${cmprs.resumeFLType==1 }">英语
									</c:if>
									<c:if test="${cmprs.resumeFLType==2 }">日语
									</c:if>
									<c:if test="${cmprs.resumeFLType==3 }">德语
									</c:if>
									<c:if test="${cmprs.resumeFLType==4 }">法语
									</c:if>
									<c:if test="${cmprs.resumeFLType==5 }">俄语
									</c:if>
									<c:if test="${cmprs.resumeFLType==6 }">西班牙语
									</c:if>
									<c:if test="${cmprs.resumeFLType==7 }">丹麦语
									</c:if>
								</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">英语等级：</label><label
									class="control-label">
									<c:if test="${cmprs.resumeEnglishGrade==1 }">国家英语考试3级
									</c:if>
									<c:if test="${cmprs.resumeEnglishGrade==2 }">国家英语考试4级
									</c:if>
									<c:if test="${cmprs.resumeEnglishGrade==3 }">国家英语考试6级
									</c:if>
									<c:if test="${cmprs.resumeEnglishGrade==4 }">专业4级
									</c:if>
									<c:if test="${cmprs.resumeEnglishGrade==5 }">专业8级
									</c:if>
									<c:if test="${cmprs.resumeEnglishGrade==6 }">未参加
									</c:if>
									<c:if test="${cmprs.resumeEnglishGrade==7 }">未通过
									</c:if>
								</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">计算机水平：</label><label
									class="control-label">
									<c:if test="${cmprs.resumeComputerAbility==1 }">入门
									</c:if>
									<c:if test="${cmprs.resumeComputerAbility==2 }">一般
									</c:if>
									<c:if test="${cmprs.resumeComputerAbility==3 }">熟练
									</c:if>
									<c:if test="${cmprs.resumeComputerAbility==4 }">精通
									</c:if>
								</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">身高：</label> <label
									class="control-label">${cmprs.resumeHeight }</label>cm
							</div>
							<c:if test="${cmprs.resumeWeight!=null }">
							<div class="col-md-6 column">
								<label class="control-label">体重：</label> <label
									class="control-label">${cmprs.resumeWeight }</label>(公斤)
							</div>
							</c:if>
							<c:if test="${cmprs.resumeSelfEvaluation!=null }">
							<div class="col-md-12 column">
								<label class="control-label">自我评价：</label> <label
									class="control-label">${cmprs.resumeSelfEvaluation }</label>
							</div>
							</c:if>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
	<div class="panel-group" id="panel-work-main">
		<div class="panel panel-default">
			<c:forEach items="${works }" var="work">
				<table class="table">
					<colgroup>
						<col style="width: 8%">
						<col style="width: 50%">
					</colgroup>
					<tr>
						<td>企业名称：</td>
						<td>${work.workFirmName }</td>
					</tr>
					<tr>
						<td>工作岗位：</td>
						<td>${work.workUnit }</td>
					</tr>
					<tr>
						<td>工作描述：</td>
						<td>${work.workDescription }</td>
					</tr>
					<tr>
						<td>工作时间：</td>
						<td><fmt:formatDate value="${work.workBeginTime }"
								pattern="yyyy-MM-dd" />到<fmt:formatDate
								value="${work.workEndTime }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</div>
	<div class="panel-group" id="panel-project-main">
		<div class="panel panel-default">
			<c:forEach items="${projs }" var="pro">
				<table class="table">
					<colgroup>
						<col style="width: 50%">
						<col style="width: 50%">
					</colgroup>
					<tr>
						<td>项目名称：</td>
						<td>${pro.projectName }</td>
					</tr>
					<tr>
						<td>项目岗位：</td>
						<td>${pro.projectJob }</td>
					</tr>
					<tr>
						<td>项目描述：</td>
						<td>${pro.projectDescription }</td>
					</tr>
					<tr>
						<td>责任描述与感受：</td>
						<td>${pro.projectMakeDescription }</td>
					</tr>
					<tr>
						<td>项目时间：</td>
						<td><fmt:formatDate value="${pro.projectBeginTime }"
								pattern="yyyy-MM-dd" />到<fmt:formatDate
								value="${pro.projectEndTime }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</div>
</div>