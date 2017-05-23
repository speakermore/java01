<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="COMPANY_SIZE" value="${CommonStatus.COMPANY_SIZE }"></c:set>

<title>名企招聘</title>
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

.userlist_space {
	margin-bottom: 10px;
}
</style>
<div class="row clearfix">
	<c:forEach items="${CompanyFollows }" var="cf">
		<div class="col-md-12 column userlist_space">
			<div class="media">
				<div class="userlist_top">
					<div class="pull-left">
						<c:if test="${cf.companyLogo=='null' }">
							<img src="img/head.gif" class="img-circle" width="105"
								height="105" alt='公司logo' style="display: none"
								onload="this.style.display=''" />
						</c:if>
						<c:if test="${cf.companyLogo!=null }">
							<img onerror="javascript:this.src='img/head.gif'"
								src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${cf.companyLoginId }/${cf.companyLogo}"
								width="105" height="105" style="display: none"
								onload="this.style.display=''" class="img-circle" alt='公司logo' />
						</c:if>
					</div>
					<div class="media-body">
						<p class="form-control-static">${cf.companyName }</p>
						<p class="form-control-static">${COMPANY_SIZE[cf.cmpIntPeopleNum]}</p>
						<p class="form-control-static">
							<c:if test="${fn:length(cf.cmpIntroduction)>80 }">  
                         			${fn:substring(cf.cmpIntroduction, 0, 80)}...  
                   				</c:if>
							<c:if test="${fn:length(cf.cmpIntroduction)<=80 }">  
                         			${cf.cmpIntroduction }  
                  			 	</c:if>
						</p>
						<div class="btn-group">
							<a href="personal/common/gotoCompanyById?id=${cf.byFollowId }"
								class="btn btn-default" type="button"> <em
								class="glyphicon glyphicon-align-left"></em>进入
							</a>
							<a class="btn btn-default" type="button">
								<em class="glyphicon glyphicon-align-right"></em>取消关注
							</a>
						</div>
					</div>
				</div>
				<div class="userlist_botten"></div>
			</div>
		</div>
	</c:forEach>
</div>

