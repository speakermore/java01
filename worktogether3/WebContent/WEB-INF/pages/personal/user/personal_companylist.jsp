<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>名企招聘</title>
<%@include file="/WEB-INF/pages/personal/common/header.jsp"%>
<%@include file="/WEB-INF/pages/personal/common/footor.jsp"%>
<style type="text/css">
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
</head>
<body>
	<%@include file="/WEB-INF/pages/nav.jsp"%>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-1 column"></div>
			<div class="col-md-10 column">
				<div class="row clearfix">
					<c:forEach items="${companyeList }" var="cl">
						<div class="col-md-6 column userlist_space">
							<div class="media">
								<div class="userlist_top ">
									<div class="pull-left">
										<c:if test="${cl.companyLogo=='null' }">
											<img src="img/head.gif" class="img-circle" width="105"
												height="105" alt='公司logo' style="display:none" onload="this.style.display=''"/>
										</c:if>
										<c:if test="${cl.companyLogo!=null }">
											<img onerror="javascript:this.src='img/head.gif'"  src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${cl.companyLoginId }/${cl.companyLogo}"
												width="105" height="105" style="display:none" onload="this.style.display=''" class="img-circle" alt='公司logo' />
										</c:if>
									</div>
									<div class="media-body">
										<p class="form-control-static companyName">
											<c:if test="${fn:length(cl.companyName)>16 }">  
                         			${fn:substring(cl.companyName, 0, 16)}...  
                   				</c:if>
											<c:if test="${fn:length(cl.companyName)<=16 }">  
                         			${cl.companyName}  
                  			 	</c:if>
										</p>
										<p class="form-control-static companySummary">
											<c:if test="${fn:length(cl.companySimpleName)>16 }">  
                         			${fn:substring(cl.companySimpleName, 0, 16)}...  
                   				</c:if>
											<c:if test="${fn:length(cl.companySimpleName)<=16 }">  
                         			${cl.companySimpleName}  
                  			 	</c:if>
											/${cl.cmpIntInsurance}/${cl.cmpIntComforts}/${cl.cmpIntRest}
										</p>
										<p class="form-control-static">
											简称：
											<c:if test="${fn:length(cl.cmpIntroduction)>20 }">  
                         			${fn:substring(cl.cmpIntroduction, 0, 20)}...  
                   				</c:if>
											<c:if test="${fn:length(cl.cmpIntroduction)<=20 }">  
                         			${cl.cmpIntroduction}  
                  			 	</c:if>
										</p>
										<div class="btn-group">
											<a href="personal/common/gotoCompanyById?id=${cl.id }"
												class="btn btn-default" type="button"> <em
												class="glyphicon glyphicon-align-left"></em>进入
											</a> 
											<c:if test="${cl.isFoucse==true}"><label class="btn btn-default"><em
												class="glyphicon glyphicon-align-right"></em>已关注</label></c:if>
											<c:if test="${cl.isFoucse==false}">
											<a href="javascript:ajaxFollow(${cl.id})" class="btn btn-default" type="button"> <em
												class="glyphicon glyphicon-align-right"></em>关注
											</a></c:if>
										</div>

									</div>
								</div>
								<div class="userlist_botten"></div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-1 column"></div>
		</div>
	</div>
	<script type="text/javascript">
			var ajaxFollow=function(id){
				$.ajax({
					url:"personal/follow/addCompanyFollow?byFollowId="+id,
					dataType:"json",
					success:function(data){
						alert(data.operatorInfo);
						$("[href='javascript:ajaxFollow("+id+")']").replaceWith("<label class=\'btn btn-default\'><em class=\'glyphicon glyphicon-align-right\'></em>已关注</label>");
						/* $("[href='javascript:ajaxFollow("+id+")']").html('<label>已关注</label>'); */
					}
				});
			}
	</script>
</body>
</html>