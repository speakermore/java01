<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>个人用户-查看简历</title>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
<%@include file="/WEB-INF/pages/nav.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
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
							file="/WEB-INF/pages/personal/resume/personal_lookresume_index.jsp"%>
					</div>
					<%-- <div class="col-md-4 column ">
						<%@include file="/WEB-INF/pages/personal/common/user_right.jsp"%>
					</div> --%>
					<div class="col-md-1 column"></div>
				</div>
			</div>
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

		$(function(){
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
</body>
</html>