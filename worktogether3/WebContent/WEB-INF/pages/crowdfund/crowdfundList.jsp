<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base
	href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="shortcut icon" href="img/21495074072_.pic.png" href="img/21495074072_.pic.png" type="image/x-icon" >
<title>众筹列表</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="css/bootstrap.min.css"></script>
<style type="text/css">
	#sou{
		width:300px;
		margin: 0 auto;
		text-align:center;
		padding-top:30px;
		padding-bottom: 40px;
	}
	.input_info{
		padding-top: 10px;
	}
	td a{
		color: black;
	}
	td a:hover{
		color:#fe6000;
		text-decoration: none;
	}
	
</style>
</head>
                                                            
<body> 
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div id="sou">
		<form action="crowdfund/crowdfundSou" method="post">
			 <div class="input-group col-xs-12">
	            <input style="border: 1px #fa941b solid" id="sousou" type="text" name="interesting" class="form-control" placeholder="众筹搜索">
	            <span class="input-group-addon" style="background-image: linear-gradient(to bottom,#fa941b,#fe6000);">
	            	<button style="border:none;background: none" type="submit"><span style="color: white;" class="glyphicon glyphicon-search"></span></button>
	            </span>
	        </div>
	         <div class="input-group input_info">
	         	<a href="crowdfund/crowdfundLikeList">猜你喜欢</a>
				<a href="crowdfund/crowdfundAllList?page=1">所有众筹</a>
	         </div>
		</form>
	</div>
	<div class="col-sm-1 col-xs-hidden"></div>
	<div class="col-sm-10 col-xs-12">
	<table class="table table-hover table-striped">
		<tr>
			<th>众筹项目</th>
			<th>发布类型</th>
			<th>项目金额</th>
			<th>发布时间</th>
			<th>众筹状态</th>
		</tr>
		<%--众筹推荐列表 --%>
		<c:if test="${crowdfundTopList!=null}">
			<c:forEach items="${crowdfundTopList}" var="cf">
			<c:if test="${cf.crowdfundProjectEndDate.time>=now.time}">
			<tr>
				<td><a href="crowdfund/crowdfundOnlyInfo?id=${cf.id}">${cf.crowdfundProjectName}</a></td>
				<td>
					<c:if test="${cf.publisherId<1234567891}">
						企业
					</c:if>
					<c:if test="${cf.publisherId>1234567890}">
						个人
					</c:if>
				</td>
				<td><fmt:formatNumber value="${cf.crowdfundProjectMoney}" pattern="##,###,###.00元"></fmt:formatNumber></td>
				<td><fmt:formatDate value="${cf.crowdfundProjectStartDate}" pattern="yyyy年MM月dd日 E"/> </td>
				<c:if test="${cf.crowdfundProjectState==1}">
					<td>众筹中</td>
				</c:if>
				<c:if test="${cf.crowdfundProjectState==2}">
					<td>众筹结束</td>
				</c:if>
			</tr>
			</c:if>
			</c:forEach>
		</c:if>
		
		<%--所有众筹列表--%>
		<c:if test="${crowdfundAllList!=null}">
			<c:forEach items="${crowdfundAllList}" var="cf">
			<c:if test="${cf.crowdfundProjectEndDate.time>=now.time}">
			<tr>
				<td><a href="crowdfund/crowdfundOnlyInfo?id=${cf.id}">${cf.crowdfundProjectName}</a></td>
				<td>
					<c:if test="${cf.publisherId<1234567891}">
						企业
					</c:if>
					<c:if test="${cf.publisherId>1234567890}">
						个人
					</c:if>
				</td>
				<td><fmt:formatNumber value="${cf.crowdfundProjectMoney}" pattern="##,###,###.00元"></fmt:formatNumber>  </td>
				<td><fmt:formatDate value="${cf.crowdfundProjectStartDate}" pattern="yyyy年MM月dd日 E"/> </td>
				<c:if test="${cf.crowdfundProjectState==1}">
					<td>众筹中</td>
				</c:if>
				<c:if test="${cf.crowdfundProjectState==2}">
					<td>众筹结束</td>
				</c:if>
			</tr>
			</c:if>
			</c:forEach>
			<tr style="background: none">
			<td colspan="2"></td>
			<td colspan="3">
			<%--分页 --%>
			<ul class="pagination">
				<%--上一页限制 --%>
				<c:if test="${page==1}">
						<li class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
				</c:if>
				<c:if test="${page!=1}">
					<li><a href="crowdfund/crowdfundAllList?page=${page-1}">&laquo;</a></li>
				</c:if>
				<!-- 显示页码 -->
				<c:forEach begin="1" end="${pageNums}" varStatus="status">
					<c:if test="${page==status.index}">
						<li class="active"><a href="javascript:void(0)">${status.index}</a></li>
					</c:if>
					<c:if test="${page!=status.index&&status.index<6}">
						<li class=""><a href="crowdfund/crowdfundAllList?page=${status.index}">${status.index}</a></li>
					</c:if>
					<c:if test="${page!=status.index&&status.index>5}">
						<li class="more"><a title="显示更多" href="javascript:void(0)">更多</a></li>
						<li style="display: none;" class="moreli"><a href="crowdfund/crowdfundAllList?page=${status.index}">${status.index}</a></li>
					</c:if>
				</c:forEach>
			
				<c:if test="${page<pageNums}">
					<li><a href="crowdfund/crowdfundAllList?page=${page+1}">&raquo;</a></li>
				</c:if>
			
				<c:if test="${page==pageNums}">
					<li class="disabled"><a href="javascript:void(0)">&raquo;</a></li>
				</c:if>
			</ul>
			</td>
			</tr>
		</c:if>
	
		<%--用户搜索 --%>
		
		<c:if test="${wantList!=null}">
			<c:forEach items="${wantList}" var="cf">
			<c:if test="${cf.crowdfundProjectEndDate.time>=now.time}">
			<tr>
				<td><a href="crowdfund/crowdfundOnlyInfo?id=${cf.id}">${cf.crowdfundProjectName}</a></td>
				<td>
					<c:if test="${cf.publisherId<1234567891}">
						企业
					</c:if>
					<c:if test="${cf.publisherId>1234567890}">
						个人
					</c:if>
				</td>
				<td><fmt:formatNumber value="${cf.crowdfundProjectMoney}" pattern="##,###,###.00元"></fmt:formatNumber>  </td>
				<td><fmt:formatDate value="${cf.crowdfundProjectStartDate}" pattern="yyyy年MM月dd日 E"/> </td>
				<c:if test="${cf.crowdfundProjectState==1}">
					<td>众筹中</td>
				</c:if>
				<c:if test="${cf.crowdfundProjectState==2}">
					<td>众筹结束</td>
				</c:if>
			</tr>
			</c:if>
			</c:forEach>
		</c:if>
		
	</table>
	<%--无消息提醒 --%>
	<div id="showTips" style="display: none;">
		<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">
				&times;
			</button>
			Tips:亲！你的要找的内容不在服务区，换个关键词试试，比如：java、软件开发等！
		</div>
	</div>
	</div>
<script type="text/javascript">
	$(function(){
		//输入框动画
		$("#sou").click(function(){
			$(this).animate({width:"500px"},"fadeIn");
		});
		 if($("table tr td:first").text().length===0){
			 $("#showTips").css("display","block"); 
		}
		
	});
</script>
</body>
</html>