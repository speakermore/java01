<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-12">
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-sm-11">
					<div class="col-sm-12">
						<c:if test="${user.id<1234567890 }">
						<a href="javascript:ajaxPage('company/cmprs/recruit_index')">
							返回<em class="glyphicon glyphicon-send"></em>
						</a>
						</c:if>
						<c:if test="${user.id>=1234567890 }">
						<a href="personal/common/initIndex?userId=${user.id }">
							返回<em class="glyphicon glyphicon-send"></em>
						</a>
						</c:if>
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
						<c:if test="${user.id<1234567890 }">
						<a href="javascript:ajaxPage('company/cmprs/recruit_index')">
							返回<em class="glyphicon glyphicon-send"></em>
						</a>
						</c:if>
						<c:if test="${user.id>=1234567890 }">
						<a href="personal/common/initIndex?userId=${user.id }">
							返回<em class="glyphicon glyphicon-send"></em>
						</a>
						</c:if>
					</th>
				</tr>
			</table>
		</div>
	</div>
	<div>
	<c:if test="${user.id>=1234567890 }">
		<div class="col-sm-offset-3 col-sm-5">
		<a href="javascript:iWantRecruit()" class="btn btn-success form-control">我要应聘</a>
		</div>
		<script>
			var iWantRecruit=function(){
				$.ajax({
					url:'common/apply/i_want_apply/${cmpr.id}',
					type:'POST',
					dataType:'text',
					success:function(data){
						alert(data);
						location.href='personal/common/initIndex?userId=${user.id}';
					},
					error:function(ajaxobject,err,ex){
						alert(err);
					}
				});
			}
		</script>
	</c:if>
	</div>
</div>