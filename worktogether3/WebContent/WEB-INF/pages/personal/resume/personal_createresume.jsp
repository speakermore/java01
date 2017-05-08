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
	<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
	<script type="text/javascript">
	$("#resumeHeadImg").fileinput({'language': 'zh','showUpload':false, 'previewFileType':'any'});      
	$(function(){
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
		$('input').each(function() {
			var self = $(this), label = self.next(), label_text = label.text();
			label.remove();
			self.iCheck({
				checkboxClass : 'icheckbox_line-orange',
				radioClass : 'iradio_line-orange',
				insert : '<div class="icheck_line-icon"></div>' + label_text
			});
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
						notEmpty : {
							message : '标题不能为空'
						},
						stringLength: {
                            min: 2,
                            max: 50,
                            message: '标题长度必须在2到50位之间'
                        },
                        regexp: {
                        	regexp: (/[\u4e00-\u9fa5]/),
                        	message: "请输入中文名字"
                    	}

					}
				},
				resumeHeadImg:{
					validators : {
						notEmpty : {
							message : '头像不能为空'
						}
					}
				},
				resumeName:{
					validators : {
						notEmpty : {
							message : '姓名不能为空'
						},
						stringLength: {
                            min: 2,
                            max: 10,
                            message: '姓名长度必须在2到10位之间'
                        },
                        regexp: {
                        	regexp: (/[\u4e00-\u9fa5]/),
                        	message: "请输入中文名字"
                    	}

					}
				},
				resumeWages:{
					validators : {
						notEmpty : {
							message : '薪资不能为空'
						},
						regexp: {
                            regexp: /^[0-9]+$/,
                            message: '请输入数字'
                        }
					}
				},
				resumeJor:{
					validators : {
						notEmpty : {
							message : '意向不能为空'
						},
						stringLength: {
                            min: 2,
                            max: 8,
                            message: '意向长度必须在2到45位之间'
                        }
					}
				},
				resumeNation:{
					validators : {
						notEmpty : {
							message : '民族不能为空'
						},
						stringLength: {
                            min: 1,
                            max: 10,
                            message: '民族长度必须在1到10位之间'
                        },
                        regexp: {
                        	regexp: (/[\u4e00-\u9fa5]/),
                        	message: "请输入中文名字"
                    	}

					}
				},
				resumePlace:{
					validators : {
						notEmpty : {
							message : '籍贯不能为空'
						},
						stringLength: {
                            min: 1,
                            max: 50,
                            message: '籍贯长度必须在1到50位之间'
                        },
                        regexp: {
                        	regexp: (/[\u4e00-\u9fa5]/),
                        	message: "请输入中文名字"
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
				resumeEducation:{
					validators : {
						notEmpty : {
							message : '学历不能为空'
						},
						stringLength: {
                            min: 1,
                            max: 20,
                            message: '学历长度必须在1到20位之间'
                        },
                        regexp: {
                        	regexp: (/[\u4e00-\u9fa5]/),
                        	message: "请输入中文名字"
                    	}

					}
				},
				resumeGraduationSchool:{
					validators : {
						notEmpty : {
							message : '毕业学校不能为空'
						},
						stringLength: {
                            min: 1,
                            max: 50,
                            message: '毕业学校长度必须在1到50位之间'
                        },
                        regexp: {
                        	regexp: (/[\u4e00-\u9fa5]/),
                        	message: "请输入中文名字"
                    	}

					}
				},
				resumeMajor:{
					validators : {
						notEmpty : {
							message : '专业不能为空'
						},
						stringLength: {
                            min: 1,
                            max: 20,
                            message: '专业长度必须在1到20位之间'
                        },
                        regexp: {
                        	regexp: (/[\u4e00-\u9fa5]/),
                        	message: "请输入中文名字"
                    	}

					}
				},
				resumePhone:{
					validators : {
						notEmpty : {
							message : '电话号码不能为空'
						},
						stringLength: {
                            min: 7,
                            max: 11,
                            message: '电话号码长度必须在11到11位之间'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '请输入正确的电话号码'
                        }

					}
				},
				resumeQQ:{
					validators : {
						notEmpty : {
							message : 'QQ或微信不能为空'
						},
						stringLength: {
                            min: 6,
                            max: 11,
                            message: 'QQ或微信长度必须在6到20位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_-]+$/,
                            message: '请输入正确的电话号码！'
                        }

					}
				},
				resumeHeight:{
					validators : {
						notEmpty : {
							message : '身高不能为空'
						},
						stringLength: {
                            min: 2,
                            max: 3,
                            message: '身高必须在2到3位之间'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '请输入正确的身高数！'
                        }

					}
				},
				resumeWeight:{
					validators : {
						notEmpty : {
							message : '体重不能为空'
						},
						stringLength: {
                            min: 2,
                            max: 3,
                            message: '体重必须在2到3位之间'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '请输入正确的体重数！'
                        }

					}
				},
				resumePersonality:{
					validators : {
						notEmpty : {
							message : '特点描述不能为空'
						},
						stringLength: {
                            min:10,
                            max: 50,
                            message: '特点描述必须在10到50位之间'
                        }
					}
				},
				resumeSelfEvaluation:{
					validators : {
						notEmpty : {
							message : '自我评价不能为空'
						},
						stringLength: {
                            min:10,
                            max: 500,
                            message: '自我评价必须在10到500位之间'
                        }
					}
				},
				resumeEnglishGrade:{
					validators : {
						notEmpty : {
							message : '英语等级不能为空'
						}
					}
				},
				resumeFLType:{
					validators : {
						notEmpty : {
							message : '外语类型不能为空'
						}
					}
				},
				resumeFLAbility:{
					validators : {
						notEmpty : {
							message : '外语水平不能为空'
						}
					}
				},
				resumeComputerAbility:{
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

</body>
</html>