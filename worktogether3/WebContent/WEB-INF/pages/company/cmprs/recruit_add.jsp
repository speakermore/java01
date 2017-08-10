<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-12">
	<form role="form" class="form-horizontal" method="post" action="company/cmprs/recruit_add" id="addCompanyRecruit">
		<!-- 岗位选择 -->
		<div class="form-group">
			<label class="control-label col-sm-2">岗位类别:</label>
			<div class="col-sm-4">
			<select onchange="findJob2(this.value)" id="job1" class="form-control">
				<option value="-1">请选择</option>
				 <c:forEach items="${myJobs1}" var="b1">
					<option value="${b1.id}">${b1.jobName }</option>
				</c:forEach>
			</select>
			</div>
			<label class="control-label col-sm-2">招聘岗位:</label>
			<div class="col-sm-4">
			<select class="form-control" id="job2" name="cmpRecTitle">
				<option>请首先选择岗位类别</option>
			</select>
			</div>
		</div>
		<!-- 岗位选择结束 -->
		<!-- 需求人数 -->
		<div class="form-group">
			<label class="control-label col-sm-2">需求人数:</label>
			<div class="col-sm-4">
				<input name="cmpRecPeople" class="form-control" />
			</div>
			<label class="control-label col-sm-2">工作城市</label>
			<div class="col-sm-4">
				<input name="cmpRecCity" class="form-control" />
			</div>
		</div>
		<!-- 需求人数结束 -->
		<!-- 招聘薪资和学历要求 -->
		<div class="form-group">
			<label class="control-label col-sm-2">月薪:</label>
			<div class="col-sm-10">
				<input class="form-control" name="cmpRecWage" />
			</div>
		</div>
		<!-- 招聘薪资和学历要求结束 -->
		<!-- 工作所需技能及水平描述 -->
		<div class="form-group">
			<label class="control-label col-sm-3">岗位职责及技能要求描述:</label>
			<div class="col-sm-12">
				<textarea class="ckeditor form-control" name="cmpRecExperience" cols="20" rows="2" maxlength="500">
					<p><b>岗位职责：</b></p>
					<br />
					<br />
					<br />
					<p><b>技能要求：</b></p>
					<br />
					<br />
					<br />
				</textarea>
			</div>
			<script type="text/javascript">
			CKEDITOR.replace('cmpRecExperience');
			</script>
		</div>
		<!-- 工作所需技能及水平描述结束 -->
		<div class="form-group">
			<div class="col-sm-9 col-sm-offset-3">
				<button type="submit" class="btn btn-primary">提交招聘信息</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('#addCompanyRecruit').bootstrapValidator({
			message: '这个值不可用',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
			cmpRecPeople:{
				validators: {
        			notEmpty: {/*非空提示*/
                        message: '需求人数不能为空'
                    },
					regexp: {//匹配规则
			        	regexp: /^[0-9]*$/,
			            message: '需求人数为纯数字'
			        }
        		}
			},cmpRecWage:{
			validators: {
    			notEmpty: {/*非空提示*/
                    message: '薪资不能为空'
                }
		}
		},cmpRecTitle:{
			validators: {
				notEmpty: {/*非空提示*/
					message: '招聘标题不能为空'
				}
			}
		},cmpRecExperience:{
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