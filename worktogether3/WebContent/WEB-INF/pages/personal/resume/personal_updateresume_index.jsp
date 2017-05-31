<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 简历基本信息开始 -->
<div class="panel panel-default">
	<form class="form-horizontal" action="personal/resume/createResume"
		method="post" id="resumeForm" style="margin-top: 35px;">
		<div class="col-md-2 column">
			<img src="img/head.gif" class="center-block" width="100" height="120" />
		</div>
		<div class="col-md-5 column">
			<div class="form-group">
				<label for="resumeTitle" class="col-md-4 control-label">简历标题</label>
				<div class="col-md-8">
					<input value="${resume_update.resumeTitle }" class="form-control"
						name="resumeTitle" id="resumeTitle" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeName" class="col-md-4 control-label">姓名</label>
				<div class="col-md-8">
					<input value="${resume_update.resumeName }" class="form-control"
						name="resumeName" id="resumeName" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeBirthday" class="col-md-4 control-label">出生日期</label>
				<div class="col-md-8">
					<input
						value="<fmt:formatDate
						value="${resume_update.resumeBirthday }" pattern="yyyy-MM-dd" />"
						class="form-control form_datetime" placeholder="请选择日期"
						name="resumeBirthday" id="resumeBirthday" readonly />
				</div>
			</div>
			<div class="form-group">
				<label for="resumePhone" class="col-md-4 control-label">手机</label>
				<div class="col-md-8">
					<input value="${resume_update.resumePhone }" class="form-control"
						name="resumePhone" id="resumePhone" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeEmail" class="col-md-4 control-label">邮箱</label>
				<div class="col-md-8">
					<input value="${resume_update.resumeEmail }" class="form-control"
						name="resumeEmail" id="resumeEmail" />
				</div>
			</div>
		</div>
		<div class="col-md-5 column">
			<div class="form-group">
				<label for="resumeGender" class="col-md-4 control-label">性别</label>
				<div class="col-md-8">
					<c:if test="${resume_update.resumeGender==1 }">
						<div class="col-md-6 radio">
							<input type="radio" name="resumeGender" id="resumeGender"
								value="1" checked="checked"> <label>男</label>
						</div>
						<div class="col-md-6 radio">
							<input type="radio" name="resumeGender" id="resumeGender"
								value="0"> <label>女</label>
						</div>
					</c:if>
					<c:if test="${resume_update.resumeGender==0 }">
						<div class="col-md-6 radio">
							<input type="radio" name="resumeGender" id="resumeGender"
								value="1"> <label>男</label>
						</div>
						<div class="col-md-6 radio">
							<input type="radio" name="resumeGender" id="resumeGender"
								value="0" checked="checked"> <label>女</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<label for="resumeWorks" class="col-md-4 control-label">开始工作时间</label>
				<div class="col-md-8">
					<input
						value="<fmt:formatDate
						value="${resume_update.resumeWorks }" pattern="yyyy-MM-dd" />"
						placeholder="请选择日期" class="form-control" name="resumeWorks"
						id="resumeWorks" readonly />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeNowResidence" class="col-md-4 control-label">目前居住地</label>
				<div class="col-md-8">
					<input value="${resume_update.resumeNowResidence }"
						class="form-control" name="resumeNowResidence"
						id="resumeNowResidence" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeJor" class="col-md-4 control-label">求职意向</label>
				<div class="col-md-8">
					<input value="${resume_update.resumeJor }" class="form-control"
						name="resumeJor" id="resumeJor" />
				</div>
			</div>

		</div>
		<div class="panel-group">
			<div class="panel-heading">
				<a class="panel-title col-md-offset-10" data-toggle="collapse"
					data-parent="#panel" href="#panel-element-more">更多展开 <span
					class="glyphicon glyphicon-chevron-down"></span></a>
			</div>
			<div id="panel-element-more" class="panel-collapse collapse" >
				<div class="panel-body" >
					<div class="col-md-6 column" style="margin-top: 35px;">
						<div class="form-group">
							<label for="resumeQQ" class="col-md-4 control-label">QQ或微信</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeQQ }" class="form-control"
									name="resumeQQ" id="resumeQQ" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeNation" class="col-md-4 control-label">民族</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeNation }"
									class="form-control" name="resumeNation" id="resumeNation" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumePlace" class="col-md-4 control-label">籍贯</label>
							<div class="col-md-8">
								<input value="${resume_update.resumePlace }"
									class="form-control" name="resumePlace" id="resumePlace" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeEnglishGrade" class="col-md-4 control-label">英语等级</label>
							<div class="col-md-8">
								<select name="resumeEnglishGrade" id="resumeEnglishGrade"
									class="form-control">
									<option value="0" selected="selected">--未选择--</option>
									<option value="1">国家英语考试3级</option>
									<option value="2">国家英语考试4级</option>
									<option value="3">国家英语考试6级</option>
									<option value="4">专业4级</option>
									<option value="5">专业8级</option>
									<option value="6">未参加</option>
									<option value="7">未通过</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeComputerAbility" class="col-md-4 control-label">计算机水平</label>
							<div class="col-md-8">
								<select name="resumeComputerAbility" id="resumeComputerAbility"
									class="form-control">
									<option value="0" selected="selected">--未选择--</option>
									<option value="1">入门</option>
									<option value="2">一般</option>
									<option value="3">熟练</option>
									<option value="4">精通</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeHouseAddress" class="col-md-4 control-label">家庭地址</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeHouseAddress }"
									class="form-control" name="resumeHouseAddress"
									id="resumeHouseAddress" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeGraduationSchool"
								class="col-md-4 control-label">毕业学校</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeGraduationSchool }"
									class="form-control" name="resumeGraduationSchool"
									id="resumeGraduationSchool" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeSelfEvaluation" class="col-sm-4 control-label">自我评价</label>
							<div class="col-sm-8">
								<textarea class="form-control" name="resumeSelfEvaluation"
									id="resumeSelfEvaluation">${resume_update.resumeSelfEvaluation }</textarea>
							</div>
						</div>
					</div>
					<div class="col-md-5 column" style="margin-top: 35px;">
						<div class="form-group">
							<label for="resumeEducation" class="col-md-4 control-label">学历</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeEducation }"
									class="form-control" name="resumeEducation"
									id="resumeEducation" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeWages" class="col-md-4 control-label">期望薪资</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeWages }"
									class="form-control" name="resumeWages" id="resumeWages" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeMajor" class="col-md-4 control-label">专业</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeMajor }"
									class="form-control" name="resumeMajor" id="resumeMajor" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeGraduationTime" class="col-md-4 control-label">毕业日期</label>
							<div class="col-md-8">
								<input
									value="<fmt:formatDate
						value="${resume_update.resumeGraduationTime}" pattern="yyyy-MM-dd" />"
									class="form-control form_datetime" placeholder="请选择日期"
									name="resumeGraduationTime" id="resumeGraduationTime" readonly />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeFLType" class="col-md-4 control-label">外语类型</label>
							<div class="col-md-8">
								<select name="resumeFLType" id="resumeFLType"
									class="form-control">
									<option value="0" selected="selected">--未选择--</option>
									<option value="1">英语</option>
									<option value="2">日语</option>
									<option value="3">德语</option>
									<option value="4">法语</option>
									<option value="5">俄语</option>
									<option value="6">西班牙语</option>
									<option value="7">丹麦语</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeFLAbility" class="col-md-4 control-label">外语水平</label>
							<div class="col-md-8">
								<select name="resumeFLAbility" id="resumeFLAbility"
									class="form-control">
									<option value="0" selected="selected">--未选择--</option>
									<option value="1">入门</option>
									<option value="2">一般</option>
									<option value="3">熟练</option>
									<option value="4">精通</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeMarriage" class="col-md-4 control-label">婚姻状况</label>
							<div class="col-md-8">
								<c:if test="${resume_update.resumeMarriage==1 }">
									<div class="col-md-6 radio">
										<input type="radio" name="resumeMarriage" id="resumeMarriage"
											value="1" checked="checked"> <label>已婚</label>
									</div>
									<div class="col-md-6 radio">
										<input type="radio" name="resumeMarriage" id="resumeMarriage"
											value="0"> <label>未婚</label>
									</div>
								</c:if>
								<c:if test="${resume_update.resumeMarriage==0 }">
									<div class="col-md-6 radio">
										<input type="radio" name="resumeMarriage" id="resumeMarriage"
											value="1"> <label>已婚</label>
									</div>
									<div class="col-md-6 radio">
										<input type="radio" name="resumeMarriage" id="resumeMarriage"
											value="0" checked="checked"> <label>未婚</label>
									</div>
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeHeight" class="col-md-4 control-label">身高</label>
							<div class="col-md-8 input-group">
								<input value="${resume_update.resumeHeight }"
									class="form-control" name="resumeHeight" id="resumeHeight" />
									 <span class="input-group-addon">（厘米）</span>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeWeight" class="col-md-4 control-label">体重</label>
							<div class="col-md-8 input-group">
								<input value="${resume_update.resumeWeight }"
									class="form-control" name="resumeWeight" id="resumeWeight" />
									 <span class="input-group-addon">（斤）</span>
							</div>
						</div>
						<!-- 取值 -->
						<input type="hidden" id="HresumeFLAbility"
							value="${resume_update.resumeFLAbility}"> <input
							type="hidden" id="HresumeFLType"
							value="${resume_update.resumeFLType}"> <input
							type="hidden" id="HresumeEnglishGrade"
							value="${resume_update.resumeEnglishGrade}"> <input
							type="hidden" id="HresumeComputerAbility"
							value="${resume_update.resumeComputerAbility}">
						<!-- 取值 末-->
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-5 col-md-12">
				<input type="submit" class="btn btn-success" value="保存" />
			</div>
		</div>
	</form>

	<div class="panel-footer"></div>
	<div class="panel-heading">
		<h3 class="panel-title">
			<span class="glyphicon glyphicon-list-alt"></span> 工作经验 <label
				class="panel-title col-md-offset-9"><span
				class="glyphicon glyphicon-plus"></span> 新增工作</label>
		</h3>
	</div>
	<div class="panel-body col-md-offset-3">
		<span class="glyphicon glyphicon-list-alt"></span>
		完善工作经验，展现工作内容及能力，让HR更了解你！
	</div>
	<div class="panel-footer"></div>
	<div class="panel-heading">
		<h3 class="panel-title">
			<span class="glyphicon glyphicon-signal"></span> 项目经验 <label
				class="panel-title col-md-offset-9"><span
				class="glyphicon glyphicon-plus"></span> 新增项目</label>
		</h3>
	</div>
	<div class="panel-body col-md-offset-3">
		<span class="glyphicon glyphicon-signal"></span>
		完善项目经验，展现社会工作能力，让HR更了解你！
	</div>
	<div class="panel-footer"></div>
	<div class="panel-heading">
		<h3 class="panel-title">
			<span class="glyphicon glyphicon-book"></span> 教育经历 <label
				class="panel-title col-md-offset-9"><span
				class="glyphicon glyphicon-plus"></span>新增教育</label>
		</h3>
	</div>
	<div class="panel-body col-md-offset-3">
		<span class="glyphicon glyphicon-book"></span> 完善教育经历，展现专业能力，让HR更了解你！
	</div>
</div>
<!-- 简历基本信息结束 -->
<script type="text/javascript">
	$(function() {
		var resumeFLAbility = $("#HresumeFLAbility").val();
		var resumeFLType = $("#HresumeFLType").val();
		var resumeEnglishGrade = $("#HresumeEnglishGrade").val();
		var resumeComputerAbility = $("#HresumeComputerAbility").val();

		$("#resumeFLAbility").val(resumeFLAbility);
		$("#resumeFLType").val(resumeFLType);
		$("#resumeEnglishGrade").val(resumeEnglishGrade);
		$("#resumeComputerAbility").val(resumeComputerAbility);
		
		$("#resumeWorks").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#resumeWorks").datetimepicker("setEndDate",
							$("#resumeBirthday").val())
				});

		$("#resumeBirthday").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		}).on(
				"click",
				function() {
					$("#resumeBirthday").datetimepicker("setStartDate",
							$("#resumeWorks").val())
				});

		$("#resumeGraduationTime").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		});

		$("#resumeForm").bootstrapValidator({
			message : '这个值不能通过验证！！',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				resumeTitle : {
					validators : {
						stringLength : {
							min : 0,
							max : 50,
							message : '请正确输入的标题'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请正确输入的标题"
						}

					}
				},
				resumeName : {
					validators : {
						notEmpty : {
							message : '姓名不能为空'
						},
						stringLength : {
							min : 2,
							max : 10,
							message : '请输入正确的名字'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入正确的名字"
						}

					}
				},
				resumeWorks : {
					validators : {
						notEmpty : {
							message : '工作年限不能为空'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '请输入正确的工作年限'
						}
					}
				},
				resumeWages : {
					validators : {
						regexp : {
							regexp : /^[0-9]+$/,
							message : '请输入正确的薪资'
						}
					}
				},
				resumeJor : {
					validators : {
						notEmpty : {
							message : '意向不能为空'
						},
						stringLength : {
							min : 2,
							max : 8,
							message : '请输入正确的意向'
						}
					}
				},
				resumeNation : {
					validators : {
						stringLength : {
							min : 0,
							max : 10,
							message : '请输入正确的民族'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入正确的民族"
						}

					}
				},
				resumePlace : {
					validators : {
						stringLength : {
							min : 0,
							max : 50,
							message : '请输入正确籍贯'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入正确籍贯"
						}

					}
				},
				resumeBirthday : {
					validators : {
						notEmpty : {
							message : '出生日期不能为空'
						}
					}
				},
				resumeEducation : {
					validators : {
						stringLength : {
							min : 0,
							max : 20,
							message : '请正确的输入学历'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请正确的输入学历"
						}

					}
				},
				resumeGraduationSchool : {
					validators : {
						stringLength : {
							min : 0,
							max : 50,
							message : '请正确的输入毕业学校'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请正确的输入毕业学校"
						}

					}
				},
				resumeMajor : {
					validators : {
						stringLength : {
							min : 0,
							max : 20,
							message : '请正确的输入专业'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请正确的输入专业"
						}

					}
				},
				resumePhone : {
					validators : {
						notEmpty : {
							message : '电话号码不能为空'
						},
						stringLength : {
							min : 7,
							max : 11,
							message : '请输入正确的电话号码'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '请输入正确的电话号码'
						}

					}
				},
				resumeQQ : {
					validators : {
						stringLength : {
							min : 6,
							max : 20,
							message : '请输入正确的QQ或微信'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_-]+$/,
							message : '请输入正确的QQ或微信'
						}

					}
				},
				resumeHeight : {
					validators : {
						stringLength : {
							min : 2,
							max : 3,
							message : '请输入正确的身高数'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '请输入正确的身高数！'
						}

					}
				},
				resumeWeight : {
					validators : {
						stringLength : {
							min : 2,
							max : 3,
							message : '请输入正确的体重数'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '请输入正确的体重数'
						}

					}
				},
				resumeSelfEvaluation : {
					validators : {
						stringLength : {
							min : 0,
							max : 500,
							message : '自我评价最多500字'
						}
					}
				},
				resumeGender : {
					validators : {
						notEmpty : {
							message : '请选择性别'
						}
					}
				},
				resumeWorks : {
					validators : {
						notEmpty : {
							message : '请选择开始工作日期'
						}
					}
				},
				resumeNowResidence : {
					validators : {
						notEmpty : {
							message : '目前居住地不能为空'
						},
						stringLength : {
							min : 0,
							max : 45,
							message : '请选择正确的目前居住地'
						}
					}
				},
				resumeEmail : {
					validators : {
						notEmpty : {
							message : '邮箱地址不能为空'
						},
						emailAddress : {
							message : '邮箱地址格式有误'
						}
					}
				},
				resumeGraduationTime : {
					validators : {
						message : '请选择正确的毕业时间'
					}
				},
				resumeHouseAddress : {
					validators : {
						stringLength : {
							min : 0,
							max : 200,
							message : '请选择正确的家庭地址'
						}
					}
				},
				resumeMarriage : {
					validators : {
						message : '请选择婚姻状况'
					}
				}
			}
		});
	});
</script>