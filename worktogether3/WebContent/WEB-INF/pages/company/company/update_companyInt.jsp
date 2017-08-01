<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>详细资料修改</h3>
<hr/>
	<form action="company/company/updateInt" method="post" id="updateIntCompany" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-3 control-label">公司性质：</label>
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
			<label class="col-sm-3 control-label">公司规模：</label>
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
		<label class="col-sm-3 control-label">公司福利:</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" name="cmpIntComforts" value=${companyInt.cmpIntComforts }>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label">公司休息制度:</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" name="cmpIntRest" value=${companyInt.cmpIntRest }>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label">公司保险制度:</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" name="cmpIntInsurance" value=${companyInt.cmpIntInsurance }>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label">职业薪资:</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" name="cmpIntWage" value=${companyInt.cmpIntWage }>
		</div>
	</div>
	<div class="form-group">
	 	<label class="col-sm-3 control-label">公司地址：</label>
	 	<div class="col-sm-9">
	 		<input type="text" class="form-control" name="companyAddress" value=${user.companyAddress } >
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label">公司简介:</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" name="cmpIntroduction" value=${companyInt.cmpIntroduction }>
		</div>
	</div>
	<div class="col-sm-offset-5 col-sm-3">
		<button type="submit" class="form-control btn btn-success">保存</button>
	</div>
</form>
<script type="text/javascript">
$(document).ready(function() {
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
				}
			},
			cmpIntRest : {
				validators : {
					stringLength : {/*长度提示*/
						min :0,
						max : 30,
						message : '输入长度必须在6到30之间'
					}
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
				}
			}
		}
	});
});
</script>