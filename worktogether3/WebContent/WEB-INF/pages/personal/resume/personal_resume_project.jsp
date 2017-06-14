<%@ page language="java" import="ynjh.common.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="MARRY" value="${CommonStatus.MARRY}"></c:set>
<c:set var="SEX" value="${CommonStatus.SEX}"></c:set>
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
<c:if test="${projs!=null}">
	<!-- 项目详细 -->
	<c:forEach items="${projs}" var="pro">
		<div class="panel-body test personal_resume_defualt">
			<small class="col-md-offset-10">(${AUDIT_STATUS[pro.resumeType]})</small>
			<div class="col-md-12 column">
				<label class="control-label">项目名称：</label>${pro.projectName}
			</div>
			<div class="col-md-12 column">
				<label class="control-label">项目岗位：</label>${pro.projectJob}
			</div>
			<div class="col-md-12 column">
				<label class="control-label">项目描述：</label>${pro.projectDescription}
			</div>
			<div class="col-md-12 column">
				<label class="control-label">项目时间：</label>
				<fmt:formatDate value="${pro.projectBeginTime}" pattern="yyyy-MM-dd" />
				到
				<fmt:formatDate value="${pro.projectEndTime}" pattern="yyyy-MM-dd" />
			</div>
			<div class="col-md-offset-10 column">
				<a id="modal-project${pro.id}"
					href="#modal-container-project${pro.id}" role="button"
					data-toggle="modal"><span class="glyphicon glyphicon-cog"></span></a>|<a
					href="javascript:ajaxDeleteProject('personal/user/personal_index_myResume',${pro.id})"><span
					class="glyphicon glyphicon-trash"></span></a>
				<!-- 模态框 -->
				<div class="modal fade" id="modal-container-project${pro.id}"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
					data-backdrop="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">
									<span class="glyphicon glyphicon-signal"></span>编辑项目经验
								</h4>
							</div>
							<div class="modal-footer">
								<form id="updateProjectForm${pro.id}"
									class="form-horizontal col-md-12 ">
									<input type="hidden" name="id" value="${pro.id}" />
									<input type="hidden" name="page" value="personal/resume/personal_resume_project" />
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">项目名称：</label>
										<div class="col-md-8 column">
											<input class="form-control" type="text"
												value="${pro.projectName}" name="projectName" />
										</div>
									</div>
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">项目岗位：</label>
										<div class="col-md-8 column">
											<input class="form-control" type="text"
												value="${pro.projectJob}" name="projectJob" />
										</div>
									</div>
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">项目描述： </label>
										<div class="col-md-8 column">
											<textarea style="resize: none;" class="form-control"
												name="projectDescription">${pro.projectDescription}</textarea>
										</div>
									</div>
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">项目时间：</label>
										<div class="col-md-4 column">
											<input name="projectBeginTime" size="30" type="text"
												id="datetimeStart2" readonly
												value="<fmt:formatDate
						value="${pro.projectBeginTime}" pattern="yyyy-MM-dd" />"
												class="form_datetime form-control" placeholder="请选择日期">
										</div>
										<div class="col-md-4 column ">
											<input name="projectEndTime" size="30" type="text"
												value="<fmt:formatDate
						value="${pro.projectEndTime}" pattern="yyyy-MM-dd" />"
												id="datetimeEnd2" readonly class="form_datetime form-control"
												placeholder="请选择日期">
										</div>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button id="closeUpdateProject${pro.id}"
											onclick="updateProjectFormAjax(${pro.id})"
											class="btn btn-primary" data-dismiss="modal">保存</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 模态框关闭 -->
			</div>
		</div>
		<!-- lzh：当在循环中使用模态框提交表单时，需要配置每个模态各自的id和表单的id 
			当使用EL表达是传递int变量时，如果后面有空格则传递的数据会出错-->
	</c:forEach>
	<!-- 项目详细结束 -->
</c:if>
<div id="panel-element-project-show" class="panel-collapse in">
	<c:if test="${projs==null}">
		<div class="panel-body col-md-offset-3 personal_resume_padding">
			<span class="glyphicon glyphicon-signal"></span>
			完善项目经验，展现社会工作能力，让HR更了解你！
		</div>
	</c:if>
</div>
<script type="text/javascript">
	var updateProjectFormAjax = function(id) {
		/* $("#modal-container-project"+id).modal('toggle'); */
		var updateProjectForm = new FormData(document
				.getElementById("updateProjectForm" + id));
		$.ajax({
			url : "personal/resume/updateProject",
			data : updateProjectForm, //传递的参数
			dataType : "html", //返回值类型
			type : "post",
			 processData : false, //ajax提交表单必须写
			contentType : false, //ajax提交表单必须写 
			success : function(data) {
				/* $("#modal-container-project"+id).modal('hide'); */
				alert("修改成功！");
				//$("#modal-container-project").remove(); 
				$("#projectFresh").html(data);
			},
			error:function(){
				alert("修改失败！");
			}
		});
	}
</script>
<%-- <a id="modal-education" href="#modal-container-education" role="button"
	class="btn" data-toggle="modal">添加项目记录</a>
<div class="modal fade" id="modal-container-education" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="personal/resume/CreateProject"
				class="form-horizontal" method="post" id="projectForm">
				<input type="hidden" name="resumeId" value="${resume.id }" /><br/>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加项目记录</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label for="projectName" class="col-md-3 control-label">项目名称：</label>
						<div class="col-md-8">
							<input class="form-control" name="projectName"
								id="projectName" />
						</div>
					</div>
					<div class="form-group">
						<label for="projectJob" class="col-md-3 control-label">项目岗位：</label>
						<div class="col-md-8">
							<input class="form-control" name="projectJob"
								id="projectJob" />
						</div>
					</div>
					<div class="form-group">
						<label for="projectDescription" class="col-md-3 control-label">项目描述：</label>
						<div class="col-md-8">
							<textarea class="form-control" name="projectMakeDescription"
								id="projectDescription" /></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">日期：</label>
						<div class="col-md-4">
							<input class="form-control" name="projectBeginTime" size="30"
								type="text" id="datetimeStart2" readonly class="form_datetime"
								placeholder="请选择起始日期" />
						</div>
						<div class="col-md-4">
							<input class="form-control" name="projectEndTime" size="30"
								type="text" id="datetimeEnd2" readonly class="form_datetime"
								placeholder="请选择结束日期" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-success">保存</button>
				</div>
			</form>
		</div>
	</div>
</div> --%>