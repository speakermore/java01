<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>招聘信息列表</title>
<style type="text/css">
table{border-spacing:30px;}
td{padding:10px;font-family:Microsoft YaHei;}
.edit{padding:10px;}
</style>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css"/>
	 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/companyRecruit/cmpr-index.css"/>
     <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.10.2.min.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrapValidator.js"></script>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-3 column">
			<%@include file="/WEB-INF/pages/company/menu.jsp" %>
			</div>
			<div class="col-md-9 column">
			<ul>
			<li><a href="company/cmprs/companyRecruit/add_companyRecruit ">添加招聘信息</a>
			</li>
		</ul>
	<table>
		<tr>
			<td>文章标题</td>
			<td>公司薪资</td>
			<td>公司学历需求</td>
			<td>工作所需技能及水平描述</td>
			<td>需求人数</td>
			<td>发布时间</td>
		</tr>
		<c:if test="${companyRecruits==null}">
			<jsp:forward page="/company/cmprs/companyRecruit/findAll"></jsp:forward>
		</c:if>
		<c:forEach items="${companyRecruits }" var="cmpr">
			<tr>
				<td><a
					href="company/cmprs/companyRecruit/findById?id=${cmpr.id}&toPage=company/cmprs/companyRecruit_edit">${cmpr.cmpRecTitle}
					</a>
				</td>
				<td>${cmpr.cmpRecWage }</td>
				<td>${cmpr.cmpRecEducation }</td>
				<td>${cmpr.cmpRecExperience }</td>
				<td>${cmpr.cmpRecPeople }</td>
				<td>${cmpr.cmpRecTime }</td>
				
				<td>
						<a href="company/cmprs/companyRecruit/findById?id=${cmpr.id}&toPage=company/cmprs/companyRecruit_edit">编辑</a>
						<a href="company/cmprs/companyRecruit/hidden?id=${cmpr.id }">隐藏</a>
				</td>
			</tr>
		</c:forEach>
			<ul class="pagination">
				<c:if test="${curPage==null }">
					<c:set var="curPage" value="1"></c:set>
				</c:if>
				<c:if test="${curPage>1 }">
					<li><a href="company/cmprs/companyRecruit/findAll/?page=1">首页</a></li>
					<li><a href="company/cmprs/companyRecruit/findAll/?page=${curPage-1 }">上一页</a></li>
				</c:if>
				<c:if test="${curPage<maxPage }">
					<li><a href="company/cmprs/companyRecruit/findAll/?page=${curPage+1 }">下一页</a></li>
					<li><a href="company/cmprs/companyRecruit/findAll/?page=${maxPage }">尾页</a></li>
				</c:if>
			</ul>
					
			<%--<tr>
				
				<td colspan="5">
				<c:if test="${curPage==null }">
					<c:set var="curPage" value="1"></c:set>
				</c:if>
				<c:if test="${curPage>1 }">
					<a href="company/cmprs/companyRecruit/findAll/?page=1">首页</a>
					<a href="company/cmprs/companyRecruit/findAll/?page=${curPage-1 }">上一页</a>
				</c:if>
				<c:if test="${curPage<maxPage }">
					<a href="company/cmprs/companyRecruit/findAll/?page=${curPage+1 }">下一页</a>
					<a href="company/cmprs/companyRecruit/findAll/?page=${maxPage }">尾页</a>
				</c:if>
				</td>
			</tr>
	--%></table>
			</div>
			
		</div>
	</div>
		
</body>
</html>