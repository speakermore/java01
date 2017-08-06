<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
<title>软件人才</title>
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-1 column"></div>
			<div class="col-md-10 column">
				<table class="table">
				<colgroup>
						<col style="width: 20%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
				<thead>
					<tr>
						<th>
							目前岗位
						</th>
						<th>
							昵称
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
							${uar.userName }
						</td>
						<td>
							${SEX[uar.userGender] }
						</td>
						<td>
						<label>${uar.age}</label>岁
						</td>
						<td>
							${uar.works}年
						</td>
						<td>
							${uar.resumeEducation }
						</td>
						<td>
							<input id="followUserId" type="hidden" value="${uar.id}" />
							<c:if test="${uar.isFoucse==true}"><label>已关注</label></c:if>
							<c:if test="${uar.isFoucse==false}">
								<a id="followUser" href="javascript:ajaxFollow(${uar.id})">关注</a>
							</c:if>
							
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
			var ajaxFollow=function(id){
				$.ajax({
					url:"personal/follow/addUserFollow?byFollowId="+id,
					dataType:"json",
					success:function(data){
						alert(data.operatorInfo);
						$("[href='javascript:ajaxFollow("+id+")']").replaceWith('<label>已关注</label>');
						/* $("[href='javascript:ajaxFollow("+id+")']").html('<label>已关注</label>'); */
					}
				});
			}
	</script>
</body>
</html>