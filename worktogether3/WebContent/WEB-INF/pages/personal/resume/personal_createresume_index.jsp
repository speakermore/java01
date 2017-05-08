<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--左侧状态栏位-->
<article
	class="col-md-12 work-together-margin-left-30 work-together-dev-height-2000 alert-danger work-together-shadow work-together-shallow">
	<!--发表状态小节-->
	<section class="panel">
		<!-- 简历基本信息开始 -->
		<form role="form" class="form-horizontal"
			action="personal/resume/createResume" method="post" id="resumeForm" enctype="multipart/form-data">
			<div class="form-group">
				<label for="resumeTitle" class="col-md-3 control-label">简历标题：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeTitle" id="resumeTitle" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeName" class="col-md-3 control-label">姓名：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeName" id="resumeName" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeHeadImg" class="col-md-3 control-label">头像：</label>
				<!-- userHeadImgPath -->
				<div class="col-md-8">
					<input class="form-control file" name="resumeFile" type="file"
						id="resumeHeadImg" multiple data-min-file-count="1" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeGender" class="col-md-3 control-label">性别：</label>
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
				<label for="resumeWorks" class="col-md-3 control-label">工作年限：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeWorks" id="resumeWorks" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeWages" class="col-md-3 control-label">期望薪资：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeWages" id="resumeWages" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeJor" class="col-md-3 control-label">意向：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeJor" id="resumeJor" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeNation" class="col-md-3 control-label">民族：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeNation" id="resumeNation" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumePlace" class="col-md-3 control-label">籍贯：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumePlace" id="resumePlace" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeBirthday" class="col-md-3 control-label">出生日期：</label>
				<div class="col-md-8">
					<input class="form-control form_datetime" placeholder="请选择日期"
						name="resumeBirthday" id="resumeBirthday" readonly />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeMarriage" class="col-md-3 control-label">婚配：</label>
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
				<label for="resumeEducation" class="col-md-3 control-label">学历：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeEducation"
						id="resumeEducation" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeGraduationSchool" class="col-md-3 control-label">毕业学校：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeGraduationSchool"
						id="resumeGraduationSchool" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeGraduationTime" class="col-md-3 control-label">毕业日期：</label>
				<div class="col-md-8">
					<input class="form-control form_datetime" placeholder="请选择日期"
						name="resumeGraduationTime" id="resumeGraduationTime" readonly />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeMajor" class="col-md-3 control-label">专业：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeMajor" id="resumeMajor" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumePhone" class="col-md-3 control-label">电话号码：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumePhone" id="resumePhone" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeQQ" class="col-md-3 control-label">QQ或微信：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeQQ" id="resumeQQ" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeHeight" class="col-md-3 control-label">身高（厘米）：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeHeight" id="resumeHeight" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumeWeight" class="col-md-3 control-label">体重（斤）：</label>
				<div class="col-md-8">
					<input class="form-control" name="resumeWeight" id="resumeWeight" />
				</div>
			</div>
			<div class="form-group">
				<label for="resumePersonality" class="col-sm-3 control-label">特点描述：</label>
				<div class="col-sm-8">
					<textarea class="form-control" name="resumePersonality"
						id="resumePersonality"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="resumeSelfEvaluation" class="col-sm-3 control-label">自我评价：</label>
				<div class="col-sm-8">
					<textarea class="form-control" name="resumeSelfEvaluation"
						id="resumeSelfEvaluation"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="resumeEnglishGrade" class="col-md-3 control-label">英语等级：</label>
				<div class="col-md-8">
					<select name="resumeEnglishGrade" class="form-control">
						<option value=" ">--未选择--</option>
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
				<label for="resumeFLType" class="col-md-3 control-label">外语类型：</label>
				<div class="col-md-8">
					<select name="resumeFLType" class="form-control">
						<option value=" " selected="selected">--未选择--</option>
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
				<label for="resumeFLAbility" class="col-md-3 control-label">外语水平：</label>
				<div class="col-md-8">
					<select name="resumeFLAbility" class="form-control">
						<option value=" " selected="selected">--未选择--</option>
						<option value="1">入门</option>
						<option value="2">一般</option>
						<option value="3">熟练</option>
						<option value="4">精通</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="resumeComputerAbility" class="col-md-3 control-label">计算机水平：</label>
				<div class="col-md-8">
					<select name="resumeComputerAbility" class="form-control">
						<option value=" " selected="selected">--未选择--</option>
						<option value="1">入门</option>
						<option value="2">一般</option>
						<option value="3">熟练</option>
						<option value="4">精通</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<a for="" class="col-md-offset-9 control-label ">添加教育记录</a>
			</div>
			<div class="form-group">
				<a for="" class="col-md-offset-9 control-label">添加工作记录</a>
			</div>
			<div class="form-group">
				<a for="" class="col-md-offset-9 control-label">添加项目记录</a>
			</div>
			<div class="form-group">
				<div class="col-md-offset-9">
					<input class="btn btn-success" type="submit" value="保存" />
				</div>
			</div>
		</form>
		<!-- 简历基本信息结束 -->
	</section>
</article>