<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-12">
	<div class="panel panel-default">
	<div class="panel-heading">
			<h2 class="panel-title">${cmpr.cmpRecTitle }信息修改</h2>
	</div>
	<div class="panel-body">
	<form role="form" class="form-horizontal" method="post" action="company/cmprs/update" id="update-recruit">
		<!-- 招聘id -->
		<input type="hidden" name="id" value="${cmpr.id }">
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
				<option value="没有选择">请首先选择岗位类别</option>
				<option value="${cmpr.cmpRecTitle }" selected="selected">${cmpr.cmpRecTitle }</option>
			</select>
			</div>
		</div>
		<!-- 岗位选择结束 -->
		<!-- 需求人数 -->
		<div class="form-group">
			<label class="control-label col-sm-2">需求人数:</label>
			<div class="col-sm-4">
				<input name="cmpRecPeople" class="form-control" value="${cmpr.cmpRecPeople}" />
			</div>
			<label class="control-label col-sm-2">工作城市</label>
			<div class="col-sm-4">
				<input name="cmpRecCity" class="form-control" value="${cmpr.cmpRecCity }" />
			</div>
		</div>
		<!-- 需求人数结束 -->
		<!-- 招聘薪资和学历要求 -->
		<div class="form-group">
			<label class="control-label col-sm-2">月薪:</label>
			<div class="col-sm-10">
				<input class="form-control" name="cmpRecWage" value="${cmpr.cmpRecWage}" />
			</div>
		</div>
		<!-- 招聘薪资和学历要求结束 -->
		<!-- 岗位职责及技能要求描述 -->
		<div class="form-group">
			<label class="control-label col-sm-3">岗位职责及技能要求描述:</label>
			<div class="col-sm-12">
				<textarea class="ckeditor form-control" name="cmpRecExperience">
					${cmpr.cmpRecExperience}
				</textarea>
			</div>
			<script type="text/javascript">
			CKEDITOR.replace('cmpRecExperience');
			</script>
		</div>
		<!-- 岗位职责及技能要求描述结束 -->
		<div class="form-group">
			<div class="col-sm-2 col-sm-offset-1">
				<a role="button" class="btn btn-default form-control" href="javascript:ajaxPage('company/cmprs/recruit_index')">返回</a>
			</div>
			<div class="col-sm-2 col-sm-offset-5">
				<button type="submit" class="btn btn-primary form-control">提交修改</button>
			</div>
		</div>
	</form>
	</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('#update-recruit').bootstrapValidator({
			message: '这个值不合适',
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
				            message: '人数应该都是数字'
				    }
        			}
			},cmpRecWage:{
				validators: {
		    			notEmpty: {/*非空提示*/
		                    message: '月薪不能为空'
		            }
				}
			},cmpRecExperience:{
				validators: {
		    			notEmpty: {/*非空提示*/
		                    message: '招聘详情不能为空'
		           	}
				}
			},cmpRecCity:{
				validators: {
	    			notEmpty: {/*非空提示*/
	                    message: '工作城市不能为空'
	           	}
			}
		}
        		}
		});
	});
	</script>
</html>
