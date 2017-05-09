<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--左侧状态栏位-->
<article
	class="col-md-12 work-together-margin-left-30 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
	<!--发表状态小节-->
	<section class="panel">
		<!-- 简历基本信息开始 -->
		<form role="form" class="form-horizontal"
			action="personal/resume/updateResume" method="post" id="resumeForm"
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="${resume.id }" />
			<div class="form-group">
				<label for="resumeTitle" class="col-md-3 control-label">简历标题：</label>
				<div class="col-md-8">
					<input value="${resume.resumeTitle }" class="form-control"
						name="resumeTitle" id="resumeTitle" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeName" class="col-md-3 control-label">姓名：</label>
				<div class="col-md-8">
					<input value="${resume.resumeName }" class="form-control"
						name="resumeName" id="resumeName" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeHeadImg" class="col-md-3 control-label">头像：</label>
				<!-- userHeadImgPath -->
				<div class="col-md-8">
					<input class="form-control file" name="resumeFile" type="file"
						id="resumeHeadImg" multiple data-min-file-count="1" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeGender" class="col-md-3 control-label">性别：</label>
				<div class="col-md-8">
					<c:if test="${resume.resumeGender==1 }">
						<div class="col-md-6">
							<input type="radio" name="resumeGender" id="resumeGender"
								value="1" checked="checked"> <label>男</label> <input
								type="radio" name="resumeGender" id="resumeGender" value="0">
							<label>女</label>
						</div>
					</c:if>
					<c:if test="${resume.resumeGender==0 }">
						<div class="col-md-6">
							<input type="radio" name="resumeGender" id="resumeGender"
								value="1"> <label>男</label> <input type="radio"
								name="resumeGender" id="resumeGender" value="0"
								checked="checked"> <label>女</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<label for="resumeWages" class="col-md-3 control-label">期望薪资：</label>
				<div class="col-md-8">
					<input value="${resume.resumeWages }" class="form-control"
						name="resumeWages" id="resumeWages" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeJor" class="col-md-3 control-label">意向：</label>
				<div class="col-md-8">
					<input value="${resume.resumeJor }" class="form-control"
						name="resumeJor" id="resumeJor" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeNation" class="col-md-3 control-label">民族：</label>
				<div class="col-md-8">
					<input value="${resume.resumeNation }" class="form-control"
						name="resumeNation" id="resumeNation" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumePlace" class="col-md-3 control-label">籍贯：</label>
				<div class="col-md-8">
					<input value="${resume.resumePlace }" class="form-control"
						name="resumePlace" id="resumePlace" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeBirthday" class="col-md-3 control-label">出生日期：</label>
				<div class="col-md-8">
					<input value="${resume.resumeBirthday }"
						class="form-control form_datetime" placeholder="请选择日期"
						name="resumeBirthday" id="resumeBirthday" readonly />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeMarriage" class="col-md-3 control-label">婚配：</label>
				<div class="col-md-8">
					<c:if test="${resume.resumeMarriage==1 }">
						<div class="col-md-6">
							<input type="radio" name="resumeMarriage" id="resumeMarriage"
								value="1" checked="checked"> <label>已婚</label> <input
								type="radio" name="resumeMarriage" id="resumeMarriage" value="0">
							<label>未婚</label>
						</div>
					</c:if>
					<c:if test="${resume.resumeMarriage==0 }">
						<div class="col-md-6">
							<input type="radio" name="resumeMarriage" id="resumeMarriage"
								value="1"> <label>已婚</label> <input type="radio"
								name="resumeMarriage" id="resumeMarriage" value="0"
								checked="checked"> <label>未婚</label>
						</div>
					</c:if>
				</div>
			</div>
			<div class="form-group">
				<label for="resumeEducation" class="col-md-3 control-label">学历：</label>
				<div class="col-md-8">
					<input value="${resume.resumeEducation }" class="form-control"
						name="resumeEducation" id="resumeEducation" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeGraduationSchool" class="col-md-3 control-label">毕业学校：</label>
				<div class="col-md-8">
					<input value="${resume.resumeGraduationSchool }"
						class="form-control" name="resumeGraduationSchool"
						id="resumeGraduationSchool" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeGraduationTime" class="col-md-3 control-label">毕业日期：</label>
				<div class="col-md-8">
					<input value="${resume.resumeGraduationTime }"
						class="form-control form_datetime" placeholder="请选择日期"
						name="resumeGraduationTime" id="resumeGraduationTime" readonly />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeMajor" class="col-md-3 control-label">专业：</label>
				<div class="col-md-8">
					<input value="${resume.resumeMajor }" class="form-control"
						name="resumeMajor" id="resumeMajor" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumePhone" class="col-md-3 control-label">电话号码：</label>
				<div class="col-md-8">
					<input value="${resume.resumePhone }" class="form-control"
						name="resumePhone" id="resumePhone" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeQQ" class="col-md-3 control-label">QQ或微信：</label>
				<div class="col-md-8">
					<input value="${resume.resumeQQ }" class="form-control"
						name="resumeQQ" id="resumeQQ" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeHeight" class="col-md-3 control-label">身高（厘米）：</label>
				<div class="col-md-8">
					<input value="${resume.resumeHeight }" class="form-control"
						name="resumeHeight" id="resumeHeight" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeWeight" class="col-md-3 control-label">体重（斤）：</label>
				<div class="col-md-8">
					<input value="${resume.resumeWeight }" class="form-control"
						name="resumeWeight" id="resumeWeight" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumePersonality" class="col-sm-3 control-label">特点描述：</label>
				<div class="col-sm-8">
					<textarea value="${resume.resumePersonality }" class="form-control"
						name="resumePersonality" id="resumePersonality"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="resumeSelfEvaluation" class="col-sm-3 control-label">自我评价：</label>
				<div class="col-sm-8">
					<textarea value="${resume.resumeSelfEvaluation }"
						class="form-control" name="resumeSelfEvaluation"
						id="resumeSelfEvaluation"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="resumeEnglishGrade" class="col-md-3 control-label">英语等级：</label>
				<div class="col-md-8">
					<select name="resumeEnglishGrade" id="resumeEnglishGrade"
						class="form-control">
						<option value=" ">--未选择--</option>
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
				<label for="resumeFLType" class="col-md-3 control-label">外语类型：</label>
				<div class="col-md-8">
					<select name="resumeFLType" id="resumeFLType" class="form-control">
						<option value=" " selected="selected">--未选择--</option>
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
				<label for="resumeFLAbility" class="col-md-3 control-label">外语水平：</label>
				<div class="col-md-8">
					<select name="resumeFLAbility" id="resumeFLAbility"
						class="form-control">
						<option value=" " selected="selected">--未选择--</option>
						<option value="1">入门</option>
						<option value="2">一般</option>
						<option value="3">熟练</option>
						<option value="4">精通</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="resumeComputerAbility" class="col-md-3 control-label">计算机水平：</label>
				<div class="col-md-8">
					<select name="resumeComputerAbility" id="resumeComputerAbility"
						class="form-control">
						<option value=" " selected="selected">--未选择--</option>
						<option value="1">入门</option>
						<option value="2">一般</option>
						<option value="3">熟练</option>
						<option value="4">精通</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<a for="" class="col-md-offset-9 control-label ">添加教育记录</a>
			</div>
			<div class="form-group">
				<a for="" class="col-md-offset-9 control-label">添加工作记录</a>
			</div>
			<div class="form-group">
				<a for="" class="col-md-offset-9 control-label">添加项目记录</a>
			</div>
			<div class="form-group">
				<div class="col-md-offset-9">
					<input class="btn btn-success" type="submit" value="保存" />
				</div>
			</div>
			<!-- 取值 -->
			<input type="hidden" id="HresumeFLAbility"
				value="${resume.resumeFLAbility}"> <input type="hidden"
				id="HresumeFLType" value="${resume.resumeFLType}"> <input
				type="hidden" id="HresumeEnglishGrade"
				value="${resume.resumeEnglishGrade}"> <input type="hidden"
				id="HresumeComputerAbility" value="${resume.resumeComputerAbility}">
			<!-- 取值 末-->
		</form>
		<!-- 简历基本信息结束 -->
	</section>
</article>
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

		$("#resumeHeadImg").fileinput({
			'language' : 'zh',
			'showUpload' : false,
			'previewFileType' : 'any'
		});

		$("#resumeBirthday").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		});
		$("#resumeGraduationTime").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : "month"
		});
		/* 	$("#time").blur(function() {
				alert(typeof ("#time"))
			}); */
		/* $('input').each(function() {
			var self = $(this), label = self.next(), label_text = label.text();
			label.remove();
			self.iCheck({
				checkboxClass : 'icheckbox_line-orange',
				radioClass : 'iradio_line-orange',
				insert : '<div class="icheck_line-icon"></div>' + label_text
			});
		}); */
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
						notEmpty : {
							message : '标题不能为空'
						},
						stringLength : {
							min : 2,
							max : 50,
							message : '标题长度必须在2到50位之间'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入中文名字"
						}

					}
				},
				resumeHeadImg : {
					validators : {
						notEmpty : {
							message : '头像不能为空'
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
							message : '姓名长度必须在2到10位之间'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入中文名字"
						}

					}
				},
				resumeWages : {
					validators : {
						notEmpty : {
							message : '薪资不能为空'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '请输入数字'
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
							message : '意向长度必须在2到45位之间'
						}
					}
				},
				resumeNation : {
					validators : {
						notEmpty : {
							message : '民族不能为空'
						},
						stringLength : {
							min : 1,
							max : 10,
							message : '民族长度必须在1到10位之间'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入中文名字"
						}

					}
				},
				resumePlace : {
					validators : {
						notEmpty : {
							message : '籍贯不能为空'
						},
						stringLength : {
							min : 1,
							max : 50,
							message : '籍贯长度必须在1到50位之间'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入中文名字"
						}

					}
				},
				/* resumeBirthday:{
					validators : {
						data : {
							format: 'YYYY-MM-DD',
							message : '出生日期不能为空'
						}
					}
				} */
				resumeEducation : {
					validators : {
						notEmpty : {
							message : '学历不能为空'
						},
						stringLength : {
							min : 1,
							max : 20,
							message : '学历长度必须在1到20位之间'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入中文名字"
						}

					}
				},
				resumeGraduationSchool : {
					validators : {
						notEmpty : {
							message : '毕业学校不能为空'
						},
						stringLength : {
							min : 1,
							max : 50,
							message : '毕业学校长度必须在1到50位之间'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入中文名字"
						}

					}
				},
				resumeMajor : {
					validators : {
						notEmpty : {
							message : '专业不能为空'
						},
						stringLength : {
							min : 1,
							max : 20,
							message : '专业长度必须在1到20位之间'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请输入中文名字"
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
							message : '电话号码长度必须在11到11位之间'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '请输入正确的电话号码'
						}

					}
				},
				resumeQQ : {
					validators : {
						notEmpty : {
							message : 'QQ或微信不能为空'
						},
						stringLength : {
							min : 6,
							max : 11,
							message : 'QQ或微信长度必须在6到20位之间'
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_-]+$/,
							message : '请输入正确的电话号码！'
						}

					}
				},
				resumeHeight : {
					validators : {
						notEmpty : {
							message : '身高不能为空'
						},
						stringLength : {
							min : 2,
							max : 3,
							message : '身高必须在2到3位之间'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '请输入正确的身高数！'
						}

					}
				},
				resumeWeight : {
					validators : {
						notEmpty : {
							message : '体重不能为空'
						},
						stringLength : {
							min : 2,
							max : 3,
							message : '体重必须在2到3位之间'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '请输入正确的体重数！'
						}

					}
				},
				resumePersonality : {
					validators : {
						notEmpty : {
							message : '特点描述不能为空'
						},
						stringLength : {
							min : 10,
							max : 50,
							message : '特点描述必须在10到50位之间'
						}
					}
				},
				resumeSelfEvaluation : {
					validators : {
						notEmpty : {
							message : '自我评价不能为空'
						},
						stringLength : {
							min : 10,
							max : 500,
							message : '自我评价必须在10到500位之间'
						}
					}
				},
				resumeEnglishGrade : {
					validators : {
						notEmpty : {
							message : '英语等级不能为空'
						}
					}
				},
				resumeFLType : {
					validators : {
						notEmpty : {
							message : '外语类型不能为空'
						}
					}
				},
				resumeFLAbility : {
					validators : {
						notEmpty : {
							message : '外语水平不能为空'
						}
					}
				},
				resumeComputerAbility : {
					validators : {
						notEmpty : {
							message : '计算机水平不能为空'
						}
					}
				}
			}
		});
	});
</script>