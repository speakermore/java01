<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SEX" value="${CommonStatus.SEX }"></c:set>
<div class="col-sm-12">
	<c:forEach items="${applyList }" var="apply">
	<div class="col-sm-6">
		<div class="media">
			<div class="userlist_top">
				<div class="media-left">
					<img onerror="javascript:this.src='img/head.gif'" src="img/upload/personal/${apply.userLoginId }/${apply.resumeHeadImg}" width="105" height="105" class="media-object img-thumbnail img-circle" />
				</div>
				<div class="media-body">
					<h4>${apply.resumeName }</h4>
					<p>${SEX[apply.resumeGender] },${apply.resumeMajor }</p>
					<p>期望月薪：${apply.resumeWages }</p>
					<p>联系电话：${apply.resumePhone }</p>
					<div class="btn-group btn-group-sm" role="group">
						<a role="button" href="javascript:ajaxPage('redirect:/common/apply/check_resume/${apply.resumeId }/${apply.userLoginId }/${apply.applyId}')" class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search"></span>查看简历
						</a>
						<a role="button" href="javascript:ajaxPage('redirect:offer/add_offer?applyId=${apply.applyId }')" class="btn btn-default">
						<span class="glyphicon glyphicon-send"></span>发送Offer
						</a>
						<c:if test="${apply.isFollowed==1 }">
						<a class="btn btn-default" role="button" href="javascript:cancelfollow(${apply.userId })">
						<span class="glyphicon glyphicon-minus"></span>取消关注
						</a>
						</c:if>
						<c:if test="${apply.isFollowed==0 }">
						<a role="button" class="btn btn-default" role="button" href="javascript:addfollow(${apply.userId })">
						<span class="glyphicon glyphicon-plus"></span>关注
						</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
	<div class="row">
		<div class="col-sm-offset-8 col-sm-4" style="margin-top:100px">
			<a href="javascript:ajaxPage('company/cmprs/recruit_index')" class="btn btn-default"><span class="glyphicon glyphicon-level-up"></span>返回</a>
		</div>
	</div>
</div>