<%@ page language="java" import="ynjh.common.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="MARRY" value="${CommonStatus.MARRY }"></c:set>
<c:set var="SEX" value="${CommonStatus.SEX }"></c:set>
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS }"></c:set>
<c:set var="FL_ABILITY" value="${CommonStatus.FL_ABILITY }"></c:set>
<c:set var="FL_TYPE" value="${CommonStatus.FL_TYPE }"></c:set>
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

.margin_bottom_AND_margin_top {
	margin-bottom: 5px;
	margin-top: 5px;
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
			<div class="resumeheadImg col-md-offset-1" style="margin-top: 35px;">
				
				
				<img  onerror="javascript:this.src='img/head.gif'" class="pull-left updateHeadImg media-object " src="img/upload/personal/${user.userLoginId }/${resume.resumeHeadImg}" alt='我的头像' width="100" height="120" />
				
			</div>
			<!-- 头像结束 -->
			<!-- 简历基本信息 -->
			<div class="media-body ">
				<!-- 修改图标开始 -->
				<a class="col-md-offset-10" href="javascript:ajaxPageById('personal/resume/personal_updateresume_index',${resume.id})"><span class="glyphicon glyphicon-edit" id="personal_hidden_photo"></span></a>
				<!-- 修改图标结束 -->
				<h4 class="media-heading col-md-offset-1" style="line-height: 35px; height: 35px; font-size: 20px;">
					<label class="control-label">${resume.resumeName }</label>
					<small>(${AUDIT_STATUS[resume.resumeStatusThree]})</small>
					<small class="col-md-offset-3">${SEX[resume.resumeGender]}</small>
				</h4>
				<!-- 年龄和工作年限需要计算 -->
				<p class="static col-md-offset-1">
					${resume.resumeNowResidence }&nbsp;|&nbsp;
					<label>${resume.works }</label>
					年&nbsp;|&nbsp;&nbsp;|&nbsp;
					<label>${resume.age}</label>岁
					(<fmt:formatDate value="${resume.resumeBirthday }" pattern="yyyy/MM/dd" />)&nbsp;|&nbsp;${resume.resumeJor }
				</p>
				<label class="control-label col-md-offset-1">
					<span class="glyphicon glyphicon-envelope"></span>${resume.resumeEmail }&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="glyphicon glyphicon-earphone"></span>${resume.resumePhone }
				</label>
			</div>
			<!-- 简历基本信息结束 -->
		</div>
		<div class="panel-group">
			<!-- 展开内容 -->
			<div class="panel-heading">
				<a class="panel-title col-md-offset-10" data-toggle="collapse" data-parent="#panel" href="#panel-element-more">
					更多展开 <span class="glyphicon glyphicon-chevron-down"></span>
				</a>
			</div>
			<div id="panel-element-more" class="panel-collapse collapse">
				<div class="panel-body personal_resume_margin">
					<div class="panel-body col-md-12 test personal_resume_defualt">
						<div class="col-md-6 column">
							<label class="control-label">籍贯：</label>
							<label class="control-label">${resume.resumePlace }</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">婚姻状况：${MARRY[resume.resumeMarriage]}</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">目前职位：</label>
							<label class="control-label">${resume.resumeJor}</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">期待月薪：</label> <label
								class="control-label">${resume.resumeWages}</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">QQ或微信：</label>
							<label class="control-label">${resume.resumeQQ}</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">民族：</label>
							<label class="control-label">${resume.resumeNation}</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">毕业院校：${resume.resumeGraduationSchool}</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">毕业时间：</label>
							<label class="control-label">
								<fmt:formatDate value="${resume.resumeGraduationTime}" pattern="yyyy/MM/dd" />
							</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">学历：</label>
							<label class="control-label">${resume.resumeEducation } </label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">专业：</label>
							<label class="control-label">${resume.resumeMajor } </label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">外语水平：</label>
							<label class="control-label">${FL_ABILITY[resume.resumeFLAbility]}</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">外语类型：</label>
							<label class="control-label">
								${FL_TYPE[resume.resumeFLType] } 
							</label>
						</div>
						<div class="col-md-6 column">
							<label class="control-label">身高：</label>
							<label class="control-label">${resume.resumeHeight }</label>厘米
						</div>
						<div class="col-md-6 column">
							<label class="control-label">体重：</label>
							<label class="control-label">${resume.resumeWeight }</label>公斤
						</div>
						<div class="col-md-12 column">
							<label class="control-label">自我评价：${resume.resumeSelfEvaluation }</label>
						</div>
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
				<span class="glyphicon glyphicon-list-alt"></span>工作经验
				<!-- 新增工作 -->
				<a class="panel-title col-md-offset-8" data-toggle="collapse"
					data-parent="#panel-work-main" href="#panel-element-work"
					id="hiddenWork"><span class="glyphicon glyphicon-plus"></span>新增工作</a>
			</div>
			<!--mian+-->
			<div id="panel-element-work" class="panel-collapse collapse">
				<div class="panel-body personal_resume_padding">
					<div class="panel-body col-md-12">
						<form  class="form-horizontal" id="workForm">
							<input type="hidden" name="resumeId" value="${resume.id }" /><br />
							<input type="hidden" name="createWorkpage" value="personal/user/personal_index_myResume" /><br />
							<div class="modal-body">
								<div class="form-group">
									<label for="workFirmName" class="col-md-3 control-label">企业名称：</label>
									<div class="col-md-8">
										<input class="form-control" name="workFirmName"
											id="workFirmName" />
									</div>
								</div>
								<div class="form-group">
									<label for="workUnit" class="col-md-3 control-label">主要工作岗位：</label>
									<div class="col-md-8">
										<input class="form-control" name="workUnit" id="workUnit" />
									</div>
								</div>
								<div class="form-group">
									<label for="workDescription" class="col-md-3 control-label">工作描述：</label>
									<div class="col-md-8">
										<textarea class="form-control" name="workDescription"
											id="workDescription" ></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">日期：</label>
									<div class="col-md-4">
										<input class="form-control form_datetime" name="workBeginTime" size="30"
											type="text" id="workStart" readonly
											class="form_datetime" placeholder="选择起始日期">
									</div>
									<div class="col-md-4">
										<input class="form-control form_datetime" name="workEndTime" size="30"
											type="text" id="workEnd" readonly
											placeholder="选择结束日期">
									</div>
								</div>
							</div>
							<div class="col-md-offset-5">
								<button  onclick="ajaxCreateWork()" class="btn btn-success">保存</button>
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
		
		<!--牟勇： 已有工作经验列表 -->
		<div class="panel panel-default" id="workFresh">
			<%@include
				file="/WEB-INF/pages/personal/resume/personal_resume_work.jsp"%>
		</div>
		<!--牟勇： 已有工作经验列表结束 -->
		
	</div>
	<!--
		作者：18213026337@163.com
		时间：2017-05-15
		描述：项目经验 
                        -->
	<div class="panel-group" id="panel-project-main">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-signal"></span>项目经验
				<!-- 添加项目 -->
				<a class="panel-title col-md-offset-8" data-toggle="collapse"
					data-parent="#panel-project-main" href="#panel-element-project"
					id="hiddenProject"><span class="glyphicon glyphicon-plus"></span>新增项目</a>
			</div>
			<!--mian+-->
			<div id="panel-element-project" class="panel-collapse collapse">
				<div class="panel-body personal_resume_padding">
					<div class="panel-body col-md-12">
						<form class="form-horizontal"  id="projectForm">
							<input type="hidden" name="resumeId" value="${resume.id }" /><br />
							<input type="hidden" name="createProjectpage" value="personal/user/personal_index_myResume" /><br />
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
										<input class="form-control form_datetime" name="projectBeginTime" size="30"
											type="text" id="projectStart" readonly
											 placeholder="选择起始日期" />
									</div>
									<div class="col-md-4">
										<input class="form-control form_datetime" name="projectEndTime" size="30"
											type="text" id="projectEnd" readonly
											placeholder="选择结束日期" />
									</div>
								</div>
							</div>
							<div class="col-md-offset-5">
								<button onclick="ajaxCreateProject()" class="btn btn-success">保存</button>
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
		
		<!-- 项目经验开始 -->
		<div class="panel panel-default" id="projectFresh">
			<%@include
				file="/WEB-INF/pages/personal/resume/personal_resume_project.jsp"%>
		</div>
		<!-- 项目经验结束 -->
		
	</div>

	<!--
		作者：18213026337@163.com
		时间：2017-05-15
		描述：教育经历
	 -->
	<div class="panel-group" id="panel-education-main">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="glyphicon glyphicon-book"></span>教育经历 
				<!-- 添加教育 -->
				<a class="panel-title col-md-offset-8" data-toggle="collapse"
					data-parent="#panel-education-main" href="#panel-element-education"
					id="hiddenEducation"><span class="glyphicon glyphicon-plus"></span>新增教育</a>
			</div>
			<!--mian+-->
			<div id="panel-element-education" class="panel-collapse collapse">
				<div class="panel-body personal_resume_padding">
					<div class="panel-body col-md-12">
						<form class="form-horizontal" id="educationForm">
							<input type="hidden" name="resumeId" value="${resume.id }" /><br />
							<input type="hidden" name="createEducationpage" value="personal/user/personal_index_myResume" /><br />
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
										<input class="form-control form_datetime" name="educationBeginTime"
											size="30" type="text" id="educationStart" readonly
											 placeholder="选择起始日期">
									</div>
									<div class="col-md-4">
										<input class="form-control form_datetime" name="educationEndTime" size="30"
											type="text" id="educationEnd" readonly
											placeholder="选择结束日期">
									</div>
								</div>
							</div>
							<div class="col-md-offset-5">
								<button onclick="ajaxCreateEducation()" class="btn btn-success">保存</button>
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
<!-- 局部刷新开始 -->
		<div class="panel panel-default" id="educationFresh">
			<%@include
				file="/WEB-INF/pages/personal/resume/personal_resume_education.jsp"%>
		</div>
		<!-- 局部刷新结束 -->			
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
		/* 教育 */
		/* $("#educationStart").datetimepicker({
			format : 'yyyy-mm',
			language : 'zh-CN',
			startDate : '1900-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : 3,
			startView:3
		}).on(
				"click",
				function() {
					$("#educationStart").datetimepicker("setEndDate",
							$("#educationEnd").val())
				}).on('hide',function(e) {  
	                $('#educationForm').data('bootstrapValidator')  
	                .updateStatus('educationBeginTime', 'NOT_VALIDATED',null)  
	                .validateField('educationBeginTime');  
	        });

		$("#educationEnd").datetimepicker({
			format : 'yyyy-mm',
			language : 'zh-CN',
			startDate : '1900-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : 3,
			startView:3
		}).on(
				"click",
				function() {
					$("#educationEnd").datetimepicker("setStartDate",
							$("#educationStart").val())
				}).on('hide',function(e) {  
	                $('#educationForm').data('bootstrapValidator')  
	                .updateStatus('educationEndTime', 'NOT_VALIDATED',null)  
	                .validateField('educationEndTime');  
	        }); */
		/* 工作 */
		$(".form_datetime").datetimepicker({
			format : 'yyyy-mm',
			language : 'zh-CN',
			startDate : '1900-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : 3,
			startView:3
		}).on(
				"click",
				function() {
					$("#workStart").datetimepicker("setEndDate",
							$("#workEnd").val());
				}).on('hide',function(e) {  
	                $('#workForm').data('bootstrapValidator')  
	                .updateStatus('workStart', 'NOT_VALIDATED',null)  
	                .validateField('workStart');  
	        });

		/* $("#workEnd").datetimepicker({
			format : 'yyyy-mm',
			language : 'zh-CN',
			startDate : '1900-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : 3,
			startView:3
		}).on(
				"click",
				function() {
					$("#workEnd").datetimepicker("setStartDate",
							$("#workStart").val())
				}).on('hide',function(e) {  
	                $('#resumeForm').data('bootstrapValidator')  
	                .updateStatus('workEnd', 'NOT_VALIDATED',null)  
	                .validateField('workEnd');  
	        }); */
		/* 项目 */
		/* $("#projectStart").datetimepicker({
			format : 'yyyy-mm',
			language : 'zh-CN',
			startDate : '1900-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : 3,
			startView:3
		}).on(
				"click",
				function() {
					$("#projectStart").datetimepicker("setEndDate",
							$("#projectEnd").val())
				}).on('hide',function(e) {  
	                $('#projectForm').data('bootstrapValidator')  
	                .updateStatus('projectBeginTime', 'NOT_VALIDATED',null)  
	                .validateField('projectBeginTime');  
	        });

		$("#projectEnd").datetimepicker({
			format : 'yyyy-mm',
			language : 'zh-CN',
			startDate : '1900-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : 3,
			startView:3
		}).on(
				"click",
				function() {
					$("#projectEnd").datetimepicker("setStartDate",
							$("#projectStart").val())
				}).on('hide',function(e) {  
	                $('#projectForm').data('bootstrapValidator')  
	                .updateStatus('projectEndTime', 'NOT_VALIDATED',null)  
	                .validateField('projectEndTime');  
	        }); */
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
	/* ajxa修改 */
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
	
	/* ajxa添加 */
	var ajaxCreateWork=function(){
		var workForm=new FormData(document.getElementById("workForm"));
		$.ajax({
			url:"personal/resume/CreateWork",
			type:"POST",
			data:workForm,
			dataType:"html",
			processData : false,
			contentType : false,
			success:function(data){
				alert("添加成功！");
				$("#my-content").html(data);
			}
		});
	}
	var ajaxCreateProject=function(){
		var projectForm=new FormData(document.getElementById("projectForm"));
		$.ajax({
			url:"personal/resume/CreateProject",
			type:"POST",
			data:projectForm,
			dataType:"html",
			processData : false,
			contentType : false,
			success:function(data){
				alert("添加成功！");
				$("#my-content").html(data);
			}
		});
	}
	var ajaxCreateEducation=function(){
		var educationForm=new FormData(document.getElementById("educationForm"));
		$.ajax({
			url:"personal/resume/CreateEducation",
			type:"POST",
			data:educationForm,
			dataType:"html",
			processData : false,
			contentType : false,
			success:function(data){
				alert("添加成功！");
				$("#my-content").html(data);
			}
		});
	}
	
	
	/* 牟勇：ajax的各种删除，page为执行删除的控制器方法url，id为要删除记录的主键id */
	var ajaxDelete=function(page,id){
		if(confirm('你确认真的要删除吗？')){
			$.ajax({
				url:page,
				type:"POST",
				data:{id:id},
				dataType:"text",
				success:function(data){
					alert(data);
					ajaxPage("personal/user/personal_index_myResume");
				}
			});
		}
	}
	
</script>