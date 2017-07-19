<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--左侧状态栏位-->
<article class="col-sm-12  work-together-shadow work-together-shallow">
	<!--发表状态小节-->
	<section class="panel">
		<!-- 简历基本信息开始 -->
		<div class="panel panel-default">
			<form role="form" class="form-horizontal" action="personal/resume/createResume" method="post" id="resumeForm" style="margin-top: 35px;">
					<div class="row">
					<div class="col-sm-12 column">
						<div class="form-group">
							<label class="control-label col-sm-2">岗位类别:</label>
							<div class="col-sm-3">
							<select class="form-control" onchange="findJob2(this.value)">
							<option>请首先选择岗位类别</option>
							<!-- 牟勇：动态添加一级岗位名称 -->
								<c:forEach items="${myJobs1 }" var="job1">
									<option value="${job1.id }">${job1.jobName }</option>
								</c:forEach>
							</select>
							</div>
							<label class="control-label col-sm-2">应聘职位:</label>
						<div class="col-sm-3">
						<select class="form-control" id="job2" name="resumeTitle">
							<option>请首先选择岗位类别</option>
						</select>
						</div>
						</div>
					</div>
				</div>
				<div class="row">
				<!-- 牟勇：一个不知所云的头像 -->
				<!-- <div class="col-sm-1 column">
					<img src="img/head.gif" class="center-block" width="100"
						height="120" />
				</div> -->
				<!-- 简历基本信息左侧 -->
				<div class="col-sm-5 column">
					<div class="form-group">
						<label for="resumeName" class="col-sm-4 control-label">姓名：</label>
						<div class="col-sm-8">
							<input class="form-control" name="resumeName" id="resumeName" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumeBirthday" class="col-sm-4 control-label">出生日期：</label>
						<div class="col-sm-8">
							<input class="form-control form_datetime" id="resumeBirthday" name="resumeBirthday" readonly="readonly" placeholder="请选择日期" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumePhone" class="col-sm-4 control-label">手机：</label>
						<div class="col-sm-8">
							<input class="form-control" id="resumePhone" type="text" name="resumePhone" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumeEmail" class="col-sm-4 control-label">邮箱：</label>
						<div class="col-sm-8">
							<input class="form-control" id="resumeEmail" type="text" name="resumeEmail" />
						</div>
					</div>
				</div>
				<!-- 简历基本信息左侧结束 -->
				<!-- 简历基本信息右侧 -->
				<div class="col-sm-5 column">
					<div class="form-group">
						<label for="resumeGender" class="col-sm-4 control-label">性别：</label>
						<div class="col-sm-8">
							<label class="col-sm-2 control-label">男</label>
							<div class="col-sm-4">
								<input type="radio" class="form-control" name="resumeGender" id="resumeGender" value="1" checked="checked">
							</div>
							<label  class="col-sm-2 control-label">女</label>
							<div class="col-sm-4">
								<input type="radio" class="form-control" name="resumeGender" id="resumeGender" value="0"> 
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="resumeWorks" class="col-sm-4 control-label">开始工作时间：</label>
						<div class="col-sm-8">
							<input class="form-control form_datetime" id="resumeWorks" name="resumeWorks" readonly="readonly" placeholder="请选择日期" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumeNowResidence" class="col-sm-4 control-label">居住地：</label>
						<div class="col-sm-8">
							<input class="form-control" id="resumeNowResidence" name="resumeNowResidence" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumeJor" class="col-sm-4 control-label">目前职位：</label>
						<div class="col-sm-8">
							<input class="form-control" id="resumeJor" name="resumeJor" type="text" />
						</div>
					</div>
				</div>
				<!-- 简历基本信息右侧结束 -->
				</div><!-- .row end -->
				<div class="row">
				<div class="col-sm-12">
				<div class="panel-group">
					<div class="panel-heading">
						<a class="panel-title col-sm-offset-10" data-toggle="collapse"
							data-parent="#panel" href="#panel-element-more">更多展开 <span
							class="glyphicon glyphicon-chevron-down"></span></a>
					</div>
					<div id="panel-element-more" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="row">
							<!-- 展开更多左侧 -->
							<div class="col-sm-5 column">
								<div class="form-group">
									<label for="resumeQQ" class="col-sm-4 control-label">QQ/微信：</label>
									<div class="col-sm-8">
										<input class="form-control" name="resumeQQ" id="resumeQQ" type="text" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="resumeNation" class="col-sm-4 control-label">民族：</label>
									<div class="col-sm-8">
										<input class="form-control" data-provide="typeahead" data-items="4" autocomplete="off" name="resumeNation" id="resumeNation" type="text" />
									</div>
								</div>
								<script type="text/javascript">
								//民族的自动完成特效
								myAutoComplete('findAllNationName','#resumeNation');
								</script>
								<div class="form-group">
									<label for="resumePlace" class="col-sm-4 control-label">籍贯：</label>
									<div class="col-sm-8">
										<input class="form-control" id="resumePlace" data-provide="typeahead" autocomplete="off" name="resumePlace" type="text" />
									</div>
								</div>
								<script type="text/javascript">
								//省份的自动完成特效
								myAutoComplete('findAllProvinceName','#resumePlace');
								</script>
								<div class="form-group">
									<label for="resumeHouseAddress" class="col-sm-4 control-label">住址：</label>
									<div class="col-sm-8">
										<input class="form-control" name="resumeHouseAddress" id="resumeHouseAddress" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeFLType" class="col-sm-4 control-label">外语类型：</label>
									<div class="col-sm-8">
										<select name="resumeFLType" id="resumeFLType"
											class="form-control">
											<option value="0" selected="selected">--请选择--</option>
											<option value="1">英语</option>
											<option value="2">日语</option>
											<option value="3">德语</option>
											<option value="4">法语</option>
											<option value="5">俄语</option>
											<option value="6">西班牙语</option>
											<option value="7">丹麦语</option>
											<option value="8">其他</option>
										</select>
									</div>
								</div>
								<div style="margin-bottom:13px">
									<label for="resumeHeight" class="col-sm-4 control-label">身高：</label>
									<div class="col-sm-8 input-group">
										<input class="form-control" name="resumeHeight" id="resumeHeight" />
										<span class="input-group-addon">（厘米）</span>
									</div>
								</div>
								<div class="form-group">
									<label for="resumeGraduationSchool" class="col-sm-4 control-label">毕业学校：</label>
									<div class="col-sm-8">
										<input class="form-control" id="resumeGraduationSchool" name="resumeGraduationSchool" type="text" />
									</div>
								</div>
								
							</div>
							<!-- 展开更多左侧结束 -->
							<!-- 展开更多右侧 -->
							<div class="col-sm-5 column">
								<div class="form-group">
									<label for="resumeEducation" class="col-sm-4 control-label">最高学历：</label>
									<div class="col-sm-8">
										<select class="form-control" id="resumeEducation" name="resumeEducation">
											<option value="大学本科">大学本科</option>
											<option value="博士后">博士后</option>
											<option value="博士">博士</option>
											<option value="硕士">硕士</option>
											<option value="大学专科">大学专科</option>
											<option value="高中">高中</option>
											<option value="其他">其他</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="resumeWages" class="col-sm-4 control-label">期望月薪：</label>
									<div class="col-sm-8">
										<input class="form-control" name="resumeWages" id="resumeWages" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeMajor" class="col-sm-4 control-label">专业：</label>
									<div class="col-sm-8">
										<input class="form-control" id="resumeMajor" name="resumeMajor" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeGraduationTime"
										class="col-sm-4 control-label">毕业时间：</label>
									<div class="col-sm-8">
										<input class="form-control form_datetime" value="2016-1" id="resumeGraduationTime" name="resumeGraduationTime" readonly="readonly" placeholder="请选择日期" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeFLAbility" class="col-sm-4 control-label">外语水平：</label>
									<div class="col-sm-8">
										<select name="resumeFLAbility" id="resumeFLAbility" class="form-control">
											<option value="0" selected="selected">--请选择--</option>
											<option value="1">入门</option>
											<option value="2">一般</option>
											<option value="3">熟练</option>
											<option value="4">精通</option>
										</select>
									</div>
								</div>
								<div style="margin-bottom:13px">
									<label for="resumeWeight" class="col-sm-4 control-label">体重：</label>
									<div class="col-sm-8 input-group">
										<input class="form-control" name="resumeWeight" id="resumeWeight" />
											<span class="input-group-addon">（公斤）</span>
									</div>
								</div>
								<div class="form-group">
									<label for="resumeMarriage" class="col-sm-4 control-label">婚姻状况：</label>
									<div class="col-sm-8">
										<div class="col-sm-6">
											<input type="radio" name="resumeMarriage" id="resumeMarriage" value="0"> <label>未婚</label>
										</div>
										<div class="col-sm-6">
											<input type="radio" name="resumeMarriage" id="resumeMarriage" value="1" checked="checked"> <label>已婚</label>
										</div>
									</div>
								</div>
							</div>
							<!-- 展开更多右侧结束 -->
							</div><!-- row end -->
							<div class="row">
							<!-- 自我评价: -->
							<div class="col-sm-12">
								<div class="form-group">
									<label for="resumeSelfEvaluation" class="col-sm-2 control-label">个人评价：</label>
									<div class="col-sm-10">
										<textarea style="resize:none;" class="form-control" id="resumeSelfEvaluation" name="resumeSelfEvaluation">
											<p><b>性格特征：</b></p>
											<br />
											<br />
											<br />
											<p><b>职业规划：</b></p>
											<br />
											<br />
											<br />
											<p><b>技能经验:</b></p>
											<br />
											<br />
											<br />
										</textarea>
									</div>
									<script type="text/javascript">
									    $(document).ready(function(){  
									    		CKEDITOR.replace('resumeSelfEvaluation',{
									    		    filebrowserImageUploadUrl: '../../ckeditor/upload?Type=Images'
									    		}); 
									    });
								    </script>
								</div>
							</div>
							<!-- 自我评价结束 -->
							</div><!-- .row end  -->
						</div>
					</div>
				</div><!-- 展开更多panel结束 -->
				</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-12">
						<input type="submit" class="btn btn-success" value="保存" />
					</div>
				</div>
			</form>

			<div class="panel-footer"></div>
		</div>
		<!-- 简历基本信息结束 -->
	</section>
</article>