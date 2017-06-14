<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业注册</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<%@include file="/WEB-INF/pages/company/footer.jsp"%>

</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-sm-3 column">
				<%@include file="/WEB-INF/pages/company/menu.jsp"%>
			</div>
			<div class="col-sm-6 column">
			<h3>详细资料修改</h3>
			<hr/>
				<form action="company/company/updateInt" method="post"
					id="updateIntCompany" class="form-horizontal">
					<div class="form-group">
					<div class="col-sm-3">公司性质：</div>
					<div class="col-sm-9">
						<select name="cmpIntQuality" class="form-control">
							<option value="1">政府机构</option>
							<option value="2">国有企业</option>
							<option value="3">民营企业</option>
							<option value="4">其他</option>
						</select>
					</div>
					</div>
					<div class="form-group">
					<div class="col-sm-3">公司规模：</div>
					<div class="col-sm-9">
						<select name="cmpIntPeopleNum" class="form-control">
							<option value="1">20人以下</option>
							<option value="2">50人</option>
							<option value="3">80人</option>
							<option value="4">100人</option>
							<option value="5">150人</option>
							<option value="6">200人</option>
							<option value="7">200人以上</option>
						</select>
					</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-3">公司福利:</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								name="cmpIntComforts" value=${companyInt.cmpIntComforts }>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-3">公司休息制度:</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								name="cmpIntRest"
								value=${companyInt.cmpIntRest }>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-3">公司保险制度:</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								name="cmpIntInsurance"
								value=${companyInt.cmpIntInsurance }>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-3">职业薪资:</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								name="cmpIntWage"
								value=${companyInt.cmpIntWage }>
						</div>
					</div>
					
					<div class="form-group">
					 	<div class="col-sm-3">公司地址：</div>
					 <div class="col-sm-9"><input type="text" class="form-control" name="companyAddress" value=${user.companyAddress } >
					</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-3">公司简介:</div>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								name="cmpIntroduction"
								value=${companyInt.cmpIntroduction }>
						</div>
					</div>
					
					<div class="col-sm-3">
						<button type="submit" class="form-control btn btn-success"
							style="color: black;">修改</button>
					</div>

				</form>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		/**
		 * 下面是进行插件初始化
		 * 你只需传入相应的键值对
		 * */
		$('#updateIntCompany').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {/*输入框不同状态，显示图片的样式*/
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {/*验证*/
				cmpIntComforts : {/*键名username和input name值对应*/
					validators : {
						
						stringLength : {/*长度提示*/
							min : 0,
							max : 500,
							message : '输入长度必须在6到30之间'
						}
					/*最后一个没有逗号*/
					}
				},

				cmpIntRest : {
					validators : {
						
						stringLength : {/*长度提示*/
							min :0,
							max : 30,
							message : '输入长度必须在6到30之间'
						}
					/*最后一个没有逗号*/
					}
				},
				cmpIntInsurance : {
					validators : {
						notEmpty : {
							message : '内容不能为空'
						},
						stringLength : {/*长度提示*/
							min : 0,
							max : 100,
							message : '输入长度必须在6到30之间'
						}
					/*最后一个没有逗号*/

					}
				},
				cmpIntWage : {
					validators : {
						notEmpty : {
							message : '内容不能为空'
						},
						stringLength : {/*长度提示*/
							min : 0,
							max : 30,
							message : '输入长度必须在0到10之间'
						}
					/*最后一个没有逗号*/
					}
				},
				cmpIntroduction : {
					validators : {
						notEmpty : {
							message : '内容不能为空'
						},
						stringLength : {/*长度提示*/
							min : 0,
							max : 1000,
							message : '公司简介长度最大长度在1000字以内'
						}
					/*最后一个没有逗号*/

					}
				}
			}
		});
	});
</script>


</html>