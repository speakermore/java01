<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>名企招聘</title>
</head>
<body>
	<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
	<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-1 column"></div>
			<div class="col-md-10 column">
				<table class="table">
				<colgroup>
						<col style="width: 30%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
				<thead>
					<tr>
						<th>
							求职意向
						</th>
						<th>
							姓名
						</th>
						<th>
							性别
						</th>
						<th>
							年龄
						</th>
						<th>
							工作经验
						</th>
						<th>
							学历
						</th>
						<th>
							
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${userAndResumes }" var="uar">
					<tr>
						<td>
							<a href="#">${uar.resumeJor }</a>
						</td>
						<td>
							${uar.userRealName }
						</td>
						<td>
							${SEX[uar.userGender] }
						</td>
						<td>
							${uar.userBirthday }
						</td>
						<td>
							${uar.resumeWorks }
						</td>
						<td>
							${uar.resumeEducation }
						</td>
						<td>
							<a href="personal/follow/addUserFollow?byFollowId=${uar.id }">关注</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="col-md-1 column"></div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>