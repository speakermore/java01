<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="tabbable" id="tabs">
	<ul class="nav">
		<li class="active"><a
			href="javascript:ajaxPage('personal/user/personal_index_myNewly')">我的动态</a>
		</li>
		<li><a
			href="javascript:ajaxPage('personal/user/personal_index_myResume')">我的简历</a></li>
		<c:if test="${user.userRealName=='无' }">
			<li>
				<!-- <a href="personal/user/addUserReal">实名认证</a> --> <a
				href="javascript:ajaxPage('personal/user/personal_register_real')">实名认证</a>
			</li>
		</c:if>
		<c:if test="${user.userName=='无' }">
			<li>
				<!-- <a href="personal/user/addUserOther">完善资料</a> --> <a
				href="javascript:ajaxPage('personal/user/personal_register_other')">完善信息</a>
			</li>
		</c:if>
		<li><a
			href="javascript:ajaxPage('personal/user/personal_update_user')">修改用户信息</a></li>
		<li><a
			href="javascript:deleteRecord('personal/user/personal_delete')">查看删除记录</a></li>
		<li><a
			href="javascript:ajaxPage('personal/user/personal_index_myPassword')">我的密码</a></li>
		<li><a href="#panel-shareAmount">分享额度</a></li>
		<li><a href="#panel-rechargeAmount">充值额度</a></li>
		<li><a href="#panel-blockedCompany">我屏蔽的公司</a></li>
		<li><a
			href="javascript:ajaxPage('personal/follow/personal_company_followlist')">我关注的公司</a>
		</li>
		<li><a href="#panel-followMeCompany">关注我的公司</a></li>
		<li><a
			href="javascript:ajaxPage('personal/resume/personal_index_mySendResume')">我投过的简历</a>
		</li>
		<li><a
			href="javascript:ajaxPage('personal/resume/personal_index_myReceiveOffer')">我收到的邀请</a>
		</li>
		<li><a
			href="javascript:ajaxPage('crowdfund/mySendCrowdfund_index')">我发布的众筹</a>
		</li>
		<li><a
			href="javascript:ajaxPage('crowdfund/myJoinCrowdfund_index')">我参加的众筹</a>
		</li>
		<li><a href="#panel-myReleaseStartup">我发布的创业</a></li>
		<li><a href="#panel-myParticipateStartup">我参加的创业</a></li>
		<li><a
			href="javascript:ajaxPage('personal/user/personal_index_myArticle')">我发表的文章</a></li>
		<li><a href="#panel-myEvaluate">我的评价</a></li>
	</ul>
</div>

<script type="text/javascript">
	var ajaxPage = function(page) {
		$.ajax({
			url : "personal/user/ajax",
			data : "page=" + page,
			type : "POST",
			dataType : "html",
			success : function(data) {
				$("#my-content").html(data);
			}
		});
	}
	var deleteRecord = function(page) {
		$.ajax({
			url : "personal/common/deleteRecord",
			data : "toPage=1&page=" + page,
			type : "POST",
			dataType : "html",
			success : function(data) {
				$("#my-content").html(data);
			}
		});
	}
</script>
