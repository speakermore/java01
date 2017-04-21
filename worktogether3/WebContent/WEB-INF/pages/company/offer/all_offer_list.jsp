<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor_4.6.2_standard/ckeditor/ckeditor.js"> </script>
<title>offer列表</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
</head>
<body>
	<table>
		<tr>
			<td>查看详情&nbsp;&nbsp;&nbsp;</td>
			<td>企业名称&nbsp;&nbsp;&nbsp;</td>
			<td>招聘岗位&nbsp;&nbsp;&nbsp;</td>
			<td>面试时间&nbsp;&nbsp;&nbsp;</td>
			<td>发送时间&nbsp;&nbsp;&nbsp;</td>
			<td>邀请状态</td>
		</tr>
		<c:forEach items="${offer }" var="o">
		<tr>
			<td><a href="offer/user_offer_detail/${o.id }"><li></li></a>&nbsp;&nbsp;&nbsp;</td>
			<td>${o.companySimpleName }&nbsp;&nbsp;&nbsp;</td>
			<td>${o.offerJob}&nbsp;&nbsp;&nbsp;</td>
			<td>${o.offerInvitationTime}&nbsp;&nbsp;&nbsp;</td>
			<td>${o.offerSendTime}&nbsp;&nbsp;&nbsp;</td>
			<td>
				<c:if test="${o.offerAction==1}">您尚未查看</c:if>
				<c:if test="${o.offerAction==2}">已接受邀请</c:if>
				<c:if test="${o.offerAction==3}">已拒绝邀请</c:if>
				<c:if test="${o.offerAction==4}">您尚未决定</c:if>
			</td>
		</tr>
		</c:forEach>
	
		
		<tr>
			<td colspan="5">
			
			<c:if test="${page==null }">
					<c:set var="page" value="1"></c:set>
				</c:if>			
			<c:if test="${page>1 }">
				<a href="offer/findAll/1">首页</a>
				<a href="offer/findAll/${page-1 }">上一页</a>
			</c:if>
			
			<c:forEach begin="1" end="${maxPage }" var="i">
				<a href="offer/findAll/${i }">${i }</a>
			</c:forEach>
			
			<c:if test="${page<maxPage }">
				<a href="offer/findAll/${page+1 }">下一页</a>
				<a href="offer/findAll/${maxPage }">尾页</a>
			</c:if>
			
		<!-- 	<input type="text" id="flyPage"/>
			<a href="javascript:aaa()" id="go">跳转</a> -->
			</td>
		</tr>	
	
	<!-- <script type="text/javascript">
	function $(id){
		return document.getElementById(id);
		}
	var aaa=function(){
		var flyage=$("flyPage").value;
		location.href="findAll/"+flyage;
	}
	</script> -->
	
	<table>
	
</body>
</html>