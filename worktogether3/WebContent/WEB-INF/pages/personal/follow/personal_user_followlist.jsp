<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>我的关注</title>
</head>
<body>
	<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
	<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-1 column"></div>
			<div class="col-md-10 column">
			<div class="tabbable" id="tabs-userList">
				<ul class="nav nav-tabs">
					<li>
						 <a href="#panel-user" data-toggle="tab">我关注的用户</a>
					</li>
					<li class="active">
						 <a href="#panel-company" data-toggle="tab">我关注的企业</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="panel-user">
						<p>
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
				<c:forEach items="${OldFollows }" var="fol">
					<tr>
						<td>
							<a href="#">${fol.resumeJor }</a>
						</td>
						<td>
							${fol.userRealName }
						</td>
						<td>
							${SEX[fol.userGender] }
						</td>
						<td>
							${fol.userBirthday }
						</td>
						<td>
							${fol.resumeWorks }
						</td>
						<td>
							${fol.resumeEducation }
						</td>
						<td>
							<a href="javascript:ajaxDeleteFollow(${fol.id })">取消关注</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
						</p>
					</div>
					<div class="tab-pane active" id="panel-company">
						<p>
							<%@include file="/WEB-INF/pages/personal/follow/personal_company_followlist.jsp" %>
						</p>
					</div>
				</div>
			</div>
			</div>
			<div class="col-md-1 column"></div>
		</div>
	</div>
	<script type="text/javascript">
			var ajaxDeleteFollow=function(id){
				$.ajax({
					url:"personal/follow/cancelUserFollow?byFollowId="+id,
					dataType:"json",
					success:function(data){
						alert(data.operatorInfo);
						
					}
				});
			}
	</script>
</body>
</html>