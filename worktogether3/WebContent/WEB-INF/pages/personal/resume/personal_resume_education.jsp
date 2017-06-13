<%@ page language="java" import="ynjh.common.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="MARRY" value="${CommonStatus.MARRY}"></c:set>
<c:set var="SEX" value="${CommonStatus.SEX}"></c:set>
<c:set var="AUDIT_STATUS" value="${CommonStatus.AUDIT_STATUS}"></c:set>
<c:if test="${edus!=null }">
	<c:forEach items="${edus }" var="edu">
		<div class="panel-body test personal_resume_defualt">
			<small class="col-md-offset-10">(${AUDIT_STATUS[edu.resumeType]})</small>
			<div class="col-md-12 column">
				<label class="control-label">学校名称：</label>${edu.educationSchool}
			</div>
			<div class="col-md-12 column">
				<label class="control-label">教育描述：</label>${edu.educationContent}
			</div>
			<div class="col-md-12 column">
				<label class="control-label">教育时间：</label>
				<fmt:formatDate value="${edu.educationBeginTime}"
					pattern="yyyy-MM-dd" />
				到
				<fmt:formatDate value="${edu.educationEndTime}" pattern="yyyy-MM-dd" />
			</div>
			
			<div class="col-md-offset-10 column">
				<a id="modal-education${edu.id}"
					href="#modal-container-education${edu.id}" role="button"
					data-toggle="modal"><span class="glyphicon glyphicon-cog"></span></a>|<a
					href="javascript:ajaxDeleteEducation('personal/user/personal_index_myResume',${edu.id})"><span
					class="glyphicon glyphicon-trash"></span></a>
				<!-- 模态框 -->
				<div class="modal fade" id="modal-container-education${edu.id}"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
					data-backdrop="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">
									<span class="glyphicon glyphicon-signal"></span>编辑教育经验
								</h4>
							</div>
							<div class="modal-footer">
								<form id="updateEducationForm${edu.id}"
									class="form-horizontal col-md-12 ">
									<input type="hidden" name="id" value="${edu.id}" /> <input
										type="hidden" name="page"
										value="personal/resume/personal_resume_education" />
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">学校名称：</label>
										<div class="col-md-8 column">
											<input class="form-control" type="text"
												value="${edu.educationSchool}" name="educationSchool" />
										</div>
									</div>
									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">教育描述：</label>
										<div class="col-md-8 column">
											<input class="form-control" type="text"
												value="${edu.educationContent}" name="educationContent" />
										</div>
									</div>

									<div class="col-md-12 column margin_bottom_AND_margin_top">
										<label class="col-md-3 control-label">教育时间：</label>
										<div class="col-md-4 column">
											<input name="educationBeginTime" size="30" type="text"
												id="datetimeStart" readonly
												value="<fmt:formatDate
						value="${edu.educationBeginTime}" pattern="yyyy-MM-dd" />"
												class="form_datetime form-control" placeholder="请选择日期">
										</div>
										<div class="col-md-4 column ">
											<input name="educationEndTime" size="30" type="text"
												value="<fmt:formatDate
						value="${edu.educationEndTime}" pattern="yyyy-MM-dd" />"
												id="datetimeEnd" readonly class="form_datetime form-control"
												placeholder="请选择日期">
										</div>
										<%-- <fmt:formatDate value="${pro.projectBeginTime }"
														pattern="yyyy-MM-dd" />
													到
													<fmt:formatDate value="${pro.projectEndTime }"
														pattern="yyyy-MM-dd" /> --%>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button onclick="updateEducationFormAjax(${edu.id})"
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
<div id="panel-element-education-show" class="panel-collapse in">
	<c:if test="${edus==null }">
		<div class="panel-body col-md-offset-3 personal_resume_padding">
			<span class="glyphicon glyphicon-book"></span> 完善教育经历，展现专业能力，让HR更了解你！
		</div>
	</c:if>
</div>
<script type="text/javascript">
/* $('#myModal').on('hidden.bs.modal', function() {
			
			}); */
			
	
	var updateEducationFormAjax = function(id) {
		/* $("#modal-container-project"+id).modal('toggle'); */
		var updateEducationForm = new FormData(document
				.getElementById("updateEducationForm" + id));
		$.ajax({
			url : "personal/resume/updateEducation",
			data : updateEducationForm, //传递的参数
			dataType : "html", //返回值类型
			type : "post",
			 processData : false, //ajax提交表单必须写
			contentType : false, //ajax提交表单必须写 
			success : function(data) {
				/* $("#modal-container-project"+id).modal('hide'); */
				alert("修改成功！");
				//$("#modal-container-project").remove(); 
				$("#educationFresh").html(data);
			},
			error:function(){
				alert("修改失败！");
			}
		});
	}
</script>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<a id="modal-project" href="#modal-container-project" role="button"
	class="btn" data-toggle="modal">添加教育记录</a>
<div class="modal fade" id="modal-container-project" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- action="personal/resume/ajaxCreateEducation" -->
			<form  class="form-horizontal" method="post" action="personal/resume/CreateEducation"  id="educationForm">
				<input type="hidden" name="resumeId" value="${resume.id }" /><br />
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">添加教育记录</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="educationSchool" class="col-md-3 control-label">学校名称：</label>
						<div class="col-md-8">
							<input class="form-control" name="educationSchool"
								id="educationSchool" />
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="educationContent" class="col-md-3 control-label">专业：</label>
						<div class="col-md-8">
							<input class="form-control" name="educationContent"
								id="educationContent" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">日期：</label>
						<div class="col-md-4">
							<input class="form-control" name="educationBeginTime" size="30"
								type="text" id="datetimeStart" readonly class="form_datetime"
								placeholder="请选择起始日期">
						</div>
						<div class="col-md-4">
							<input class="form-control" name="educationEndTime" size="30"
								type="text" id="datetimeEnd" readonly class="form_datetime"
								placeholder="请选择结束日期">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="submit" class="btn btn-success" >保存</button>
				</div>
			</form>
		</div>
	</div>
</div>



 --%>