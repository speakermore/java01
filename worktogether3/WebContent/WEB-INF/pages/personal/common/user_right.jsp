<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.CommonStatus" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
/* 头像样式  */
#headPhoto {
	border: 1px solid #9E9E9E;
	width: 100px;
	height: 100px;
}
/* panel-body的内边距设置 */
.panel-body {
	padding: 0px;
}
/*设置头部的内边距*/
.padding_head {
	padding: 20px;
}
/*设置头像居中*/
.padding_head_img {
	text-align: center;
}
/*设置图片的操作隐藏*/
#userImgHiddenText {
	visibility: hidden;
}
/* 超出的文本用省略号代替:
	必须定义一个宽度
	必须将其设置成block
	强制文本在一行显示
	超出的文本隐藏显示
	超出的文本用省略号代替
 */
/* .em {
	width: 100px;
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
} */
</style>

<article class="row">
	<c:if test="${user!=null }">
		<!--我的信息-->
		<section class="panel panel-default">
			<div class="panel-heading">
			<div class="panel-title">我的信息</div>
			</div>
			<div class="panel-body">
				<div id="personal_headImg_border" class="col-sm-12 padding_head padding_head_img">
					<img id="headPhoto" class="img-thumbnail" onerror="javascript:this.src='img/head.gif'" src="img/upload/personal/${user.userLoginId }/${user.userHeadImgPath}" title="我的头像" alt="我的头像" />
					<div class="caption" id="userImgHiddenText">
						<p>
							<a id="modal-headImg" href="#modal-container-headImg" role="button" class="btn" data-toggle="modal">修改 </a>
						</p>
					</div>

					<div class="modal fade" id="modal-container-headImg" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">头像选择</h4>
								</div>
								<!-- 修改头像的表单 -->
								<form action="personal/user/updateUserHeadImgPathById" enctype="multipart/form-data" class="form-horizontal" role="form" method="post">
									<div class="modal-body">
										<div class="form-group">
											<label for="userHeadImgPath" class="col-sm-3 control-label">请在你的电脑上选择一个合适的头像：</label>
											<div class="col-sm-8">
												<input class="form-control file" name="fileHeadImg" type="file" id="userHeadImgPathIndex" data-min-file-count="1" />
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
										<input type="submit" class="btn btn-primary" value="保存" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-12 padding_head">
					<!--我的信息左边文字-->
					<c:if test="${user.userRealName!='无' }">
						<div class="row">
							<p class="col-sm-12">
								<em>姓名：${user.userRealName } </em>
							</p>
						</div>
					</c:if>
					<c:if test="${user.userRealName=='无' }">
						<div class="row">
							<p class="col-sm-12">
								请<a href="javascript:ajaxTest('personal/user/personal_register_real')">实名认证</a>
							</p>
						</div>
					</c:if>
					<c:if test="${user.userName!='无' }">
						<div class="row">
							<p class="col-sm-12">
								<em class="em">昵称：${user.userName }</em>
							</p>
						</div>
					</c:if>
					<c:if test="${user.userName=='无' }">
						<div class="row">
							<p class="col-sm-12">
								请<a href="javascript:ajaxTest('personal/user/personal_register_other')">完善信息</a>
							</p>
						</div>
					</c:if>
					<c:if test="${resume!=null }">
						<div class="row">
							<p class="col-sm-12">
								<em>职位：${resume.resumeJor }</em>
							</p>
						</div>
						<c:set var="RECRUIT_STATUS" value="${CommonStatus.USER_RECRUIT_STATUS }"></c:set>
						<c:set var="CROWDFUND_STATUS" value="${CommonStatus.USER_CROWDFUND_STATUS }"></c:set>
						<c:set var="PARTNER_STATUS" value="${CommonStatus.USER_PARTNER_STATUS }"></c:set>
						
						<p class="row">
							
								<em class="col-sm-7 text-left" id="recruit-status">应聘状态：${RECRUIT_STATUS[user.userIsRecruit] }</em>
								<c:if test="${user.userIsRecruit==0 }">
									<span class="col-sm-5 text-right"><a id="i_want_recruit" class="btn btn-sm btn-success" href="javascript:void(0)" onclick="ajaxStatus(this,'userIsRecruit',1,1,'recruit-status',${user.id})">我要应聘</a></span>
								</c:if>
								<c:if test="${user.userIsRecruit==1 }">
									<span class="col-sm-5 text-right"><a id="i_want_recruit" class="btn btn-sm btn-charging" href="javascript:void(0)" onclick="ajaxStatus(this,'userIsRecruit',0,1,'recruit-status',${user.id})">结束应聘</a></span>
								</c:if>
							
						</p>
						<p class="row">
								<em class="col-sm-7 text-left" id="crowdfund-status" >众筹状态：${CROWDFUND_STATUS[user.userIsCrowdFund] }</em>
								<c:if test="${user.userIsCrowdFund==0 }">
								<span class="col-sm-5 text-right"><a id="i_want_crowdfund" class="btn btn-sm btn-success" href="javascript:void(0)" onclick="ajaxStatus(this,'userIsCrowdFund',1,10,'crowdfund-status',${user.id})">我要众筹</a></span>
								</c:if>
								<c:if test="${user.userIsCrowdFund==1 }">
								<span class="col-sm-5 text-right"><a id="i_want_crowdfund" class="btn btn-sm btn-charging" href="javascript:void(0)" onclick="ajaxStatus(this,'userIsCrowdFund',0,10,'crowdfund-status',${user.id})">众筹结束</a></span>
								</c:if>
						</p>
						<p class="row">
								<em class="col-sm-7 text-left" id="partner-status">合伙状态：${PARTNER_STATUS[user.userIsPartner] }</em>
								<c:if test="${user.userIsPartner==0 }">
								<span class="col-sm-5 text-right"><a id="i_want_partner" class="btn btn-sm btn-success" href="javascript:void(0)" onclick="ajaxStatus(this,'userIsPartner',1,10,'partner-status',${user.id})">我要合伙</a></span>
								</c:if>
								<c:if test="${user.userIsPartner==1 }">
								<span class="col-sm-5 text-right"><a id="i_want_partner" class="btn btn-sm btn-charging" href="javascript:void(0)" onclick="ajaxStatus(this,'userIsPartner',0,10,'partner-status',${user.id})">合伙结束</a></span>
								</c:if>
						</p>
					</c:if>
					<c:if test="${resume==null }">
						<div class="row">
							<p class="col-sm-12">
								请<a href="personal/resume/createResume">创建简历</a>
							</p>
						</div>
					</c:if>
				</div>
			</div>
		</section>
		<c:if test="${mood.moodContent!=null }">
			<section class="panel">
				<div class="panel-body">
					<!--我的信息左边文字结束-->
					<div class="col-sm-12">
						${mood.moodContent }
					</div>
				</div>
			</section>
		</c:if>
		<section class="panel">
			<div class="panel-body">
				<ul class="nav nav-pills ">
					<li class="active">
					<a href="javascript:ajaxPage('redirect:personal/follow/gotoFollow/${user.id }')">
					<span class="badge pull-right">${follows }</span>我的关注</a>
					</li>
					<li class="active">
					<a href="#">
					<span class="badge pull-right">${byFollows }</span>我的粉丝
					</a>
					</li>
				</ul>
			</div>
		</section>
	</c:if>
	<!--我的信息结束-->
	<!--我的菜单开始-->
	<section class="panel">
		<%@include file="/WEB-INF/pages/personal/common/selectformanage.jsp"%>
	</section>
	<!--我的菜单结束-->
	<section class="panel">
		<div class="panel-title">职业档案人气</div>
		<div class="panel-body">
			<p>
				你的职位在7天内被访问了<a href="#">0</a>次
			</p>
			<canvas id="myChart" width="230" height="160" style="border: 1px solid black;"></canvas>
		</div>
	</section>
</article>
<script type="text/javascript">
$("#userHeadImgPathIndex").fileinput({
	language : 'zh',
	previewFileType : 'image',
	showUploadedThumbs:false,
	fileActionSettings:{showZoom:false,showUpload:false,indicatorNew:' '}
});
	var ajaxTest = function(page) {
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
	$(document).ready(function() {
		$('#personal_headImg_border').mousemove(function() {
			$("#userImgHiddenText").css("visibility", "visible");
		});
		$("#personal_headImg_border").mouseleave(function() {
			$("#userImgHiddenText").css("visibility", "hidden");
		});
	});
</script>