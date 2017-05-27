<%@ page language="java" import="ynjh.common.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="MARRY" value="${CommonStatus.MARRY }"></c:set>
<style type="text/css">
.test {
	outline: 1px solid #E5E5E5;
	margin-bottom: 5px;
}

.personal_resume_defualt {
	padding: 15px;
	background-color: #FFFFFF;
}

.personal_resume_margin {
	margin: 20px;
}

.personal_resume_padding {
	padding: 20px;
}

#personal_border:hover {
	outline: 1px solid #fa941b;
}

.glyphicon {
	font-size: 16px;
	margin: 5px;
}

#personal_hidden_photo {
	visibility: hidden;
	font-size: 20px;
}

a:hover {
	text-decoration: none;
}

a:focus {
	text-decoration: none;
}

.updateHeadImg {
	margin-left: 35px;
	margin-top: 35px;
}

.table {
	width: 93%;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#personal_border').mousemove(function() {
			$("#personal_hidden_photo").css("visibility", "visible");
			$("#imgHiddenText").css("visibility", "visible");
		});
		$("#personal_border").mouseleave(function() {
			$("#personal_hidden_photo").css("visibility", "hidden");
			$("#imgHiddenText").css("visibility", "hidden");
		});
	});
</script>
<div class="panel panel-default">
	<div id="personal_border">
		<div class="media">
			<!-- 头像 -->
			<div class="resumeheadImg">
				<c:if test="${resume.resumeHeadImg==null }">
					<img class="pull-left updateHeadImg media-object "
						src="personal/img/head.gif" alt='我的头像' width="100" height="120" />

				</c:if>
				<c:if test="${resume.resumeHeadImg!=null }">
					<img class="pull-left updateHeadImg media-object "
						src="img/upload/personal/${user.userLoginId }/${resume.resumeHeadImg}"
						alt='我的头像' width="100" height="120" />
				</c:if>
			</div>
			<!-- 头像结束 -->
			<!-- 简历基本信息 -->
			<div class="media-body"
				style="padding-top: 35px; padding-left: 35px;">
				<!-- 修改图标开始 -->
				<a class="col-md-offset-10"
					href="javascript:ajaxPageById('personal/resume/personal_updateresume_index',${resume.id})"><span
					class="glyphicon glyphicon-edit" id="personal_hidden_photo"></span></a>
				<!-- 修改图标结束 -->
				<h4 class="media-heading"
					style="line-height: 35px; height: 35px; font-size: 20px;">
					<label class="control-label">${resume.resumeName }</label>
				</h4>
				<!-- 年龄和工作年限需要计算 -->
				<p class="static">${resume.resumeNowResidence }&nbsp;|&nbsp;<label>${resume.works }</label>年&nbsp;|&nbsp;${SEX[resume.resumeGender]}&nbsp;|&nbsp;<label>${resume.age}</label>岁(
					<fmt:formatDate value="${resume.resumeBirthday }"
						pattern="yyyy/MM/dd" />
					)&nbsp;|&nbsp;${resume.resumeJor }
				</p>
				<label class="control-label"><span
					class="glyphicon glyphicon-envelope"></span>${resume.resumeEmail }&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="glyphicon glyphicon-earphone"></span>${resume.resumePhone }</label>
			</div>
			<!-- 简历基本信息结束 -->
		</div>
		<div class="panel-group">
			<!-- 展开内容 -->
			<div class="panel-heading">
				<a class="panel-title col-md-offset-10" data-toggle="collapse"
					data-parent="#panel" href="#panel-element-more">更多展开 <span
					class="glyphicon glyphicon-chevron-down"></span></a>
			</div>
			<div id="panel-element-more" class="panel-collapse collapse">
				<div class="panel-body personal_resume_margin">
					<div class="panel-body col-md-12 test personal_resume_defualt">
						<c:if test="${resume.resumePlace!=null }">
							<div class="col-md-6 column">
								<label class="control-label">籍贯：</label> <label
									class="control-label">${resume.resumePlace }</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeMarriage!=null}">
							<div class="col-md-6 column">
								<label class="control-label">婚姻状况：${MARRY[resume.resumeMarriage]}</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeJor!=null}">
							<div class="col-md-6 column">
								<label class="control-label">求职意向：</label> <label
									class="control-label">${resume.resumeJor}</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeWages!=null}">
							<div class="col-md-6 column">
								<label class="control-label">期待薪资：</label> <label
									class="control-label">${resume.resumeWages}</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeQQ!=null}">
							<div class="col-md-6 column">
								<label class="control-label">QQ或微信：</label> <label
									class="control-label">${resume.resumeQQ}</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeNation!=null}">
							<div class="col-md-6 column">
								<label class="control-label">民族：</label> <label
									class="control-label">${resume.resumeNation}</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeGraduationSchool!=null}">
							<div class="col-md-6 column">
								<label class="control-label">毕业院校：${resume.resumeGraduationSchool}</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeGraduationTime!=null}">
							<div class="col-md-6 column">
								<label class="control-label">毕业时间：</label><label
									class="control-label"><fmt:formatDate
										value="${resume.resumeGraduationTime}" pattern="yyyy/MM/dd" />
								</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeEducation!=null }">
							<div class="col-md-6 column">
								<label class="control-label">学历：</label><label
									class="control-label">${resume.resumeEducation } </label>
							</div>
						</c:if>
						<c:if test="${resume.resumeMajor!=null }">
							<div class="col-md-6 column">
								<label class="control-label">专业：</label><label
									class="control-label">${resume.resumeMajor } </label>
							</div>
						</c:if>
						<c:if test="${resume.resumeFLAbility!=null }">
							<div class="col-md-6 column">
								<label class="control-label">外语水平：</label><label
									class="control-label"> <c:if
										test="${resume.resumeFLAbility==1 }">入门
									</c:if> <c:if test="${resume.resumeFLAbility==2 }">一般
									</c:if> <c:if test="${resume.resumeFLAbility==3 }">熟练
									</c:if> <c:if test="${resume.resumeFLAbility==4 }">精通
									</c:if>
								</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeFLType!=null }">
							<div class="col-md-6 column">
								<label class="control-label">外语类型：</label><label
									class="control-label"> <c:if
										test="${resume.resumeFLType==1 }">英语
									</c:if> <c:if test="${resume.resumeFLType==2 }">日语
									</c:if> <c:if test="${resume.resumeFLType==3 }">德语
									</c:if> <c:if test="${resume.resumeFLType==4 }">法语
									</c:if> <c:if test="${resume.resumeFLType==5 }">俄语
									</c:if> <c:if test="${resume.resumeFLType==6 }">西班牙语
									</c:if> <c:if test="${resume.resumeFLType==7 }">丹麦语
									</c:if>
								</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeEnglishGrade!=null }">
							<div class="col-md-6 column">
								<label class="control-label">英语等级：</label><label
									class="control-label"> <c:if
										test="${resume.resumeEnglishGrade==1 }">国家英语考试3级
									</c:if> <c:if test="${resume.resumeEnglishGrade==2 }">国家英语考试4级
									</c:if> <c:if test="${resume.resumeEnglishGrade==3 }">国家英语考试6级
									</c:if> <c:if test="${resume.resumeEnglishGrade==4 }">专业4级
									</c:if> <c:if test="${resume.resumeEnglishGrade==5 }">专业8级
									</c:if> <c:if test="${resume.resumeEnglishGrade==6 }">未参加
									</c:if> <c:if test="${resume.resumeEnglishGrade==7 }">未通过
									</c:if>
								</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeComputerAbility!=null }">
							<div class="col-md-6 column">
								<label class="control-label">计算机水平：</label><label
									class="control-label"> <c:if
										test="${resume.resumeComputerAbility==1 }">入门
									</c:if> <c:if test="${resume.resumeComputerAbility==2 }">一般
									</c:if> <c:if test="${resume.resumeComputerAbility==3 }">熟练
									</c:if> <c:if test="${resume.resumeComputerAbility==4 }">精通
									</c:if>
								</label>
							</div>
						</c:if>
						<c:if test="${resume.resumeHeight!=null }">
							<div class="col-md-6 column">
								<label class="control-label">身高：</label> <label
									class="control-label">${resume.resumeHeight }</label>(cm)
							</div>
						</c:if>
						<c:if test="${resume.resumeWeight!=null }">
							<div class="col-md-6 column">
								<label class="control-label">体重：</label> <label
									class="control-label">${resume.resumeWeight }</label>(公斤)
							</div>
						</c:if>
						<c:if test="${resume.resumeSelfEvaluation!=null }">
							<div class="col-md-12 column">
								<label class="control-label">自我评价：${resume.resumeSelfEvaluation }</label>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<!-- 展开内容结束 -->
		</div>
	</div>
	<!--
		作者：18213026337@163.com
		时间：2017-05-15
		描述：工作经验 
	-->
	<div class="panel-group" id="panel-work-main">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-list-alt"></span>工作经验 <a
					class="panel-title col-md-offset-8	" data-toggle="collapse"
					data-parent="#panel-work-main" href="#panel-element-work"
					id="hiddenWork"><span class="glyphicon glyphicon-plus"></span>新增工作</a>
			</div>
			<!--mian+-->
			<div id="panel-element-work" class="panel-collapse collapse">
				<div class="panel-body personal_resume_padding">
					<div class="panel-body col-md-12">
						<form action="personal/resume/CreateWork" class="form-horizontal"
							method="post" id="workForm">
							<input type="hidden" name="resumeId" value="${resume.id }" /><br />
							<div class="modal-body">
								<div class="form-group">
									<label for="workFirmName" class="col-md-3 control-label">企业名称：</label>
									<div class="col-md-8">
										<input class="form-control" name="workFirmName"
											id="workFirmName" />
									</div>
								</div>
								<div class="form-group">
									<label for="workUnit" class="col-md-3 control-label">工作岗位：</label>
									<div class="col-md-8">
										<input class="form-control" name="workUnit" id="workUnit" />
									</div>
								</div>
								<div class="form-group">
									<label for="workDescription" class="col-md-3 control-label">工作描述：</label>
									<div class="col-md-8">
										<input class="form-control" name="workDescription"
											id="workDescription" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">日期：</label>
									<div class="col-md-4">
										<input class="form-control" name="workBeginTime" size="30"
											type="text" id="datetimeStart1" readonly
											class="form_datetime" placeholder="选择起始日期">
									</div>
									<div class="col-md-4">
										<input class="form-control" name="workEndTime" size="30"
											type="text" id="datetimeEnd1" readonly class="form_datetime"
											placeholder="选择结束日期">
									</div>
								</div>
							</div>
							<div class="col-md-offset-5">
								<button type="submit" class="btn btn-success">保存</button>
								<a class="btn btn-default" data-toggle="collapse"
									data-parent="#panel-work-main" href="#panel-element-work-show"
									id="showWork">关闭</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--mian-->
		</div>
		<!--2+-->
		<div class="panel panel-default">
			<c:if test="${works!=null }">
				<c:forEach items="${works }" var="work">
					<div class="panel-body test personal_resume_defualt">
						<div class="col-md-12 column">
							<label class="control-label">企业名称：</label>${work.workFirmName }
						</div>
						<div class="col-md-12 column">
							<label class="control-label">工作岗位：</label>${work.workUnit }
						</div>
						<div class="col-md-12 column">
							<label class="control-label">工作描述：</label>${work.workDescription }
						</div>
						<div class="col-md-12 column">
							<label class="control-label">工作时间：</label>
							<fmt:formatDate value="${work.workBeginTime }"
								pattern="yyyy-MM-dd" />
							到
							<fmt:formatDate value="${work.workEndTime }" pattern="yyyy-MM-dd" />
						</div>
						<div class="col-md-12 col-md-offset-10 column">
							<a href="#"><span class="glyphicon glyphicon-cog"></span></a>|<a
								href="personal/resume/deleteResumeWork?id=${work.id}"><span
								class="glyphicon glyphicon-trash"></span></a>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<div id="panel-element-work-show" class="panel-collapse in">
				<c:if test="${works==null }">
					<div class="panel-body col-md-offset-3 personal_resume_padding">
						<span class="glyphicon glyphicon-list-alt"></span>
						完善工作经验，展现工作内容及能力，让HR更了解你！
					</div>
				</c:if>
			</div>
		</div>
		<!--2-->
	</div>
	<!--
		作者：18213026337@163.com
		时间：2017-05-15
		描述：项目经验 
                        -->
	<div class="panel-group" id="panel-project-main">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-signal"></span>项目经验 <a
					class="panel-title col-md-offset-8" data-toggle="collapse"
					data-parent="#panel-project-main" href="#panel-element-project"
					id="hiddenProject"><span class="glyphicon glyphicon-plus"></span>新增项目</a>
			</div>
			<!--mian+-->
			<div id="panel-element-project" class="panel-collapse collapse">
				<div class="panel-body personal_resume_padding">
					<div class="panel-body col-md-12">
						<form action="personal/resume/CreateProject"
							class="form-horizontal" method="post" id="projectForm">
							<input type="hidden" name="resumeId" value="${resume.id }" /><br />
							<div class="modal-body">
								<div class="form-group">
									<label for="projectName" class="col-md-3 control-label">项目名称：</label>
									<div class="col-md-8">
										<input class="form-control" name="projectName"
											id="projectName" />
									</div>
								</div>
								<div class="form-group">
									<label for="projectJob" class="col-md-3 control-label">项目岗位：</label>
									<div class="col-md-8">
										<input class="form-control" name="projectJob" id="projectJob" />
									</div>
								</div>
								<div class="form-group">
									<label for="projectDescription" class="col-md-3 control-label">项目描述：</label>
									<div class="col-md-8">
										<textarea class="form-control" name="projectDescription"
											id="projectDescription" /></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">日期：</label>
									<div class="col-md-4">
										<input class="form-control" name="projectBeginTime" size="30"
											type="text" id="datetimeStart2" readonly
											class="form_datetime" placeholder="选择起始日期" />
									</div>
									<div class="col-md-4">
										<input class="form-control" name="projectEndTime" size="30"
											type="text" id="datetimeEnd2" readonly class="form_datetime"
											placeholder="选择结束日期" />
									</div>
								</div>
							</div>
							<div class="col-md-offset-5">
								<button type="submit" class="btn btn-success">保存</button>
								<a class="btn btn-default" data-toggle="collapse"
									data-parent="#panel-project-main"
									href="#panel-element-project-show" id="showProject">关闭</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--mian-->
		</div>
		<!--2+-->

		<div class="panel panel-default">
			<c:if test="${projs!=null }">
				<c:forEach items="${projs }" var="pro">
					<div class="panel-body test personal_resume_defualt">
						<div class="col-md-12 column">
							<label class="control-label">项目名称：</label>${pro.projectName }
						</div>
						<div class="col-md-12 column">
							<label class="control-label">项目岗位：</label>${pro.projectJob }
						</div>
						<div class="col-md-12 column">
							<label class="control-label">项目描述：</label>${pro.projectDescription }
						</div>
						<div class="col-md-12 column">
							<label class="control-label">项目时间：</label>
							<fmt:formatDate value="${pro.projectBeginTime }"
								pattern="yyyy-MM-dd" />
							到
							<fmt:formatDate value="${pro.projectEndTime }"
								pattern="yyyy-MM-dd" />
						</div>
						<div class="col-md-12 col-md-offset-10 column">
							<a href="#"><span class="glyphicon glyphicon-cog"></span></a>|<a
								href="personal/resume/deleteResumeProject?id=${pro.id }"><span
								class="glyphicon glyphicon-trash"></span></a>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<div id="panel-element-project-show" class="panel-collapse in">
				<c:if test="${projs==null }">
					<div class="panel-body col-md-offset-3 personal_resume_padding">
						<span class="glyphicon glyphicon-signal"></span>
						完善项目经验，展现社会工作能力，让HR更了解你！
					</div>
				</c:if>
			</div>
		</div>
		<!--2-->
	</div>
	<!--
		作者：18213026337@163.com
		时间：2017-05-15
		描述：教育经历
	 -->
	<div class="panel-group" id="panel-education-main">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-book"></span>教育经历 <a
					class="panel-title col-md-offset-8" data-toggle="collapse"
					data-parent="#panel-education-main" href="#panel-element-education"
					id="hiddenEducation"><span class="glyphicon glyphicon-plus"></span>新增教育</a>
			</div>
			<!--mian+-->
			<div id="panel-element-education" class="panel-collapse collapse">
				<div class="panel-body personal_resume_padding">
					<div class="panel-body col-md-12">
						<form class="form-horizontal" method="post"
							action="personal/resume/CreateEducation" id="educationForm">
							<input type="hidden" name="resumeId" value="${resume.id }" /><br />
							<div class="modal-body">
								<div class="form-group">
									<label for="educationSchool" class="col-md-3 control-label">学校名称：</label>
									<div class="col-md-8">
										<input class="form-control" name="educationSchool"
											id="educationSchool" />
									</div>
								</div>
								<br />
								<div class="form-group">
									<label for="educationContent" class="col-md-3 control-label">专业：</label>
									<div class="col-md-8">
										<input class="form-control" name="educationContent"
											id="educationContent" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">日期：</label>
									<div class="col-md-4">
										<input class="form-control" name="educationBeginTime"
											size="30" type="text" id="datetimeStart" readonly
											class="form_datetime" placeholder="选择起始日期">
									</div>
									<div class="col-md-4">
										<input class="form-control" name="educationEndTime" size="30"
											type="text" id="datetimeEnd" readonly class="form_datetime"
											placeholder="选择结束日期">
									</div>
								</div>
							</div>
							<div class="col-md-offset-5">
								<button type="submit" class="btn btn-success">保存</button>
								<a class="btn btn-default" data-toggle="collapse"
									data-parent="#panel-education-main"
									href="#panel-element-education-show" id="showEducation">关闭</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--mian-->
		</div>
		<!--2+-->
		<div class="panel panel-default">
			<c:if test="${edus!=null }">
				<c:forEach items="${edus }" var="edu">
					<div class="panel-body test personal_resume_defualt">
						<div class="col-md-12 column">
							<label class="control-label">学校名称：</label>${edu.educationSchool}
						</div>
						<div class="col-md-12 column">
							<label class="control-label">教育描述：</label>${edu.educationContent}
						</div>
						<div class="col-md-12 column">
							<label class="control-label">教育时间：</label>
							<fmt:formatDate value="${edu.educationBeginTime}"
								pattern="yyyy-MM-dd" />
							到
							<fmt:formatDate value="${edu.educationEndTime}"
								pattern="yyyy-MM-dd" />
						</div>
						<div class="col-md-12 col-md-offset-10 column">
							<a href="#"><span class="glyphicon glyphicon-cog"></span></a>|<a
								href="personal/resume/deleteResumeEducation?id=${edu.id }"><span
								class="glyphicon glyphicon-trash"></span></a>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<div id="panel-element-education-show" class="panel-collapse in">
				<c:if test="${edus==null }">
					<div class="panel-body col-md-offset-3 personal_resume_padding">
						<span class="glyphicon glyphicon-book"></span>
						完善教育经历，展现专业能力，让HR更了解你！
					</div>
				</c:if>
			</div>
		</div>
		<!--2-->
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		//工作
		$("#hiddenWork").click(function() {
			$("#hiddenWork").hide();
		});
		$("#showWork").click(function() {
			$("#hiddenWork").show();
		});
		//项目
		$("#hiddenProject").click(function() {
			$("#hiddenProject").hide();
		});
		$("#showProject").click(function() {
			$("#hiddenProject").show();
		});
		//教育
		$("#hiddenEducation").click(function() {
			$("#hiddenEducation").hide();
		});
		$("#showEducation").click(function() {
			$("#hiddenEducation").show();
		});
	});
	$(function() {
		$("#datetimeStart").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#datetimeStart").datetimepicker("setEndDate",
							$("#datetimeEnd").val())
				});

		$("#datetimeEnd").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#datetimeEnd").datetimepicker("setStartDate",
							$("#datetimeStart").val())
				});

		$("#datetimeStart1").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#datetimeStart1").datetimepicker("setEndDate",
							$("#datetimeEnd1").val())
				});

		$("#datetimeEnd1").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#datetimeEnd1").datetimepicker("setStartDate",
							$("#datetimeStart1").val())
				});

		$("#datetimeStart2").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#datetimeStart2").datetimepicker("setEndDate",
							$("#datetimeEnd2").val())
				});

		$("#datetimeEnd2").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#datetimeEnd2").datetimepicker("setStartDate",
							$("#datetimeStart2").val())
				});
	});

	$(function() {
		$("#educationForm").bootstrapValidator({
			message : '这个值不能通过验证！！',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				educationSchool : {
					validators : {
						notEmpty : {
							message : '学校名称不能为空'
						},
						stringLength : {
							min : 2,
							max : 50,
							message : '学校名称必须在2到50位之间'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/g),
							message : "请输入中文名字"
						}

					}
				},
				educationContent : {
					validators : {
						notEmpty : {
							message : '专业不能为空'
						},
						stringLength : {
							min : 2,
							max : 50,
							message : '专业必须在2到50位之间'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/g),
							message : "请输入中文名字"
						}

					}
				},
				educationBeginTime : {
					validators : {
						notEmpty : {
							message : '日期不能为空'
						}
					}
				},
				educationEndTime : {
					validators : {
						notEmpty : {
							message : '日期不能为空'
						}
					}
				}
			}
		});

		$("#workForm").bootstrapValidator({
			message : '这个值不能通过验证！！',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {

				workFirmName : {
					validators : {
						notEmpty : {
							message : '企业名称不能为空'
						},
						stringLength : {
							min : 1,
							max : 50,
							message : '企业名称必须在1到50位之间'
						}
					}
				},
				workUnit : {
					validators : {
						notEmpty : {
							message : '工作岗位不能为空'
						},
						stringLength : {
							min : 2,
							max : 50,
							message : '工作岗位必须在2到50位之间'
						}
					}
				},
				workDescription : {
					validators : {
						notEmpty : {
							message : '工作描述不能为空'
						},
						stringLength : {
							min : 10,
							max : 500,
							message : '工作描述必须在10到500位之间'
						}
					}
				},
				workBeginTime : {
					validators : {
						notEmpty : {
							message : '日期不能为空'
						}
					}
				},
				workEndTime : {
					validators : {
						notEmpty : {
							message : '日期不能为空'
						}
					}
				},

			}
		});

		$("#projectForm").bootstrapValidator({
			message : '这个值不能通过验证！！',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				projectName : {
					validators : {
						notEmpty : {
							message : '项目名称不能为空'
						},
						stringLength : {
							min : 2,
							max : 100,
							message : '项目名称必须在2到100位之间'
						}
					}
				},
				projectJob : {
					validators : {
						notEmpty : {
							message : '项目岗位不能为空'
						},
						stringLength : {
							min : 2,
							max : 100,
							message : '项目岗位必须在2到100位之间'
						}
					}
				},
				projectDescription : {
					validators : {
						notEmpty : {
							message : '项目描述不能为空'
						},
						stringLength : {
							min : 10,
							max : 500,
							message : '项目描述必须在10到500位之间'
						}
					}
				},
				projectBeginTime : {
					validators : {
						notEmpty : {
							message : '日期不能为空'
						}
					}
				},
				projectEndTime : {
					validators : {
						notEmpty : {
							message : '日期不能为空'
						}
					}
				}
			}
		});
	});
	var ajaxPageById = function(page, id) {
		$.ajax({
			url : "personal/resume/updateResumeById",
			data : "page=" + page + "&resumeId=" + id,
			type : "POST",
			dataType : "html",
			success : function(data) {
				$("#my-content").html(data);
			}
		});
	}
</script>