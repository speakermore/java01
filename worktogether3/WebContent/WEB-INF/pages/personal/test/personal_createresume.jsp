<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>用户中心-创建简历</title>
		<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
		<!-- Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="css/personal/bootstrap-datetimepicker.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
	</head>

	<body>
		<%@include file="/WEB-INF/pages/personal/common/header.jsp" %>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-1 column"></div>
				<div class="col-md-7 column">
					<form role="form" class="form-horizontal" action="personal/resume/createResume" method="post">
						<div class="form-group">
							<label for="resumeTitle" class="col-md-3 control-label">简历标题：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeTitle" id="resumeTitle" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeName" class="col-md-3 control-label">姓名：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeName" id="resumeName" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">性别：</label>
							<div class="btn-group btn-group-lg col-md-9">
								<button class="btn btn-default col-md-6" type="button" name="resumeGender">
									<em class="glyphicon glyphicon-step-backward"></em> 男
								</button>
								<button class="btn btn-default col-md-6" type="button" name="resumeGender">
									<em class="glyphicon glyphicon-step-forward"></em> 女
								</button>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeWages" class="col-md-3 control-label">期望薪资：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeWages" id="resumeWages" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeJor" class="col-md-3 control-label">意向：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeJor" id="resumeJor" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeNation" class="col-md-3 control-label">民族：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeNation" id="resumeNation" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumePlace" class="col-md-3 control-label">籍贯：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumePlace" id="resumePlace" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeBirthday" class="col-md-3 control-label">出生日期：</label>
							<div class="col-md-9">
								<input class="form-control form_datetime" placeholder="请选择日期" name="resumeBirthday" id="resumeBirthday" readonly/>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeMarriage" class="col-md-3 control-label">婚姻：</label>
							<div class="btn-group btn-group-lg col-md-9">
								<button class="btn btn-default col-md-6" type="button" name="resumeMarriage">
									<em class="glyphicon glyphicon-step-backward"></em>已婚
								</button>
								<button class="btn btn-default col-md-6" type="button" name="resumeMarriage">
									<em class="glyphicon glyphicon-step-forward"></em>未婚
								</button>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeEducation" class="col-md-3 control-label">学历：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeEducation" id="resumeEducation" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeGraduationSchool" class="col-md-3 control-label">毕业学校：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeGraduationSchool" id="resumeGraduationSchool" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeGraduationTime" class="col-md-3 control-label">毕业日期：</label>
							<div class="col-md-9">
								<input class="form-control form_datetime" placeholder="请选择日期" name="resumeGraduationTime" id="resumeGraduationTime" readonly />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeMajor" class="col-md-3 control-label">专业：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeMajor" id="resumeMajor" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeMajor" class="col-md-3 control-label">专业：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeMajor" id="resumeMajor" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumePhone" class="col-md-3 control-label">电话号码：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumePhone" id="resumePhone" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeQQ" class="col-md-3 control-label">QQ或微信：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeQQ" id="resumeQQ" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeHeight" class="col-md-3 control-label">身高：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeHeight" id="resumeHeight" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumeWeight" class="col-md-3 control-label">体重：</label>
							<div class="col-md-9">
								<input class="form-control" name="resumeWeight" id="resumeWeight" />
							</div>
						</div>
						<div class="form-group">
							<label for="resumePersonality" class="col-sm-3 control-label">特点描述：</label>
							<div class="col-sm-9">
								<textarea class="form-control ckeditor" name="resumePersonality" id="resumePersonality"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeSelfEvaluation" class="col-sm-3 control-label">自我评价：</label>
							<div class="col-sm-9">
								<textarea class="form-control ckeditor" name="resumeSelfEvaluation" id="resumeSelfEvaluation"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeEnglishGrade" class="col-md-3 control-label">英语等级：</label>
							<div class="col-md-9">
								<select name="resumeEnglishGrade" class="form-control">
									<option value="0" selected="selected">--未选择--</option>
									<option value="1">国家英语考试3级</option>
									<option value="2">国家英语考试4级</option>
									<option value="3">国家英语考试6级</option>
									<option value="4">专业4级</option>
									<option value="4">专业8级</option>
									<option value="4">未参加</option>
									<option value="4">未通过</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeFLType" class="col-md-3 control-label">外语类型：</label>
							<div class="col-md-9">
								<select name="resumeFLType" class="form-control">
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
							<label for="resumeFLAbility" class="col-md-3 control-label">外语水平：</label>
							<div class="col-md-9">
								<select name="resumeFLAbility" class="form-control">
									<option value="0" selected="selected">--未选择--</option>
									<option value="1">入门</option>
									<option value="2">一般</option>
									<option value="3">熟练</option>
									<option value="4">精通</option>
									</select>
							</div>
						</div>
						<div class="form-group">
							<label for="resumeComputerAbility" class="col-md-3 control-label">计算机水平：</label>
							<div class="col-md-9">
								<select name="resumeComputerAbility" class="form-control">
									<option value="0" selected="selected">--未选择--</option>
									<option value="1">入门</option>
									<option value="2">一般</option>
									<option value="3">熟练</option>
									<option value="4">精通</option></select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-10">
								<input class="btn btn-success" type="submit" value="保存" />
							</div>
						</div>
					</form>
				</div>

				<div class="col-md-3 column">
					<%-- <%@include file="/WEB-INF/pages/personal/common/resume_right.jsp" %> --%>
			</div>
			<div class="col-md-1 column "></div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script type="text/javascript " src="js/personal/jquery-3.1.1.min.js "></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js "></script>
	<script type="text/javascript" src="js/personal/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="js/personal/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript">
		$("#resumeBirthday").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView: "month"
		});
		$("#resumeGraduationTime").datetimepicker({
			format : 'yyyy-mm-dd',
			language : 'zh-CN',
			startDate : '1900-01-01', //选择器的开始日期
			autoclose : true,
			todayHighlight : true,
			minView: "month"
		});
		
		/*  $(document).ready(function(){
			$("#datetimeEnd").click(function(){
				alert(typeof(1));
			});
		});  */
		
		/*$('.date').datetimepicker({
		  language: 'zh-CN',//显示中文
		  format: 'yyyy-mm-dd',//显示格式
		  minView: "month",//设置只显示到月份
		  initialDate: new Date(),//初始化当前日期
		  autoclose: true,//选中自动关闭
		  todayBtn: true//显示今日按钮
		 })  */
	</script>
</body>
</html>