<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/thirdpart/ckeditor/ckeditor.js"></script>
<title>用户前台-发表招聘信息</title>
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<%@include file="/WEB-INF/pages/company/footer.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-sm-3 column">
				<%@include file="/WEB-INF/pages/company/menu.jsp"%>
			</div>
			<div class="col-sm-9 column">
				<form method="post"
					action="company/cmprs/companyRecruit/add_companyRecruit">
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>招聘标题</th>
								<th>招聘薪资</th>
								<th>学历需求</th>
								<th>需求人数</th>
							</tr>
						</thead>
						<tr>
							<td><input type="text" class="form-control"
								name="cmpRecTitle" value="${cmpr.cmpRecTitle } " maxlength="20"/>
							</td>
							<td><input type="text" class="form-control"
								name="cmpRecWage" value="${cmpr.cmpRecWage} " maxlength="20"/>
							</td>
							<td><input type="text" class="form-control"
								name="cmpRecEducation" value="${cmpr.cmpRecEducation}" maxlength="10"/>
							</td>
							<td><input type="text" class="form-control"
								name="cmpRecPeople" value="${cmpr.cmpRecPeople}" maxlength="11"/>
							</td>
						</tr>
					</table>
					<table class="table table-striped table-hover">
						<tr>
								<th>工作所需技能及水平描述</th>
						</tr>
						<tr>
						<td><textarea class="ckeditor" name="cmpRecExperience"
									value="${cmpRecExperience}" cols="20" rows="2"
									maxlength="500">
								</textarea> 
								<script type="text/javascript">
									CKEDITOR.replace('cmpRecExperience');
								</script>
							</td>
						</tr>
					</table>
					<div class="form-group">
						<div class="col-sm-9 col-sm-offset-3">
							<button type="submit" class="btn btn-primary">提交添加</button>
						</div>
					</div>
				</form>
			</div>
			</div>
			</div>
</body>
</html>