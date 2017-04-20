<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员简历审核</title>

<!-- Bootstrap -->
<div><%@include file="../header.jsp"%></div>
</head>
<body>
	<div><%@include file="../menu.jsp"%></div>
	
	<from action="findAuditResume">
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-3 main">
          <h2 class="sub-header">用户信息</h2>
          <div class="table-responsive">
            <table class="table table-striped">
                <ul>
					<li>简历标题：${resume.resumeTitle}</li>
					<li>创建时间：${resume.resumeCreateDate}</li>
					<li>姓名：${resume.resumeName}</li>
					<li>性别：${resume.resumeGender}</li>
					<li>民族：${resume.resumeNation}</li>
					<li>籍贯：${resume.resumePlace}</li>
					<li>生日：${resume.resumeBirthday}</li>
					<li>身高：${resume.resumeHeight}</li>
					<li>体重：${resume.resumeWeight}</li>
					<li>毕业院校：${resume.resumeGraduationSchool}</li>
					<li>毕业时间：${resume.resumeGraduationTime}</li>
					<li>学历：${resume.resumeEducation}</li>
					<li>专业：${resume.resumeMajor}</li>
					<li>期望待遇：${resume.resumeWages}</li>
					<li>婚姻状况：${resume.resumeMarriage}</li>
					<li>电话：${resume.resumePhone}</li>
					<li>QQ：${resume.resumeQQ}</li>
					<li>外语水平：${resume.resumeFLAbility}</li>
					<li>外语类型：${resume.resumeFLType}</li>
					<li>计算机水平：${resume.resumeComputerAbility}</li>
					<li>特点描述：${resume.resumePersonality}</li>
					<li>自我评价：${resume.resumeSelfEvaluation}</li>
					<div class="">
						<a class="col-sm-offset-2" href="admin/auditResume?resumeStatusThree=2&id=${resume.id}&toPage=../auditingResume"></a>
						<input  class="btn btn-warning"  type="submit" value="通过审核" />
						<a  class="col-sm-offset-4" href="admin/auditResume?resumeStatusThree=3&id=${resume.id}&toPage=../auditingResume" ></a>
						<input  class="btn btn-warning"  type="submit" value="拒绝审核" />
					</div>
				</ul>
            </table>
          </div>
        </div>
		<!--左侧边栏结束-->


		<!--右侧边栏-->
		<!--<div class="col-sm-4" style="border: 1px solid black;">1列</div><!--右侧边栏结束-->

	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> <script
		src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script> <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/admin/bootstrap.min.js"></script> </from>
	<div><%@include file="../footer.jsp" %></div>
</body>
</html>					