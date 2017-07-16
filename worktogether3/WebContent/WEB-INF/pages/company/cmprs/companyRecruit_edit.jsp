<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>招聘信息修改</title>

<head>
<base href="<%=basePath%>" />
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<%@include file="/WEB-INF/pages/company/footer.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdpart/ckeditor/ckeditor.js">
</script>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-3 column">
				<%@include file="/WEB-INF/pages/company/menu.jsp"%>
			</div>
			<div class="col-md-9 column">
				<form action="
					company/cmprs/companyRecruit/updateCmpRecruit" method="post" id="updateCmpRecruit">
					<div class="page-header">
						<h2>${cmpr.cmpRecTitle }</h2>
					</div>
					<input type="hidden" name="id" value="${cmpr.id }">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>招聘薪资</th>
								<th>学历需求</th>
								<th>需求人数</th>
							</tr>
						</thead>
						<tr>
							<td><div class="form-group">
							<input type="text" class="form-control"
								name="cmpRecWage" value="${cmpr.cmpRecWage} " maxlength="20"/>
							</div></td>
							<td><div class="form-group">
							<input type="text" class="form-control"
								name="cmpRecEducation" value="${cmpr.cmpRecEducation}" maxlength="20"/>
							</div></td>
							<td><div class="form-group">
							<input type="text" class="form-control"
								name="cmpRecPeople" value="${cmpr.cmpRecPeople}" maxlength="11"/>
								</div>
							</td>
						</tr>
					</table>
					<table class="table table-striped table-hover">
						<tr>
							<th>工作所需技能及水平描述</th>
						</tr>
						<tr>
							<td>
							<div class="form-group">
							<textarea class="ckeditor" name="cmpRecExperience"
									value="${cmpr.cmpRecExperience}" cols="20" rows="2"
									maxlength="500">
									${cmpr.cmpRecExperience}
								</textarea> <script type="text/javascript">
									CKEDITOR.replace('cmpRecExperience');
								</script>
								</div>
								</td>
						</tr>
					</table>
					
					<div class="form-group">
						<div class="col-sm-9 col-sm-offset-3">
							<button type="submit" class="btn btn-primary">提交修改</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#updateCmpRecruit').bootstrapValidator({
			message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
			cmpRecPeople:{
				validators: {
        			notEmpty: {/*非空提示*/
                        message: '招聘人数不能为空'
                    },
					regexp: {//匹配规则
			        	regexp: /^[0-9]*$/,
			            message: '请输入有效的招聘人数'
			        }
        		}
			},
		cmpRecWage:{
			validators: {
    			notEmpty: {/*非空提示*/
                    message: '薪资不能为空'
                }
		}
		},
		cmpRecEducation:{
			validators: {
    			notEmpty: {/*非空提示*/
                    message: '学历不能为空'
                }
		}
		},
		cmpRecExperience:{
			validators: {
    			notEmpty: {/*非空提示*/
                    message: '招聘详情不能为空'
                }
		}
		}
        }
		});
	});
	</script>
</html>
