<%@ page language="java" import="ynjh.common.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article
	class="col-md-12 work-together-margin-left-30 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
	<div class="row">
		<!--简历基本内容开始-->
		<section class="panel">
			<table class="table">
				<tr>
					<td colspan="3">
						<h3 class="text-center">${resume.resumeTitle }</h3>
					</td>
				</tr>
				<tr>
					<td rowspan="4" class="col-md-1"><c:if
							test="${resume.resumeHeadImg==null }">
							<img src="personal/img/head.gif" width="160" height="160"
								title="我的头像" alt="我的头像" />
						</c:if> <c:if test="${resume.resumeHeadImg!=null }">
							<img class="img-circle"
								src="img/upload/personal/${user.userLoginId }/${resume.resumeHeadImg}"
								width="160" height="160" title="我的头像" alt="我的头像" />
						</c:if></td>
				</tr>
				<tr>
					<td class="col-md-2">${resume.resumeName }<${SEX[resume.resumeGender]
						}>${resume.resumeWorks }</td>
					<td>意向：${resume.resumeJor }--薪资：${resume.resumeWages }</td>

				</tr>
				<tr>
					<td>${resume.resumePlace }</td>
					<td>联系方式（电话）：${resume.resumePhone }</td>
				</tr>
				<tr>
					<td>民族：${resume.resumeNation }</td>
					<td>联系方式（QQ）：${resume.resumeQQ }</td>
				</tr>
			</table>
		</section>
		<div class="panel-group" id="panel">
			<section class="panel">
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
									<td>生日：</td>
									<td><fmt:formatDate value="${resume.resumeBirthday }"
											pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<td>婚姻：</td>
									<td>${MARRY[resume.resumeMarriage] }</td>
								</tr>
								<tr>
									<td>毕业学校：</td>
									<td>${resume.resumeGraduationSchool }</td>
								</tr>
								<tr>
									<td>毕业时间：</td>
									<td><fmt:formatDate
											value="${resume.resumeGraduationTime }" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<td>学历：</td>
									<td>${resume.resumeEducation }</td>
								</tr>
								<tr>
									<td>专业：</td>
									<td>${resume.resumeMajor }</td>
								</tr>
								<tr>
									<td>英语等级：</td>
									<td><c:if test="${resume.resumeEnglishGrade==1 }">
												国家英语考试3级
												</c:if> <c:if test="${resume.resumeEnglishGrade==2 }">
												国家英语考试4级
												</c:if> <c:if test="${resume.resumeEnglishGrade==3 }">
												国家英语考试6级
												</c:if> <c:if test="${resume.resumeEnglishGrade==4 }">
												专业4级
												</c:if> <c:if test="${resume.resumeEnglishGrade==5 }">
												专业8级
												</c:if> <c:if test="${resume.resumeEnglishGrade==6 }">
												未参加
												</c:if> <c:if test="${resume.resumeEnglishGrade==7 }">
												未通过
												</c:if></td>
								</tr>
								<tr>
									<td>外语类型：</td>
									<td><c:if test="${resume.resumeFLType==1 }">
												英语
												</c:if> <c:if test="${resume.resumeFLType==2 }">
												日语
												</c:if> <c:if test="${resume.resumeFLType==3 }">
												德语
												</c:if> <c:if test="${resume.resumeFLType==4 }">
												法语
												</c:if> <c:if test="${resume.resumeFLType==5 }">
												俄语
												</c:if> <c:if test="${resume.resumeFLType==6 }">
												西班牙语
												</c:if> <c:if test="${resume.resumeFLType==7 }">
												丹麦语
												</c:if> <c:if test="${resume.resumeFLType==8 }">
												其他
												</c:if></td>
								</tr>
								<tr>
									<td>外语水平：</td>
									<td><c:if test="${resume.resumeFLAbility==1 }">
												入门
												</c:if> <c:if test="${resume.resumeFLAbility==2 }">
												一般
												</c:if> <c:if test="${resume.resumeFLAbility==3 }">
												熟练
												</c:if> <c:if test="${resume.resumeFLAbility==4 }">
												精通
												</c:if></td>
								</tr>
								<tr>
									<td>计算机水平：</td>
									<td><c:if test="${resume.resumeComputerAbility==1 }">
												入门
												</c:if> <c:if test="${resume.resumeComputerAbility==2 }">
												一般
												</c:if> <c:if test="${resume.resumeComputerAbility==3 }">
												熟练
												</c:if> <c:if test="${resume.resumeComputerAbility==4 }">
												精通
												</c:if></td>
								</tr>
								<tr>
									<td>身高：</td>
									<td>${resume.resumeHeight }</td>
								</tr>
								<tr>
									<td>体重：</td>
									<td>${resume.resumeWeight }</td>
								</tr>
								<tr>
									<td></td>
									<td class="text-right"><a
										href="personal/resume/updateResume?id=${resume.id }">编辑</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</section>
			<!-- 简历基本信息结束 -->
			<!-- 简历其他信息开始 -->
			<section class="panel">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-two">教育记录</a>
					</div>
					<div id="panel-element-two" class="panel-collapse collapse">
						<div class="panel-body">
							<h6>
								<%@include
									file="/WEB-INF/pages/personal/resume/personal_resume_education.jsp"%>
							</h6>
							<%-- <c:if test="${edus==null }">
							<jsp:forward
								page="/personal/resume/lookResumeEdus?resumeId=${resume.id }"></jsp:forward>
						</c:if> --%>
							<c:forEach items="${edus }" var="edu">
								<table class="table">
									<colgroup>
										<col style="width: 50%">
										<col style="width: 50%">
									</colgroup>


									<tr>
										<td>学校名称：</td>
										<td>${edu.educationSchool }</td>
									</tr>
									<tr>
										<td>教育描述：</td>
										<td>
											<p>${edu.educationContent}</p>
										</td>
									</tr>
									<tr>
										<td>教育时间：</td>
										<td><fmt:formatDate value="${edu.educationBeginTime}"
												pattern="yyyy-MM-dd" />到<fmt:formatDate
												value="${edu.educationEndTime}" pattern="yyyy-MM-dd" /></td>
									</tr>
									<tr>
										<td></td>
										<td class="text-right"><a href="#">编辑</a>|<a
											href="personal/resume/deleteResumeEducation?id=${edu.id }">删除</a>
										</td>
									</tr>

								</table>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<section class="panel">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-three">工作记录</a>
					</div>
					<div id="panel-element-three" class="panel-collapse collapse">
						<div class="panel-body">
							<h6>
								<%@include
									file="/WEB-INF/pages/personal/resume/personal_resume_work.jsp"%>
							</h6>
							<%-- <c:if test="${works==null }">
							<jsp:forward
								page="/personal/resume/lookResumeWork?resumeId=${resume.id }"></jsp:forward>
						</c:if> --%>
							<c:forEach items="${works }" var="work">
								<table class="table">
									<colgroup>
										<col style="width: 50%">
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
											href="personal/resume/deleteResumeWork?id=${wrok.id }">删除</a>
										</td>
									</tr>
								</table>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<section class="panel">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-four">项目记录</a>
					</div>
					<div id="panel-element-four" class="panel-collapse collapse">
						<div class="panel-body">
							<h6>
								<%@include
									file="/WEB-INF/pages/personal/resume/personal_resume_project.jsp"%>
							</h6>
							<%-- <c:if test="${projs==null }">
							<jsp:forward
								page="/personal/resume/lookResumeProjs?resumeId=${resume.id }"></jsp:forward>
						</c:if> --%>
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
											href="personal/resume/deleteResumeProject?id=${pro.id }">删除</a>
										</td>
									</tr>
								</table>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<!-- 简历其他信息结束 -->
			<!-- 简历其他信息开始 -->
			<section class="panel">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-five">综合评价</a>
					</div>
					<div id="panel-element-five" class="panel-collapse collapse">
						<div class="panel-body">
							<table class="table">
								<colgroup>
									<col style="width: 50%">
									<col style="width: 50%">
								</colgroup>
								<tr>
									<td>特点描述：</td>
									<td>${resume.resumePersonality }</td>
								</tr>
								<tr>
									<td>自我评价：</td>
									<td>${resume.resumeSelfEvaluation }</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</section>
			<!-- 简历其他信息结束 -->
		</div>
	</div>
</article>
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