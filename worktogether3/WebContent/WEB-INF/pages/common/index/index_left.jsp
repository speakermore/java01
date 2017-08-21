<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 最新资讯 -->
				<div class="work-together-title">
					<span>最新资讯</span>
					<c:if test="${newses10==null }">
						<!-- 查询最新前10篇资讯 -->
						<jsp:forward page="/admin/news/find_news_10"></jsp:forward>
					</c:if>
				</div>
				<div class="panel">
					<ol class="panel-body list-unstyled">
						<c:forEach items="${newses10 }" var="news">
							<li class="work-together-cut-text"><fmt:formatDate value="${news.newsDate }" pattern="MM.dd"/><a href="admin/news/news/${news.id }" title="${news.newsTitle }">${news.newsType} ${news.newsTitle }</a></li>
						</c:forEach>
					</ol>
				</div>
				<!-- 最新资讯结束 -->
				<!--职位分类开始-->
				<div class="work-together-title">
					<span>职位分类</span>
				</div>
				<c:forEach items="${myJobs }" var="myJob1">
				<div class="panel">
					<div class="panel-title">
						<h4>${myJob1.jobName }</h4>
					</div>
					<ul class="panel-body list-inline">
						<c:forEach items="${myJob1.subJobs }" var="myJob2">
						<li><a href="#">${myJob2.jobName }</a></li>
						</c:forEach>
					</ul>
				</div>
				</c:forEach>
				<!--职位分类结束-->
				<!--明星企业展示-->
				<div class="work-together-title">
					<span>推荐企业</span>
				</div>
				<c:forEach items="${recommendCompanys}" var="cmp">
				<div class="panel">
					<div class="panel-title text-right">
						<div class="work-together-company-img"><img width="160" height="40" src="company/img/${cmp.companyLoginId }/${cmp.companyLogo}" /></div>
						<a class="work-together-more" href="">更多>></a>
					</div>
					<ul type="square" class="panel-body list-unstyled" style="clear:both">
						<c:forEach items="${cmp.reCruits }" var="recruit">
						<li class="text-right"><a href="">
							<span style="float:left;">${recruit.cmpRecTitle}</span>
							<span>${recruit.cmpRecCity }</span>
						</a></li>
						</c:forEach>
					</ul>
				</div>
				</c:forEach>
				<!--明星企业展示结束-->