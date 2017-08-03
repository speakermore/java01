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
				<div class="panel">
					<div class="panel-title">
						<h4>软件开发类</h4>
					</div>
					<ul class="panel-body list-inline">
						<li><a href="#">技术总监</a></li>
						<li><a href="#">项目经理</a></li>
						<li><a href="#">工程师</a></li>
						<li><a href="#">程序员</a></li>
					</ul>
				</div>
				<div class="panel">
					<div class="panel-title">
						<h4>软件测试类</h4>
					</div>
					<ul class="panel-body list-inline">
						<li><a href="#">测试工程师</a></li>
						<li><a href="#">测试员</a></li>
					</ul>
				</div>
				<div class="panel">
					<div class="panel-title">
						<h4>页面设计类</h4>
					</div>
					<ul class="panel-body list-inline">
						<li><a href="#">美工</a></li>
						<li><a href="#">UI设计师</a></li>
						<li><a href="#">Web前端工程师</a></li>
					</ul>
				</div>
				<!--职位分类结束-->
				<!--明星企业展示-->
				<div class="work-together-title">
					<span>明星企业</span>
				</div>
				<div class="panel">
					<div class="panel-title text-right">
						<div class="work-together-company-img"><img width="160" height="40" src="img/zgyt_logo.png" /></div>
						<a class="work-together-more" href="">更多>></a>
					</div>
					<ul type="square" class="panel-body list-unstyled" style="clear:both">
						<li class="text-right"><a href="">
							<span style="float:left;">Java软件工程师</span>
							<span>昆明</span>
						</a></li>
						<li class="text-right"><a href="">
							<span style="float:left;">UI设计师/美工</span>
							<span>昆明</span>
						</a></li>
					</ul>
				</div>
				<div class="panel">
					<div class="panel-title text-right">
						<div class="work-together-company-img"><img width="160" height="40" src="img/jdy_logo.png" /></div>
						<a class="work-together-more" href="">更多>></a>
					</div>
					<ul type="square" class="panel-body list-unstyled" style="clear:both">
						<li class="text-right"><a href="">
							<span style="float:left;">Java技术总监/Java前端开发</span>
							<span>昆明</span>
						</a></li>
						<li class="text-right"><a href="">
							<span style="float:left;">测试项目经理/测试工程师</span>
							<span>昆明</span>
						</a></li>
					</ul>
				</div>
				<div class="panel">
					<div class="panel-title text-right">
						<div class="work-together-company-img"><img width="160" height="40" src="img/nskj_logo.png" /></div>
						<a class="work-together-more" href="">更多>></a>
					</div>
					<ul type="square" class="panel-body list-unstyled" style="clear:both">
						<li class="text-right"><a href="">
							<span style="float:left;">销售总监/销售经理/销售助理</span>
							<span>昆明</span>
						</a></li>
						<li class="text-right"><a href="">
							<span style="float:left;">大客户经理/培训工程师/培训师</span>
							<span>昆明</span>
						</a></li>
					</ul>
				</div>
				<!--明星企业展示结束-->