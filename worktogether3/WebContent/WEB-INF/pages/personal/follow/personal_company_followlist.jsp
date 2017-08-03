<%@ page language="java" import="ynjh.common.util.CommonStatus" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<c:forEach items="${companyFollows }" var="cf">
<div class="col-sm-6 userlist_space">
	<div class="media">
		<div class="userlist_top">
			<div class="pull-left">
				<img onerror="javascript:this.src='img/head.gif'" src="company/img/${cf.companyLoginId }/${cf.companyLogo}" width="105" height="105"  class="img-thumbnail img-circle" />
			</div>
			<div class="media-body">
				<h4>${cf.companySimpleName }</h4>
				<p>公司规模：${COMPANY_SIZE[cf.cmpIntPeopleNum]}</p>
			</div>
			<p>${cf.cmpIntroduction.substring(0,80) }...</p>
				<div class="btn-group">
					<%-- <a href="personal/common/gotoCompanyById?id=${cf.byFollowId }" class="btn btn-default" type="button">
					<span class="glyphicon glyphicon-align-left"></span>进入
					</a> --%>
					<a class="btn btn-default" role="button" href="javascript:cancelfollow(${cf.byFollowId },${user.id })">
						<span class="glyphicon glyphicon-minus"></span>取消关注
					</a>
				</div>
		</div>
	</div>
</div>
</c:forEach>	


