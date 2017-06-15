<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--左侧状态栏位-->
<article
	class="col-md-12  work-together-shadow work-together-shallow">
	<!--发表状态小节-->
	<section class="panel">
		<!-- 简历基本信息开始 -->
		<div class="panel panel-default">
			<form class="form-horizontal" action="personal/resume/createResume"
				method="post" id="resumeForm"
				style="margin-left: 35px; margin-top: 35px;">
				<div class="col-md-1 column">
					<img src="img/head.gif" class="center-block" width="100"
						height="120" />
				</div>
				<div class="col-md-5 column">
					<div class="form-group">
						<label for="resumeName" class="col-md-4 control-label">姓名</label>
						<div class="col-md-8">
							<input class="form-control" name="resumeName" id="resumeName"
								type="text" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumeBirthday" class="col-md-4 control-label">出生日期</label>
						<div class="col-md-8">
							<input class="form-control form_datetime" id="resumeBirthday"
								name="resumeBirthday" readonly="readonly" placeholder="请选择日期" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumePhone" class="col-md-4 control-label">手机</label>
						<div class="col-md-8">
							<input class="form-control" id="resumePhone" type="text"
								name="resumePhone" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumeEmail" class="col-md-4 control-label">邮箱</label>
						<div class="col-md-8">
							<input class="form-control" id="resumeEmail" type="text"
								name="resumeEmail" />
						</div>
					</div>
				</div>
				<div class="col-md-5 column">
					<div class="form-group">
						<label for="resumeGender" class="col-md-4 control-label">性别</label>
						<div class="col-md-8">
							<div class="col-md-6">
								<input type="radio" name="resumeGender" id="resumeGender"
									value="1" checked="checked"> <label>男</label>
							</div>
							<div class="col-md-6">
								<input type="radio" name="resumeGender" id="resumeGender"
									value="0"> <label>女</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="resumeWorks" class="col-md-4 control-label">开始工作年月</label>
						<div class="col-md-8">
							<input class="form-control form_datetime" id="resumeWorks"
								name="resumeWorks" readonly="readonly" placeholder="请选择日期" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumeNowResidence" class="col-md-4 control-label">目前居住地</label>
						<div class="col-md-8">
							<input class="form-control" id="resumeNowResidence"
								name="resumeNowResidence" type="text" />
						</div>
					</div>
					<div class="form-group">
						<label for="resumeJor" class="col-md-4 control-label">目前职位</label>
						<div class="col-md-8">
							<input class="form-control" id="resumeJor" name="resumeJor"
								type="text" />
						</div>
					</div>
				</div>
				<div class="panel-group">
					<div class="panel-heading">
						<a class="panel-title col-md-offset-10" data-toggle="collapse"
							data-parent="#panel" href="#panel-element-more">更多展开 <span
							class="glyphicon glyphicon-chevron-down"></span></a>
					</div>
					<div id="panel-element-more" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="col-md-6 column">
								<div class="form-group">
									<label for="resumeQQ" class="col-md-4 control-label">QQ/微信</label>
									<div class="col-md-8">
										<input class="form-control" name="resumeQQ" id="resumeQQ"
											type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeNation" class="col-md-4 control-label">民族</label>
									<div class="col-md-8">
										<input class="form-control" name="resumeNation"
											id="resumeNation" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumePlace" class="col-md-4 control-label">籍贯</label>
									<div class="col-md-8">
										<input class="form-control" id="resumePlace"
											name="resumePlace" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeEnglishGrade" class="col-md-4 control-label">英语等级</label>
									<div class="col-md-8">
										<select name="resumeEnglishGrade" id="resumeEnglishGrade"
											class="form-control">
											<option value="0" selected="selected">--未选择--</option>
											<option value="1">国家英语考试3级</option>
											<option value="2">国家英语考试4级</option>
											<option value="3">国家英语考试6级</option>
											<option value="4">专业4级</option>
											<option value="5">专业8级</option>
											<option value="6">未参加</option>
											<option value="7">未通过</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="resumeComputerAbility"
										class="col-md-4 control-label">计算机水平</label>
									<div class="col-md-8">
										<select name="resumeComputerAbility"
											id="resumeComputerAbility" class="form-control">
											<option value="0" selected="selected">--未选择--</option>
											<option value="1">入门</option>
											<option value="2">一般</option>
											<option value="3">熟练</option>
											<option value="4">精通</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="resumeHouseAddress" class="col-md-4 control-label">家庭地址</label>
									<div class="col-md-8">
										<input class="form-control" name="resumeHouseAddress"
											id="resumeHouseAddress" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeGraduationSchool"
										class="col-md-4 control-label">毕业学校</label>
									<div class="col-md-8">
										<input class="form-control" id="resumeGraduationSchool"
											name="resumeGraduationSchool" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeHeight" class="col-md-4 control-label">身高(厘米)</label>
									<div class="col-md-8">
										<input class="form-control" name="resumeHeight"
											id="resumeHeight" />
									</div>
								</div>
							</div>
							<!-- 展开更多右侧 -->
							<div class="col-md-5 column">
								<div class="form-group">
									<label for="resumeEducation" class="col-md-4 control-label">学历</label>
									<div class="col-md-8">
										<input class="form-control" id="resumeEducation"
											name="resumeEducation" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeWages" class="col-md-4 control-label">期待薪资</label>
									<div class="col-md-8">
										<input class="form-control" name="resumeWages"
											id="resumeWages" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeMajor" class="col-md-4 control-label">专业</label>
									<div class="col-md-8">
										<input class="form-control" id="resumeMajor"
											name="resumeMajor" type="text" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeGraduationTime"
										class="col-md-4 control-label">毕业时间</label>
									<div class="col-md-8">
										<input class="form-control form_datetime" value="2016-1-1"
											id="resumeGraduationTime" name="resumeGraduationTime"
											readonly="readonly" placeholder="请选择日期" />
									</div>
								</div>
								<div class="form-group">
									<label for="resumeFLType" class="col-md-4 control-label">外语类型</label>
									<div class="col-md-8">
										<select name="resumeFLType" id="resumeFLType"
											class="form-control">
											<option value="0" selected="selected">--未选择--</option>
											<option value="1">英语</option>
											<option value="2">日语</option>
											<option value="3">德语</option>
											<option value="4">法语</option>
											<option value="5">俄语</option>
											<option value="6">西班牙语</option>
											<option value="7">丹麦语</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="resumeFLAbility" class="col-md-4 control-label">外语水平</label>
									<div class="col-md-8">
										<select name="resumeFLAbility" id="resumeFLAbility"
											class="form-control">
											<option value="0" selected="selected">--未选择--</option>
											<option value="1">入门</option>
											<option value="2">一般</option>
											<option value="3">熟练</option>
											<option value="4">精通</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="resumeMarriage" class="col-md-4 control-label">婚姻状况</label>
									<div class="col-md-8">
										<div class="col-md-6">
											<input type="radio" name="resumeMarriage" id="resumeMarriage"
												value="1" checked="checked"> <label>已婚</label>
										</div>
										<div class="col-md-6">
											<input type="radio" name="resumeMarriage" id="resumeMarriage"
												value="0"> <label>未婚</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="resumeWeight" class="col-md-4 control-label">体重(公斤)</label>
									<div class="col-md-8">
										<input class="form-control" name="resumeWeight"
											id="resumeWeight" />
									</div>
								</div>
							</div>
							<!-- 展开更多右侧结束 -->
							<div class="col-md-11">
								<div class="form-group">
									<label for="resumeSelfEvaluation"
										class="col-md-3 control-label">自我评价</label>
									<div class="col-md-9">
										<textarea style="resize: none;" class="form-control" id="resumeSelfEvaluation"
											name="resumeSelfEvaluation"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-5 col-md-12">
						<input type="submit" class="btn btn-success" value="保存" />
					</div>
				</div>
			</form>

			<div class="panel-footer"></div>
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon-list-alt"></span> 工作经验 <label
						class="panel-title col-md-offset-9"><span
						class="glyphicon glyphicon-plus"></span> 新增工作</label>
				</h3>
			</div>
			<div class="panel-body col-md-offset-3">
				<span class="glyphicon glyphicon-list-alt"></span>
				完善工作经验，展现工作内容及能力，让HR更了解你！
			</div>
			<div class="panel-footer"></div>
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon-signal"></span> 项目经验 <label
						class="panel-title col-md-offset-9"><span
						class="glyphicon glyphicon-plus"></span> 新增项目</label>
				</h3>
			</div>
			<div class="panel-body col-md-offset-3">
				<span class="glyphicon glyphicon-signal"></span>
				完善项目经验，展现社会工作能力，让HR更了解你！
			</div>
			<div class="panel-footer"></div>
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon-book"></span> 教育经历 <label
						class="panel-title col-md-offset-9"><span
						class="glyphicon glyphicon-plus"></span>新增教育</label>
				</h3>
			</div>
			<div class="panel-body col-md-offset-3">
				<span class="glyphicon glyphicon-book"></span>
				完善教育经历，展现专业能力，让HR更了解你！
			</div>
		</div>
		<!-- 简历基本信息结束 -->
	</section>
</article>