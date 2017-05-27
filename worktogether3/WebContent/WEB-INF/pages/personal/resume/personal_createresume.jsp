<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>个人用户-首页</title>
<%@include file="/WEB-INF/pages/nav.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
	<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="col-md-1 column"></div>
				<div class="col-md-10 column ">
					<div class="alert alert-success alert-dismissable">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">×</button>
						<h4>注意!</h4>
						简历写完需要审核通过后才能投递. <a href="personal/user/gotoIndex"
							class="alert-link">返回首页</a>
					</div>
					<%@include
						file="/WEB-INF/pages/personal/resume/personal_createresume_index.jsp"%>
				</div>
				<%-- <div class="col-md-4 column ">
					<%@include file="/WEB-INF/pages/personal/common/user_right.jsp"%>
				</div> --%>
				<div class="col-md-1 column"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#resumeHeadImg").fileinput({
			'language' : 'zh',
			'showUpload' : false,
			'previewFileType' : 'any'
		});
		$(function() {
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
			$("#resumeWorks").datetimepicker({
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
			/* $('input')
					.each(
							function() {
								var self = $(this), label = self.next(), label_text = label
										.text();
								label.remove();
								self
										.iCheck({
											checkboxClass : 'icheckbox_line-orange',
											radioClass : 'iradio_line-orange',
											insert : '<div class="icheck_line-icon"></div>'
													+ label_text
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
					resumeBirthday:{
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
								message : '请选择开始工作年月'
							}
						}
					},
					resumeNowResidence : {
						validators : {
							notEmpty : {
								message : '目前居住地不能为空'
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
					},resumeGraduationTime : {
						validators : {
							notEmpty : {
								message : '请选择毕业时间'
							}
						}
					},resumeHouseAddress : {
						validators : {
							notEmpty : {
								message : '请输入家庭地址'
							}
						}
					},
					resumeMarriage: {
						validators : {
							notEmpty : {
								message : '请选择婚姻状况'
							}
						}
					}
				}
			});
		});
	</script>
</body>
</html>