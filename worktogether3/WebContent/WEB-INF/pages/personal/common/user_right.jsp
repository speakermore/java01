<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<article class="col-md-12   work-together-shadow work-together-deep">
	<c:if test="${user!=null }">
		<!--我的信息-->
		<section class="panel">
			<div class="panel-title">我的信息</div>
			<div class="panel-body">
				<div id="personal_headImg_border"
					class="col-md-12 padding_head padding_head_img">
					<c:if test="${user.userHeadImgPath=='无'}">
						<img id="headPhoto" class="img-thumbnail"
							src="personal/img/head.gif" title="我的头像" alt="我的头像" />

					</c:if>
					<c:if test="${user.userHeadImgPath!='无' }">
						<img id="headPhoto" class="img-thumbnail"
							src="img/upload/personal/${user.userLoginId }/${user.userHeadImgPath}"
							title="我的头像" alt="我的头像" />
					</c:if>
					<div class="caption" id="userImgHiddenText">
						<p>
							<a id="modal-headImg" href="#modal-container-headImg"
								role="button" class="btn" data-toggle="modal">修改 </a><a href="#"
								class="btn" role="button">删除</a>
						</p>
					</div>

					<div class="modal fade" id="modal-container-headImg" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">标题</h4>
								</div>
								<!-- 修改头像的表单 -->
								<form action="personal/user/updateUserHeadImgPathById"
									enctype="multipart/form-data" class="form-horizontal"
									role="form" method="post">
									<div class="modal-body">
										<div class="form-group">
											<label for="userHeadImgPath" class="col-md-3 control-label">头像：</label>
											<div class="col-md-8">
												<input class="form-control file" name="fileHeadImg"
													type="file" id="userHeadImgPath" multiple
													data-min-file-count="1" />
											</div>
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<input type="submit" class="btn btn-primary" value="保存" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 padding_head">
					<!--我的信息左边文字-->
					<c:if test="${user.userRealName!='无' }">
						<div class="row">
							<p class="col-md-12 em">
								<em>姓名： <c:if test="${fn:length(user.userRealName)>6 }">  
                         ${fn:substring(user.userRealName, 0, 6)}...  
                   </c:if> <c:if test="${fn:length(user.userRealName)<=6 }">  
                         ${user.userRealName }  
                   </c:if> <%-- <c:if test="${fn:length(c.description)>12 }">
								${user.userRealName }</c:if> --%></em>
							</p>
						</div>
					</c:if>
					<c:if test="${user.userRealName=='无' }">
						<div class="row">
							<p class="col-md-12">
								请<a
									href="javascript:ajaxTest('personal/user/personal_register_real')">实名认证</a>
							</p>
						</div>
					</c:if>
					<c:if test="${user.userName!='无' }">
						<div class="row">
							<p class="col-md-12">
								<em class="em">昵称： <c:if
										test="${fn:length(user.userName)>5 }">  
                         			${fn:substring(user.userName, 0, 5)}...  
                   				</c:if> <c:if test="${fn:length(user.userName)<=5 }">  
                         			${user.userName }  
                  			 	</c:if>
								</em>
							</p>
						</div>
					</c:if>
					<c:if test="${user.userName=='无' }">
						<div class="row">
							<p class="col-md-12">
								请<a
									href="javascript:ajaxTest('personal/user/personal_register_other')">完善信息</a>
							</p>
						</div>
					</c:if>
					<c:if test="${resume!=null }">
						<div class="row em">
							<p class="col-md-12">
								<em>职位： <c:if test="${fn:length(resume.resumeJor)>6 }">  
                         			${fn:substring(resume.resumeJor, 0, 6)}...  
                   				</c:if> <c:if test="${fn:length(resume.resumeJor)<=6 }">  
                         			${resume.resumeJor }  
                  			 	</c:if></em>
							</p>
						</div>
					</c:if>
					<c:if test="${resume==null }">
						<div class="row">
							<p class="col-md-12">
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
						<%-- <c:if test="${fn:length(mood.moodContent)>48 }">  
                         			${fn:substring(mood.moodContent, 0, 48)}...  
                   				</c:if> <c:if test="${fn:length(mood.moodContent)<=48 }">  
                         			 ${mood.moodContent } 
                  			 	</c:if> --%>
						${mood.moodContent }
					</div>
				</div>
			</section>
		</c:if>
		<section class="panel">
			<div class="panel-body">
				<ul class="nav nav-pills ">
					<li class="active"><a
						href="personal/follow/gotoFollow?followId=${user.id }"><span
							class="badge pull-right">${follows }</span>我的关注</a></li>
					<li class="active"><a href="#"> <span
							class="badge pull-right">${byFollows }</span>我的粉丝
					</a></li>
				</ul>
			</div>
		</section>
	</c:if>
	<c:if test="${user==null }">
		<section class="panel">
			<div class="row">
				<p class="col-md-12">
					请<a class="hidden-xs" href="personal/user/login">登录</a>
				</p>
			</div>
		</section>
	</c:if>
	<!--我的信息结束-->
	<!--我的信息列表开始-->
	<section class="panel">
		<%@include file="/WEB-INF/pages/personal/common/selectformanage.jsp"%>
	</section>
	<!--我的信息列表结束-->
	<section class="panel">
		<div class="panel-title">手机App下载</div>
		<div class="panel-body">
			<img src="" width="100" height="100" alt="Android下载" /> <img src=""
				width="100" height="100" alt="iOS下载" />
		</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位1</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位2</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位3</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位4</div>
	</section>
	<section class="panel">
		<div class="panel-body">广告招租位5</div>
	</section>
	<section class="panel">
		<div class="panel-title">职业档案人气</div>
		<div class="panel-body">
			<p>
				你的职位在7天内被访问了<a href="#">0</a>次
			</p>
			<canvas id="myChart" width="230" height="160"
				style="border: 1px solid black;"></canvas>
		</div>
	</section>
</article>
<script type="text/javascript">
	$("#userHeadImgPath").fileinput({
		'language' : 'zh',
		'uploadAsync' : false,
		'showUpload' : false,
		'previewFileType' : 'any'
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