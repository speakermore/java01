<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
<title>发出的面试邀请</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>

<!-- 上边栏 -->
<%@include file="/WEB-INF/pages/nav.jsp" %>
<div class="container">
	<div class="row clearfix">
		
		<!-- 左边栏 -->
		<div class="col-sm-3"><%@include file="/WEB-INF/pages/company/menu.jsp" %></div>
		
		<!-- offer列表 -->
		<div class="col-sm-9">
			<div class="col-sm-12 col-sm-offset-0">
			
				<table class="table table-hover">
					<caption>发出的面试邀请</caption>
					<thead>
						<tr>							
							<th>应聘者名</th>
							<th>招聘岗位</th>
							<th>面试日期</th>
							<th>面试时间</th>
							<th>邀请状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${offer }" var="o">
						<tr>
							<!-- 点击查看详细信息 -->
							<td><a href="offer/company_offer_detail/${o.id }">${o.userName }</a></td>
							<td>${o.offerJob }</td>
							<td><fmt:formatDate value="${o.offerInvitationTime }" pattern="yyyy年MM月dd日"/></td>
							<td><fmt:formatDate value="${o.offerInvitationTime }" pattern="HH点mm分"/></td>
							<td>
								<c:if test="${o.offerAction==1 }">您尚未查看</c:if>
								<c:if test="${o.offerAction==2 }">已接受邀请</c:if>
								<c:if test="${o.offerAction==3 }">已拒绝邀请</c:if>
								<c:if test="${o.offerAction==4 }">您尚未决定</c:if>
							</td>
						</tr>
						</c:forEach>
					</tbody>					
				</table>
				
				<!-- 翻页，最多显示5页 -->
				<hr/>				
				<ul class="pager">				
					<li><a href="offer/company_offer_list/1">首页</a></li>
					
					<c:if test="${page>1 }">
						<li><a href="offer/company_offer_list/${page-1 }">&laquo;</a></li>
					</c:if>
						
					<c:if test="${maxPage<=5 }">
						<c:forEach begin="${1 }" end="${maxPage }" var="i">
						<li><a href="offer/company_offer_list/${i }">${i }</a></li>
						</c:forEach>
					</c:if>
						
					<c:if test="${maxPage>5 }">
						<c:if test="${page<=3 }">
							<c:forEach begin="${1 }" end="${5 }" var="i">
							<li><a href="offer/company_offer_list/${i }">${i }</a></li>
							</c:forEach>
						</c:if>
						
						<c:if test="${3<page && page<maxPage-2 }">
							<c:forEach begin="${page-2 }" end="${page+2 }" var="i">
							<li><a href="offer/company_offer_list/${i }">${i }</a></li>
							</c:forEach>
						</c:if>
						
						<c:if test="${maxPage-2<=page && page<=maxPage }">
							<c:forEach begin="${maxPage-4 }" end="${maxPage }" var="i">
							<li><a href="offer/company_offer_list/${i }">${i }</a></li>
							</c:forEach>
						</c:if>
					</c:if>
						
					<c:if test="${page<maxPage }">
						<li><a href="offer/company_offer_list/${page+1 }">&raquo;</a></li>
					</c:if>
					
					<li><a href="offer/company_offer_list/${maxPage }">尾页</a><li>
					
					<!-- 页面跳转，只能输入数字 -->
					<li>
						第${page }页/共${maxPage }页						
						<input style="width:30px" name="jumpPage" id="jumpPage"
							onkeyup="value=value.replace(/[^\d]/g,'')"
							onblur="value=value.replace(/[^\d]/g,'')">
						<a href="javascript:jump()">跳转</a>
					</li>				
				</ul>
				
				<!-- 返回 -->
				<hr/>
				<div class="form-group">
					<div class="col-sm-1 col-sm-offset-11">
						<a class="btn btn-warning" href="javascript:history.back()">返回</a>
					</div>
				</div>
				
				<a href="offer/user_offer_list/1">测试专用</a>
					
			</div>
		</div>
	</div>
</div>

<script>
// 加载页面时焦点为跳转页面输入框
window.onload=function(){
	document.getElementById("jumpPage").focus();
}

// 页面跳转，排除错误页码
function $(id){
	return document.getElementById(id);
} 
function jump(){
	var page=$("jumpPage").value;
    var max=${maxPage };
    if(page<1 || page>max){
        alert('页码错误');
        document.getElementById("jumpPage").focus();
        jumpPage.value='';
    }else{
    	location.href="offer/company_offer_list/"+page;
    }
}	
</script>

</body>
</html>