<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<article
	class="col-md-12 work-together-margin-left-30 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
	<div class="row">
		<!--发表状态小节-->
		<section class="panel">
			<table class="table">
				<tr>
					<td colspan="3">
						<h3 class="text-center">${resume.resumeTitle }</h3>
					</td>
				</tr>
				<tr>
					<td rowspan="4" class="col-md-1"><a href="#"><img
							src="img/personal/head.gif" width="180" height="180" /></a></td>
				</tr>
				<tr>
					<td class="col-md-4">${resume.resumeName }</td>
					<td><c:if test="${resume.resumeGender==1 }">
								男
								</c:if> <c:if test="${resume.resumeGender==2 }">
								女
								</c:if></td>
				</tr>
				<tr>
					<td>${resume.resumeJor }</td>
					<td>${resume.resumeWages }</td>
				</tr>
			</table>
			<div class="panel-group" id="panel">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-one">基本内容</a>
					</div>
					<div id="panel-element-one" class="panel-collapse collapse in">
						<div class="panel-body">
							<table class="table">
								<colgroup>
									<col style="width: 50%">
									<col style="width: 50%">
								</colgroup>
								<tr>
									<td>籍贯：</td>
									<td>${resume.resumePlace }</td>
								</tr>
								<tr>
									<td>民族：</td>
									<td>${resume.resumeNation }</td>
								</tr>
								<tr>
									<td>生日：</td>
									<td><fmt:formatDate value="${resume.resumeBirthday }"
											pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<td>电话：</td>
									<td>${resume.resumePhone }</td>
								</tr>
								<tr>
									<td>QQ:</td>
									<td>${resume.resumeQQ }</td>
								</tr>
								<tr>
									<td>婚姻：</td>
									<td><c:if test="${resume.resumeMarriage==1 }">
												未婚
												</c:if> <c:if test="${resume.resumeMarriage==2 }">
												已婚
												</c:if></td>
								</tr>
								<tr>
									<td>毕业学校：</td>
									<td>${resume.resumeGraduationSchool }</td>
								</tr>
								<tr>
									<td>毕业时间：</td>
									<td>${resume.resumeGraduationTime }</td>
								</tr>
								<tr>
									<td>学历：</td>
									<td>${resume.resumeEducation }</td>
								</tr>
								<tr>
									<td>专业：</td>
									<td>${resume.resumeMajor }</td>
								</tr>
								<tr>
									<td>英语等级：</td>
									<td><c:if test="${resume.resumeEnglishGrade==1 }">
												国家英语考试3级
												</c:if> <c:if test="${resume.resumeEnglishGrade==2 }">
												国家英语考试4级
												</c:if> <c:if test="${resume.resumeEnglishGrade==3 }">
												国家英语考试6级
												</c:if> <c:if test="${resume.resumeEnglishGrade==4 }">
												专业4级
												</c:if> <c:if test="${resume.resumeEnglishGrade==5 }">
												专业8级
												</c:if> <c:if test="${resume.resumeEnglishGrade==6 }">
												未参加
												</c:if> <c:if test="${resume.resumeEnglishGrade==7 }">
												未通过
												</c:if></td>
								</tr>
								<tr>
									<td>外语类型：</td>
									<td><c:if test="${resume.resumeFLType==1 }">
												英语
												</c:if> <c:if test="${resume.resumeFLType==2 }">
												日语
												</c:if> <c:if test="${resume.resumeFLType==3 }">
												德语
												</c:if> <c:if test="${resume.resumeFLType==4 }">
												法语
												</c:if> <c:if test="${resume.resumeFLType==5 }">
												俄语
												</c:if> <c:if test="${resume.resumeFLType==6 }">
												西班牙语
												</c:if> <c:if test="${resume.resumeFLType==7 }">
												丹麦语
												</c:if> <c:if test="${resume.resumeFLType==8 }">
												其他
												</c:if></td>
								</tr>
								<tr>
									<td>外语水平：</td>
									<td><c:if test="${resume.resumeFLAbility==1 }">
												入门
												</c:if> <c:if test="${resume.resumeFLAbility==2 }">
												一般
												</c:if> <c:if test="${resume.resumeFLAbility==3 }">
												熟练
												</c:if> <c:if test="${resume.resumeFLAbility==4 }">
												精通
												</c:if></td>
								</tr>
								<tr>
									<td>计算机水平：</td>
									<td><c:if test="${resume.resumeComputerAbility==1 }">
												入门
												</c:if> <c:if test="${resume.resumeComputerAbility==2 }">
												一般
												</c:if> <c:if test="${resume.resumeComputerAbility==3 }">
												熟练
												</c:if> <c:if test="${resume.resumeComputerAbility==4 }">
												精通
												</c:if></td>
								</tr>
								<tr>
									<td>身高：</td>
									<td>${resume.resumeHeight }</td>
								</tr>
								<tr>
									<td>体重：</td>
									<td>${resume.resumeWeight }</td>
								</tr>
								<tr>
									<td></td>
									<td class="text-right"><a
										href="personal/resume/updateResume?id=${resume.id }">编辑</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-two">教育记录</a>
					</div>
					<div id="panel-element-two" class="panel-collapse collapse">
						<div class="panel-body">
							<h6>
								<a
									href="personal/resume/gotoCreateEducation?resumeId=${resume.id }">添加教育记录</a>
							</h6>
							<c:if test="${edus==null }">
								<jsp:forward
									page="/personal/resume/lookResumeEdus?resumeId=${resume.id }"></jsp:forward>
							</c:if>
							<c:forEach items="${edus }" var="edu">
								<table class="table">
									<colgroup>
										<col style="width: 50%">
										<col style="width: 50%">
									</colgroup>
									<tr>
										<td>学校名称：</td>
										<td>${edu.educationSchool }</td>
									</tr>
									<tr>
										<td>教育描述：</td>
										<td>
											<p>${edu.educationContent}</p>
										</td>
									</tr>
									<tr>
										<td>教育时间：</td>
										<td>${edu.educationBeginTime}到${edu.educationEndTime}</td>
									</tr>
									<tr>
										<td></td>
										<td class="text-right"><a href="#">编辑</a>|<a
											href="personal/resume/deleteResumeEducation?id=${edu.id }">删除</a>
										</td>
									</tr>
								</table>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-three">工作记录</a>
					</div>
					<div id="panel-element-three" class="panel-collapse collapse">
						<div class="panel-body">
							<h6>
								<a href="personal/resume/gotoCreateWork?resumeId=${resume.id }">添加工作记录</a>
							</h6>
							<c:if test="${works==null }">
								<jsp:forward
									page="/personal/resume/lookResumeWork?resumeId=${resume.id }"></jsp:forward>
							</c:if>
							<c:forEach items="${works }" var="work">
								<table class="table">
									<colgroup>
										<col style="width: 50%">
										<col style="width: 50%">
									</colgroup>
									<tr>
										<td>企业名称：</td>
										<td>${work.workFirmName }</td>
									</tr>
									<tr>
										<td>工作岗位：</td>
										<td>${work.workUnit }</td>
									</tr>
									<tr>
										<td>工作描述：</td>
										<td>${work.workDescription }</td>
									</tr>
									<tr>
										<td>工作时间：</td>
										<td>${work.workBeginTime }到${work.workEndTime }</td>
									</tr>
									<tr>
										<td></td>
										<td class="text-right"><a href="#">编辑</a>|<a
											href="personal/resume/deleteResumeWork?id=${wrok.id }">删除</a>
										</td>
									</tr>
								</table>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-four">项目记录</a>
					</div>
					<div id="panel-element-four" class="panel-collapse collapse">
						<div class="panel-body">
							<h6>
								<a
									href="personal/resume/gotoCreateProject?resumeId=${resume.id }">添加项目记录</a>
							</h6>
							<c:if test="${projs==null }">
								<jsp:forward
									page="/personal/resume/lookResumeProjs?resumeId=${resume.id }"></jsp:forward>
							</c:if>
							<c:forEach items="${projs }" var="pro">
								<table class="table">
									<colgroup>
										<col style="width: 50%">
										<col style="width: 50%">
									</colgroup>
									<tr>
										<td>项目名称：</td>
										<td>${pro.projectName }</td>
									</tr>
									<tr>
										<td>项目岗位：</td>
										<td>${pro.projectJob }</td>
									</tr>
									<tr>
										<td>项目描述：</td>
										<td>${pro.projectDescription }</td>
									</tr>
									<tr>
										<td>责任描述与感受：</td>
										<td>${pro.projectMakeDescription }</td>
									</tr>
									<tr>
										<td>项目时间：</td>
										<td>${pro.projectBeginTime }到${pro.projectEndTime }</td>
									</tr>
									<tr>
										<td></td>
										<td class="text-right"><a href="#">编辑</a>|<a
											href="personal/resume/deleteResumeProject?id=${pro.id }">删除</a>
										</td>
									</tr>
								</table>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="panel-title" data-toggle="collapse" data-parent="#panel"
							href="#panel-element-five">综合评价</a>
					</div>
					<div id="panel-element-five" class="panel-collapse collapse">
						<div class="panel-body">
							<table class="table">
								<colgroup>
									<col style="width: 50%">
									<col style="width: 50%">
								</colgroup>
								<tr>
									<td>特点描述：</td>
									<td>${resume.resumePersonality }</td>
								</tr>
								<tr>
									<td>自我评价：</td>
									<td>${resume.resumeSelfEvaluation }</td>
								</tr>
								<tr>
									<td></td>
									<td class="text-right"><a href="#">编辑</a>|<a href="#">删除</a>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</article>
