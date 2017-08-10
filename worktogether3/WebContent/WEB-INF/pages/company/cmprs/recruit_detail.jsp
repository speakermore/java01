<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-12">
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-11">
					<div class="col-sm-12">
						<a href="javascript:ajaxPage('company/cmprs/recruit_index')">
							返回<em class="glyphicon glyphicon-send"></em>
						</a>
					</div>
					<div class="col-sm-12">
						<h2>${cmpr.cmpRecTitle }</h2>
					</div>
					<br />
					<div class="col-sm-12">
						${cmpr.cmpRecExperience }
					</div>
				</div>
			</div>
			<br />
			<table class="table">
				<tr>
					<th>
						<i class="glyphicon glyphicon-time"></i>&nbsp;<fmt:formatDate value="${cmpr.cmpRecTime }" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
						<a href="javascript:ajaxPage('company/cmprs/recruit_index')">
							<em class="glyphicon glyphicon-send">返回</em>
						</a>
					</th>
				</tr>
			</table>
		</div>
	</div>
	<div>
		<div class="col-sm-5"></div>
		<a href="#" class="cd-top">返回顶部</a>
	</div>
</div>