<%@ page language="java" import="ynjh.common.util.CommonStatus" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${CommonStatus.SEX }" var="SEX"></c:set>
<c:set var="COMPANY_SIZE" value="${CommonStatus.COMPANY_SIZE }"></c:set>
<style type="text/css">
img {
	padding: 10px;
	padding-right: 20px;
}

.media {
	border-radius: 5px;
	border: 2px solid #E7E7E7;
	box-shadow: 0 2px 0 #F3F3F3;
}

.userlist_top {
	padding: 20px;
}

.userlist_botten {
	height: 48px;
	border-top: 1px solid #E7E7E7;
	line-height: 22px;
	padding-top: 5px;
	color: #999;
	overflow: hidden;
}
.media-body{
	padding-left:10px;
}

.userlist_space {
	margin-bottom: 10px;
}
.tab-pane{
	margin-top:10px;
}
</style>
<div class="col-sm-12">
	<div class="tabbable" id="tabs-userList">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#panel-person" data-toggle="tab">我关注的个人</a></li>
			<li><a href="#panel-company" data-toggle="tab">我关注的企业</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="panel-person">
					<c:forEach items="${userFollows }" var="fol">
					<div class="col-sm-6 userlist_space">
						<div class="media">
							<div class="userlist_top">
								<div class="pull-left">
									<img onerror="javascript:this.src='img/head.gif'" src="img/upload/personal/${fol.userLoginId }/${fol.userHeadImgPath}" width="105" height="105" class="img-thumbnail img-circle" />
								</div>
								<div class="media-body">
									<h4>${fol.userName }</h4>
									<p>${SEX[fol.userGender] },${fol.age }岁,${fol.resumeJor }</p>
									<p>工作经验${fol.workAge }年</p>
									<div class="btn-group">
										<%-- <a href="personal/common/gotoCompanyById?id=${cf.byFollowId }" class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-align-left"></span>进入
										</a> --%>
										<a class="btn btn-default" role="button" href="javascript:cancelfollow(${fol.byFollowId },${user.id })">
										<span class="glyphicon glyphicon-minus"></span>取消关注
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
		</div>
		<div class="tab-pane" id="panel-company">
			<%@include file="/WEB-INF/pages/personal/follow/personal_company_followlist.jsp" %>
		</div>
		</div>
	</div>
</div>