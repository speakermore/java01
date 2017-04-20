<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简历预览</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<form action="personal/resume/updateResume" method="post">
	<input type="hidden" name="id" value="${resume.id }" />
	简历标题:
	<input type="text" name="resumeTitle" value="${resume.resumeTitle }" />
	<br /> 
	意向:<input type="text" name="resumeJor"/><br/>姓名:
	<input type="text" name="resumeName" value="${resume.resumeName }" />
	<br />
	<c:if test="${resume.resumeGender==1 }">
		性别:男：<input type="radio" value="1" checked="checked"
			name="resumeGender" />
		女：<input type="radio" value="2" name="resumeGender" />
		<br />
	</c:if>
	<c:if test="${resume.resumeGender==2 }">
		性别:男：<input type="radio" value="1" name="resumeGender" />
		女：<input type="radio" value="2" name="resumeGender" checked="checked" />
		<br />
	</c:if>
	民族:
	<input type="text" name="resumeNation" value="${resume.resumeNation }" />
	<br /> 籍贯:
	<input type="text" name="resumePlace" value="${resume.resumePlace }" />
	<br /> 生日:
	<input type="text" name="resumeBirthday"
		value="${resume.resumeBirthday }" />
	<br /> 婚姻：
	<select name="resumeMarriage">
		<option value="0">--未选择--</option>
		<c:if test="${resume.resumeMarriage==1 }">
			<option value="1" selected="selected">未婚</option>
			<option value="2">已婚</option>
			<option value="3">离异</option>
		</c:if>
		<c:if test="${resume.resumeMarriage==2 }">
			<option value="1">未婚</option>
			<option value="2" selected="selected">已婚</option>
			<option value="3">离异</option>
		</c:if>
		<c:if test="${resume.resumeMarriage==3 }">
			<option value="1">未婚</option>
			<option value="2">已婚</option>
			<option value="3" selected="selected">离异</option>
		</c:if>
	</select>
	<br /> 毕业院校:
	<input type="text" name="resumeGraduationSchool"
		value="${resume.resumeGraduationSchool }" />
	<br /> 业时间:
	<input type="text" name="resumeGraduationTime"
		value="${resume.resumeGraduationTime }" />
	<br /> 学历:
	<input type="text" name="resumeEducation"
		value="${resume.resumeEducation }" />
	<br /> 专业:
	<input type="text" name="resumeMajor" value="${resume.resumeMajor }" />
	<br /> 期望待遇:
	<input type="text" name="resumeWages" value="${resume.resumeWages }" />
	<br /> 电话:
	<input type="text" name="resumePhone" value="${resume.resumePhone }" />
	<br /> QQ:
	<input type="text" name="resumeQQ" value="${resume.resumeQQ }" />
	<br />
	<!-- 取值 -->
	<input type="hidden" id="resumeFLAbility"
		value="${resume.resumeFLAbility}">
	<input type="hidden" id="resumeFLType" value="${resume.resumeFLType}">
	<input type="hidden" id="resumeEnglishGrade"
		value="${resume.resumeEnglishGrade}">
	<input type="hidden" id="resumeComputerAbility"
		value="${resume.resumeComputerAbility}">
	<!-- 取值 末-->
	外语水平：
	<select name="resumeFLAbility" class="resumeFLAbility">
		<option value="0">--未选择--</option>
		<option value="1">入门</option>
		<option value="2">一般</option>
		<option value="3">熟练</option>
		<option value="4">精通</option>
	</select>
	<br /> 外语类型：
	<select name="resumeFLType" class="resumeFLType">
		<option value="0">--未选择--</option>
		<option value="1">英语</option>
		<option value="2">日语</option>
		<option value="3">德语</option>
		<option value="4">法语</option>
		<option value="5">俄语</option>
		<option value="6">西班牙语</option>
		<option value="7">丹麦语</option>
	</select>
	<br /> 英语等级：
	<select name="resumeEnglishGrade" class="resumeEnglishGrade">
		<option value="0" selected="selected">--未选择--</option>
		<option value="1">国家英语考试3级</option>
		<option value="2">国家英语考试4级</option>
		<option value="3">国家英语考试6级</option>
		<option value="4">专业4级</option>
		<option value="5">专业8级</option>
		<option value="6">未参加</option>
		<option value="7">未通过</option>
	</select>
	<br /> 计算机水平：
	<select name="resumeComputerAbility" class="resumeComputerAbility">
		<option value="0">--未选择--</option>
		<option value="1">入门</option>
		<option value="2">一般</option>
		<option value="3">熟练</option>
		<option value="4">精通</option>
	</select>
	<br /> 特点描述:
	<input type="text" name="resumePersonality" value="${resume.resumePersonality }"/>
	<br /> 自我评价:
	<input type="text" name="resumeSelfEvaluation" value="${resume.resumeSelfEvaluation }"/>
	<br /> 身高:
	<input type="text" name="resumeHeight" value="${resume.resumeHeight }"/>
	<br /> 体重:
	<input type="text" name="resumeWeight" value="${resume.resumeWeight }"/>
	<br />
	<input type="submit" value="修改"/>
	<input type="reset" value="重置"/>
	</form>
	<a href="javascript:history.go(-1)">返回</a>
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
		var resumeFLAbility = $("#resumeFLAbility").val();
		var resumeFLType = $("#resumeFLType").val();
		var resumeEnglishGrade = $("#resumeEnglishGrade").val();
		var resumeComputerAbility = $("#resumeComputerAbility").val();

		//find("option").eq(resumeFLAbility).attr("selected",selected);
		//$("#select_id ").get(0).selectedIndex=1;//设置Select索引值为1的项选中
		$(document).ready(function(){
			$(function(){
				$(".resumeFLAbility").val(resumeFLAbility);
				$(".resumeFLType").val(resumeFLType);
				$(".resumeEnglishGrade").val(resumeEnglishGrade);
				$(".resumeComputerAbility").val(resumeComputerAbility);
			});
		});
		
	</script>


</body>
</html>