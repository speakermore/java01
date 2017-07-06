<%@ page language="java" import="ynjh.common.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="MARRY" value="${CommonStatus.MARRY}"></c:set>
<c:set var="SEX" value="${CommonStatus.SEX}"></c:set>
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
<c:if test="${works!=null}">
	<!-- 工作详细 -->
	<c:forEach items="${works}" var="work">
		<div class="panel-body test personal_resume_defualt">
			<small class="col-md-offset-10">(${AUDIT_STATUS[work.resumeType]})</small>
			<div class="col-md-12 column">
				<label class="control-label">企业名称：</label>${work.workFirmName}
			</div>
			<div class="col-md-12 column">
				<label class="control-label">工作岗位：</label>${work.workUnit}
			</div>
			<div class="col-md-12 column">
				<label class="control-label">工作描述：</label>${work.workDescription}
			</div>
			<div class="col-md-12 column">
				<label class="control-label">工作时间：</label>
				<fmt:formatDate value="${work.workBeginTime}" pattern="yyyy-MM" />
				到
				<fmt:formatDate value="${work.workEndTime}" pattern="yyyy-MM" />
			</div>
			<div class="col-md-offset-10 column">
				<a id="modal-work" href="#modal-container-work${work.id}" role="button"
					data-toggle="modal"><span class="glyphicon glyphicon-cog"></span></a>|<a
					href="javascript:ajaxDeleteWork('personal/user/personal_index_myResume',${work.id})"><span
					class="glyphicon glyphicon-trash"></span></a>


				<!-- 模态框 -->
				<div  class="modal fade" id="modal-container-work${work.id}" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true"
					data-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">
									<span class="glyphicon glyphicon-list-alt"></span>编辑工作经验
								</h4>
							</div>
							<div class="modal-footer">
								<form id="updateWorkForm${work.id}" class="form-horizontal col-md-12 ">
									<input type="hidden" name="id" value="${work.id}" />
									<input type="hidden" name="page" value="personal/resume/personal_resume_work" />
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">企业名称：</label>
										<div class="col-md-8 column">
											<input class="form-control" type="text"
												value="${work.workFirmName}" name="workFirmName" />
										</div>
									</div>
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">工作岗位：</label>
										<div class="col-md-8 column">
											<input class="form-control" type="text"
												value="${work.workUnit}" name="workUnit" />
										</div>
									</div>
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">工作描述： </label>
										<div class="col-md-8 column">
											<textarea style="resize: none;" class="form-control"
												name="workDescription">${work.workDescription}</textarea>
										</div>
									</div>
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">工作时间：</label>
										<div class="col-md-4 workStart">
											<input name="workBeginTime" size="30" type="text"
												id="workStart" readonly
												value="<fmt:formatDate
						value="${work.workBeginTime}" pattern="yyyy-MM" />"
												class="form_datetime form-control" placeholder="请选择开始工作年月">
										</div>
										<div class="col-md-4 column ">
											<input name="workEndTime" size="30" type="text"
												value="<fmt:formatDate
						value="${work.workEndTime}" pattern="yyyy-MM" />"
												id="workEnd" readonly class="form_datetime form-control"
												placeholder="请选择结束工作年月">
										</div>
									</div>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button data-dismiss="modal" onclick="updateWorkFormAjax('personal/resume/personal_resume_work','${work.id}')"
										class="btn btn-primary">保存</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 模态框结束 -->
			</div>
		</div>
	</c:forEach>
	<!-- 项目详细结束 -->
</c:if>
<div id="panel-element-work-show" class="panel-collapse in">
	<c:if test="${works==null}">
		<div class="panel-body col-md-offset-3 personal_resume_padding">
			<span class="glyphicon glyphicon-list-alt"></span>
			完善工作经验，展现工作内容及能力，让HR更了解你！
		</div>
	</c:if>
</div>
<script type="text/javascript">
	var updateWorkFormAjax = function(page, id) {
		$('#modal-container-work'+id).modal('hide');
		var updateWorkForm = new FormData(document
				.getElementById("updateWorkForm"+id));
		$.ajax({
			url : "personal/resume/updateWork",
			data : updateWorkForm,
			dataType : "html",
			type : "post",
			processData : false,
			success : function(data) {
				$("#workFresh").html(data);
			},
			error:function(){
				alert("error:修改失败！");
			}
		});
	}
</script>