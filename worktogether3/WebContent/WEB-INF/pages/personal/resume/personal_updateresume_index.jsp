<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 简历基本信息开始 -->
<div class="panel panel-default">
	<form class="form-horizontal" id="resumeForms" style="margin-top: 35px;">
		<div class="row">
			<div class="col-sm-12 column">
				<div class="form-group">
					<label class="control-label col-sm-2">岗位类别:</label>
					<div class="col-sm-3">
					<select class="form-control" onchange="findJob2(this.value)">
						<option>请首先选择岗位类别</option>
					<!-- 牟勇：动态添加一级岗位名称 -->
						<c:forEach items="${myJobs1 }" var="job1">
							<option value="${job1.id }">${job1.jobName }</option>
						</c:forEach>
					</select>
					</div>
					<label class="control-label col-sm-2">应聘职位:</label>
				<div class="col-sm-3">
				<select class="form-control" id="job2" name="resumeTitle">
					<option value="resume_update.resumeTitle">${resume_update.resumeTitle}</option>
				</select>
				</div>
				</div>
			</div>
		</div>
		<!-- 牟勇：莫名其妙的头像显示 -->
		<!-- <div class="col-md-2 column">
			<img src="img/head.gif" class="center-block" width="100" height="120" />
		</div> -->
		<div class="row">
			<!-- 基本信息左侧 -->
			<div class="col-md-6 column">
				<div class="form-group">
					<label for="resumeName" class="col-md-4 control-label">姓名：</label>
					<div class="col-md-8">
						<input class="form-control" name="resumeName" id="resumeName" value="${resume_update.resumeName}" />
					</div>
				</div>
				<div class="form-group">
					<label for="resumeBirthday" class="col-md-4 control-label">出生日期：</label>
					<div class="col-md-8">
						<input value="<fmt:formatDate value="${resume_update.resumeBirthday }" pattern="yyyy-MM-dd" />" class="form-control form_datetime" placeholder="请选择日期" name="resumeBirthday" id="resumeBirthday" readonly />
					</div>
				</div>
				<div class="form-group">
					<label for="resumePhone" class="col-md-4 control-label">手机：</label>
					<div class="col-md-8">
						<input value="${resume_update.resumePhone }" class="form-control" name="resumePhone" id="resumePhone" />
					</div>
				</div>
				<div class="form-group">
					<label for="resumeEmail" class="col-md-4 control-label">邮箱：</label>
					<div class="col-md-8">
						<input value="${resume_update.resumeEmail }" class="form-control" name="resumeEmail" id="resumeEmail" />
					</div>
				</div>
			</div>
			<!-- 基本信息左侧结束 -->
			<!-- 基本信息右侧 -->
			<div class="col-md-5 column">
				<div class="form-group">
					<label for="resumeGender" class="col-md-4 control-label">性别：</label>
					<div class="col-md-8">
						<div class="col-md-6 radio">
							<input type="radio" name="resumeGender" id="resumeGender" value="1" ${resume_update.resumeGender==1?"checked=\"checked\"":"" }>
							<label>男</label>
						</div>
						<div class="col-md-6 radio">
							<input type="radio" name="resumeGender" id="resumeGender" value="0" ${resume_update.resumeGender==0?"checked=\"checked\"":"" }>
							<label>女</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="resumeWorks" class="col-md-4 control-label">开始工作时间：</label>
					<div class="col-md-8">
						<input value="<fmt:formatDate value="${resume_update.resumeWorks }" pattern="yyyy-MM" />" placeholder="请选择日期" class="form-control" name="resumeWorks" id="resumeWorks" readonly />
					</div>
				</div>
				<div class="form-group">
					<label for="resumeNowResidence" class="col-md-4 control-label">居住地：</label>
					<div class="col-md-8">
						<input value="${resume_update.resumeNowResidence }" class="form-control" name="resumeNowResidence" id="resumeNowResidence" />
					</div>
				</div>
				<div class="form-group">
					<label for="resumeJor" class="col-md-4 control-label">目前岗位：</label>
					<div class="col-md-8">
						<input value="${resume_update.resumeJor }" class="form-control" name="resumeJor" id="resumeJor" />
					</div>
				</div>

			</div>
			<!-- 基本信息右侧结束 -->
		</div>
		<div class="panel-group">
			<div class="panel-heading">
				<a class="panel-title col-md-offset-10" data-toggle="collapse" data-parent="#panel" href="#panel-element-more">
					更多展开 <span class="glyphicon glyphicon-chevron-down"></span>
				</a>
			</div>
			<div id="panel-element-more" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="col-md-6 column" style="margin-top: 35px;">
						<div class="form-group">
							<label for="resumeQQ" class="col-md-4 control-label">QQ/微信：</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeQQ }" class="form-control" name="resumeQQ" id="resumeQQ" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeNation" class="col-md-4 control-label">民族：</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeNation }" class="form-control" name="resumeNation" id="resumeNation" data-provide="typeahead" autocomplete="off" />
							</div>
						</div>
						<script type="text/javascript">
							//民族的自动完成特效
							myAutoComplete('findAllNationName', '#resumeNation');
						</script>
						<div class="form-group">
							<label for="resumePlace" class="col-md-4 control-label">籍贯：</label>
							<div class="col-md-8">
								<input value="${resume_update.resumePlace }" class="form-control" name="resumePlace" id="resumePlace" data-provide="typeahead" autocomplete="off" />
							</div>
						</div>
						<script type="text/javascript">
							//省份的自动完成特效
							myAutoComplete('findAllProvinceName', '#resumePlace');
						</script>
						<div class="form-group">
							<label for="resumeHouseAddress" class="col-md-4 control-label">住址：</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeHouseAddress }" class="form-control" name="resumeHouseAddress" id="resumeHouseAddress" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeFLType" class="col-md-4 control-label">外语类型：</label>
							<div class="col-md-8">
								<select name="resumeFLType" id="resumeFLType" class="form-control">
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
							<label for="resumeGraduationSchool" class="col-md-4 control-label">毕业学校：</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeGraduationSchool }" class="form-control" name="resumeGraduationSchool" id="resumeGraduationSchool" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeHeight" class="col-md-4 control-label">身高</label>
							<div class="col-md-7 input-group">
								<input value="${resume_update.resumeHeight }" class="form-control" name="resumeHeight" id="resumeHeight" />
								<span class="input-group-addon">（厘米）</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 column" style="margin-top: 35px;">
						<div class="form-group">
							<label for="resumeEducation" class="col-md-4 control-label">最高学历：</label>
							<div class="col-md-8">
								<select class="form-control" id="resumeEducation" name="resumeEducation">
									<option value="博士后">博士后</option>
									<option value="博士">博士</option>
									<option value="硕士">硕士</option>
									<option value="大学本科">大学本科</option>
									<option value="大学专科">大学专科</option>
									<option value="高中">高中</option>
									<option value="其他">其他</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeWages" class="col-md-4 control-label">期望月薪：</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeWages }" class="form-control" name="resumeWages" id="resumeWages" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeMajor" class="col-md-4 control-label">专业：</label>
							<div class="col-md-8">
								<input value="${resume_update.resumeMajor }" class="form-control" name="resumeMajor" id="resumeMajor" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeGraduationTime" class="col-md-4 control-label">毕业时间：</label>
							<div class="col-md-8">
								<input value="<fmt:formatDate value="${resume_update.resumeGraduationTime}" pattern="yyyy-MM-dd" />" class="form-control form_datetime" placeholder="请选择日期" name="resumeGraduationTime" id="resumeGraduationTime" readonly />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeFLAbility" class="col-md-4 control-label">外语水平：</label>
							<div class="col-md-8">
								<select name="resumeFLAbility" id="resumeFLAbility" class="form-control">
									<option value="0" selected="selected">--未选择--</option>
									<option value="1">入门</option>
									<option value="2">一般</option>
									<option value="3">熟练</option>
									<option value="4">精通</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeMarriage" class="col-md-4 control-label">婚姻状况：</label>
							<div class="col-md-8">
								<div class="col-md-6 radio">
									<input type="radio" name="resumeMarriage" id="resumeMarriage" value="0" ${resume_update.resumeMarriage==0?"checked=\"checked\"":"" } >
									<label>未婚</label>
								</div>
								<div class="col-md-6 radio">
									<input type="radio" name="resumeMarriage" id="resumeMarriage" value="1" ${resume_update.resumeMarriage==1?"checked=\"checked\"":"" } >
									<label>已婚</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeWeight" class="col-md-4 control-label">体重：</label>
							<div class="col-md-7 input-group">
								<input value="${resume_update.resumeWeight }"
									class="form-control" name="resumeWeight" id="resumeWeight" />
								<span class="input-group-addon">（公斤）</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 个人评价 -->
				<div class="col-md-12 column">
					<div class="form-group">
						<label for="resumeSelfEvaluation" class="col-md-2 control-label">个人评价</label>
						<div class="col-md-10">
							<textarea style="resize: none;" class="form-control"
								name="resumeSelfEvaluation" id="resumeSelfEvaluation">${resume_update.resumeSelfEvaluation }</textarea>
						</div>
						<script type="text/javascript">
						    $(document).ready(function(){  
						    		CKEDITOR.replace('resumeSelfEvaluation',{
						    		    filebrowserImageUploadUrl: '../../ckeditor/upload?Type=Images'
						    		}); 
						    });
					    </script>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-5 col-md-12">
				<input type="button"
					onclick="ajaxUpdateResume('personal/user/personal_index_myResume')"
					class="btn btn-success" value="保存" />
			</div>
		</div>
	</form>
	<div class="panel-footer"></div>
</div>
<!-- 简历基本信息结束 -->
<script type="text/javascript">
	//ajax提交表单
	var ajaxUpdateResume = function(page) {
		var resumeForm = new FormData(document.getElementById("resumeForms"));
		$.ajax({
			url : "personal/resume/updateResume?page=" + page,
			data : resumeForm,
			type : "post",
			dataType : "html",
			processData : false,
			contentType : false,
			success : function(data) {
				$("#my-content").html(data);
			}
		});
	}
	//牟勇：js的初始化
	$(function() {
		//牟勇：为下拉列表框填充默认值（是个聪明的办法,否则要写一大堆判断语句）
		$("#resumeFLAbility").val("${resume_update.resumeFLAbility}");
		$("#resumeFLType").val("${resume_update.resumeFLType}");
		$("#resumeEnglishGrade").val("${resume_update.resumeEnglishGrade}");
		$("#resumeComputerAbility").val("${resume_update.resumeComputerAbility}");
		$("#resumeEducation").val("${resume_update.resumeEducation}");
		
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
					$("#resumeBirthday").datetimepicker("setEndDate",
							$("#resumeWorks").val())
				}).on('hide',function(e) {  
	                $('#resumeForms').data('bootstrapValidator')  
                    .updateStatus('resumeBirthday', 'NOT_VALIDATED',null)  
                    .validateField('resumeBirthday');  
            });

		$("#resumeWorks").datetimepicker({
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
					$("#resumeWorks").datetimepicker("setStartDate",
							$("#resumeBirthday").val())
				}).on('hide',function(e) {  
	                $('#resumeForms').data('bootstrapValidator')  
                    .updateStatus('resumeWorks', 'NOT_VALIDATED',null)  
                    .validateField('resumeWorks');  
            });

		$("#resumeGraduationTime").datetimepicker({
			format : 'yyyy-mm',
			language : 'zh-CN',
			startDate : '1900-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView : 3,
			startView:3
		}).on('hide',function(e) {  
            $('#resumeForms').data('bootstrapValidator')  
            .updateStatus('resumeGraduationTime', 'NOT_VALIDATED',null)  
            .validateField('resumeGraduationTime');  
    });

		$("#resumeForms").bootstrapValidator({
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
							message : '标题不能超过50个字符'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请正确输入的标题"
						}

					}
				},
				resumeName : {
					verbose : false, //多验证的情况下默认第一验证错误，则提示当前错误信息后面的验证不执行
					validators : {
						notEmpty : {
							message : '姓名不能为空'
						},
						stringLength : {
							min : 2,
							max : 10,
							message : '名字长度应该在2-10个字符之间'
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
							message : '工作年限应该是整数'
						}
					}
				},
				resumeWages : {
					validators : {
						regexp : {
							regexp : /^[0-9]+$/,
							message : '薪水应该是整数，不要有小数点'
						}
					}
				},
				resumeJor : {
					validators : {
						notEmpty : {
							message : '目前岗位不能为空'
						}
					}
				},
				resumeNation : {
					validators : {
						stringLength : {
							min : 0,
							max : 10,
							message : '请选择计算机提供的民族选项'
						},
						regexp : {
							regexp : (/[\u4e00-\u9fa5]/),
							message : "请选择计算机提供的民族选项"
						}

					}
				},
				resumePlace : {
					validators : {
						stringLength : {
							min : 0,
							max : 50,
							message : '籍贯长度不应超过50个字符'
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
				resumeGraduationSchool : {
					validators : {
						stringLength : {
							min : 0,
							max : 50,
							message : '毕业学校名称不要超过50个字符，可尝试简称'
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
							message : '专业名称不要超过20个字符，可尝试简称'
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
							message : '电话号码不应短于7位，不要超过11位'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '电话号码应全是数字'
						}

					}
				},
				resumeQQ : {
					validators : {
						stringLength : {
							min : 6,
							message : 'QQ或微信应不短于6个字符'
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
							message : '请输入正确的身高，以厘米为单位'
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
							message : '请输入正确的体重，以公斤为单位'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '体重应该是整数'
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
				}
			}
		});
	});
</script>