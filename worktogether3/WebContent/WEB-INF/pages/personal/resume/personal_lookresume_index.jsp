<%@ page language="java" import="ynjh.common.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
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
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#personal_border').mousemove(function() {
			$("#hidden_photo").css("visibility", "visible");
		});
		$("#personal_border").mouseleave(function() {
			$("#hidden_photo").css("visibility", "hidden");
		});
	});
</script>
<div class="panel panel-default">
	<div id="personal_border">
		<div class="media">
			<c:if test="${resume.resumeHeadImg==null }">
				<a href="#" style="margin-left: 35px; margin-top: 35px;"
					class="pull-left"><img src="personal/img/head.gif"
					class="media-object" alt='我的头像' width="100" height="120" /></a>
			</c:if>
			<c:if test="${resume.resumeHeadImg!=null }">
				<a href="#" style="margin-left: 35px; margin-top: 35px;"
					class="pull-left"><img
					src="img/upload/personal/${user.userLoginId }/${resume.resumeHeadImg}"
					class="media-object" alt='我的头像' width="100" height="120" /></a>
			</c:if>
			<div class="media-body"
				style="padding-top: 35px; padding-left: 35px;">
				<a class="col-lg-offset-11"
					href="personal/resume/updateResume?resumeId=${resume.id }"><span
					class="glyphicon glyphicon-edit" id="hidden_photo"></span></a>
				<h4 class="media-heading"
					style="line-height: 35px; height: 35px; font-size: 20px;">
					<label class="control-label">${resume.resumeName }</label>
				</h4>
				<!-- 年龄和工作年限需要计算 -->
				<p class="static">${resume.resumeNowResidence }&nbsp;|&nbsp;${resume.resumeWorks }&nbsp;|&nbsp;${SEX[resume.resumeGender]}&nbsp;|&nbsp;岁数(<fmt:formatDate
						value="${resume.resumeBirthday }" pattern="yyyy/MM/dd" />
					)&nbsp;|&nbsp;${resume.resumeJor }
				</p>
				<label class="control-label"><span
					class="glyphicon glyphicon-envelope"></span> ${resume.resumeEmail }
					<span class="glyphicon glyphicon-earphone"></span>
					${resume.resumePhone }</label>
			</div>
		</div>
		<div class="panel-group">
			<div class="panel-heading">
				<a class="panel-title col-md-offset-10" data-toggle="collapse"
					data-parent="#panel" href="#panel-element-more">更多展开 <span
					class="glyphicon glyphicon-chevron-down"></span></a>
			</div>
			<div id="panel-element-more" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="panel-body col-md-12">
						<div class="col-md-offset-3">
							<div class="col-md-6 column">
								<label class="control-label">籍贯：</label> <label
									class="control-label">${resume.resumePlace }</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">婚姻状况：</label> <label
									class="control-label">${MARRY[resume.resumeMarriage] }</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">求职意向：</label> <label
									class="control-label">${resume.resumeJor }</label>
							</div>
							<div class="col-md-6 column">
								<label class="control-label">期待薪资：</label> <label
									class="control-label">${resume.resumeWages }</label>
							</div>
							<%-- <c:if test="">
								
							</c:if> --%>
						</div>
					</div>
				</div>
			</div>
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
				<span class="glyphicon glyphicon-list-alt"></span> 工作经验 <a
					class="panel-title col-md-offset-9" data-toggle="collapse"
					data-parent="#panel-work-main" href="#panel-element-work"><span
					class="glyphicon glyphicon-plus"></span> 新增工作</a>
			</div>
			<!--mian+-->
			<div id="panel-element-work" class="panel-collapse collapse">
				<div class="panel-body">
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
											class="form_datetime" placeholder="请选择起始日期">
									</div>
									<div class="col-md-4">
										<input class="form-control" name="workEndTime" size="30"
											type="text" id="datetimeEnd1" readonly class="form_datetime"
											placeholder="请选择结束日期">
									</div>
								</div>
							</div>
							<div class="col-md-offset-5">
								<button type="submit" class="btn btn-success">保存</button>
								<a class="btn btn-default" data-toggle="collapse"
									data-parent="#panel-work-main" href="#panel-element-work-show">关闭</a>
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
					<tr>
						<td></td>
						<td class="text-right"><a href="#">编辑</a>|<a
							href="personal/resume/deleteResumeWork?id=${wrok.id }">删除</a></td>
					</tr>
				</table>
			</c:forEach>
			</c:if>
			<div id="panel-element-work-show" class="panel-collapse in">
				<c:if test="${works==NULL }">
					<div class="panel-body col-md-offset-3">
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
				<span class="glyphicon glyphicon-signal"></span> 项目经验 <a
					class="panel-title col-md-offset-9" data-toggle="collapse"
					data-parent="#panel-project-main" href="#panel-element-project"><span
					class="glyphicon glyphicon-plus"></span>新增项目</a>
			</div>
			<!--mian+-->
			<div id="panel-element-project" class="panel-collapse collapse">
				<div class="panel-body">
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
										<textarea class="form-control" name="projectMakeDescription"
											id="projectDescription" /></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">日期：</label>
									<div class="col-md-4">
										<input class="form-control" name="projectBeginTime" size="30"
											type="text" id="datetimeStart2" readonly
											class="form_datetime" placeholder="请选择起始日期" />
									</div>
									<div class="col-md-4">
										<input class="form-control" name="projectEndTime" size="30"
											type="text" id="datetimeEnd2" readonly class="form_datetime"
											placeholder="请选择结束日期" />
									</div>
								</div>
							</div>
							<div class="col-md-offset-5">
								<button type="submit" class="btn btn-success">保存</button>
								<a class="btn btn-default" data-toggle="collapse"
									data-parent="#panel-project-main"
									href="#panel-element-project-show">关闭</a>
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
					<tr>
						<td></td>
						<td class="text-right"><a href="#">编辑</a>|<a
							href="personal/resume/deleteResumeProject?id=${pro.id }">删除</a></td>
					</tr>
				</table>
			</c:forEach>
			</c:if>
			<div id="panel-element-project-show" class="panel-collapse in">
				<c:if test="${projs==null }">
					<div class="panel-body col-md-offset-3">
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
				<span class="glyphicon glyphicon-book"></span> 教育经历 <a
					class="panel-title col-md-offset-9" data-toggle="collapse"
					data-parent="#panel-education-main" href="#panel-element-education"><span
					class="glyphicon glyphicon-plus"></span>新增教育</a>
			</div>
			<!--mian+-->
			<div id="panel-element-education" class="panel-collapse collapse">
				<div class="panel-body">
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
											class="form_datetime" placeholder="请选择起始日期">
									</div>
									<div class="col-md-4">
										<input class="form-control" name="educationEndTime" size="30"
											type="text" id="datetimeEnd" readonly class="form_datetime"
											placeholder="请选择结束日期">
									</div>
								</div>
							</div>
							<div class="col-md-offset-5">
								<button type="submit" class="btn btn-success">保存</button>
								<a class="btn btn-default" data-toggle="collapse"
									data-parent="#panel-education-main"
									href="#panel-element-education-show">关闭</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--mian-->
		</div>
		<!--2+-->
		<div class="panel panel-default">
			<div id="panel-element-education-show" class="panel-collapse in">
				<div class="panel-body col-md-offset-3">
					<span class="glyphicon glyphicon-book"></span>
					完善教育经历，展现专业能力，让HR更了解你！
				</div>
			</div>
		</div>
		<!--2-->
	</div>
</div>
<script type="text/javascript">
	/* 	$("#time").blur(function() {
	alert(typeof ("#time"))
	}); */
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
</script>