<%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article class="col-sm-12">
<div class="alert ${CommonStatus.USER_STATUS_STYLE[user.userStatus] } alert-dismissable">
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	<h4>注意!</h4>
	<c:if test='${user.userRealName == "无" }'>
		实名认证通过后可以提升你的信用度哦，亲.
	</c:if>
	<c:if test='${user.userRealName!="无"&&user.userStatus==1 }'>
		请耐心等待实名审核通过呀，如果不通过，会有通知滴！
	</c:if>
	<c:if test='${user.userStatus==2 }'>
		恭喜恭喜！你已通过实名认证！
	</c:if>
	<c:if test='${user.userStatus==3 }'>
		很可惜，你的实名认证未通过，请重新提交相关信息（照片需要分辨率高一些哦！）
	</c:if>
	<a href="personal/common/initIndex?userId=${user.id }" class="alert-link">点我返回首页</a>
</div>
<section class="panel panel-default">
	<div class="panel-heading">
		<div class="panel-title">实名认证</div>
	</div>
	<div class="panel-body">
	<c:if test="${user.userStatus==2 }">
		<h2 class="alert alert-success">实名认证已通过！</h2>
	</c:if>
	<c:if test="${user.userStatus!=2}">
	<form role="form" class="form-horizontal" action="personal/user/addUserReal" method="post" enctype="multipart/form-data" id="realForm">
		<input type="hidden" name="id" value="${user.id }" /><br />
		<div class="form-group">
			<label for="userRealName" class="col-md-3 control-label">真实姓名：</label>
			<div class="col-md-8">
				<c:if test='${user.userRealName=="无" || user.userStatus==3 }'>
				<input class="form-control" name="userRealName" id="userRealName" />
				</c:if>
				<c:if test='${user.userRealName!="无" && user.userStatus!=3 }'>
				<input class="form-control" readonly="readonly" name="userRealName" id="userRealName" value="${user.userRealNameMasked }" />
				</c:if>
			</div>
		</div>
		<div class="form-group">
			<label for="userIDCard" class="col-md-3 control-label">身份证号码：</label>
			<div class="col-md-8">
				<c:if test='${user.userIDCard=="无" || user.userStatus==3 }'>
				<input class="form-control" name="userIDCard" id="userIDCard" />
				</c:if>
				<c:if test='${user.userIDCard!="无" && user.userStatus!=3 }'>
				<input class="form-control" readonly="readonly" value="${user.userIDCardMasked }" name="userIDCard" id="userIDCard" />
				</c:if>
			</div>
		</div>
		<div class="form-group">
			<label for="userIDImgFace" class="col-md-3 control-label">身份证正面图片：</label>
			<div class="col-md-8">
				<c:if test='${user.userIDImgFace=="无" || user.userStatus==3 }'>
				<input class="form-control file" name="fileface" type="file" id="userIDImgFace" multiple data-min-file-count="1" />
				</c:if>
				<c:if test='${user.userIDImgFace!="无" && user.userStatus!=3 }'>
				<input class="form-control" readonly="readonly" value="图片已上传" />
				</c:if>
			</div>
		</div>
		<div class="form-group">
			<label for="userIDImgCon" class="col-md-3 control-label">身份证反面图片：</label>
			<div class="col-md-8">
				<c:if test='${user.userIDImgCon=="无" || user.userStatus==3 }'>
				<input class="form-control file" name="filecon" type="file" id="userIDImgCon" multiple data-min-file-count="1" />
				</c:if>
				<c:if test='${user.userIDImgCon!="无" && user.userStatus!=3 }'>
				<input class="form-control" readonly="readonly" value="图片已上传" />
				</c:if>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-9">
			<c:if test='${user.userRealName=="无" || user.userStatus==3 }'>
				<input class="btn btn-success" type="submit" value="保存" />
				<input class="btn btn-success" type="reset" value="重置" />
			</c:if>
			<c:if test='${user.userRealName!="无" && user.userStatus!=3 }'>
				<input class="btn btn-default" type="button" onclick="location.href='personal/common/initIndex?userId=${user.id}'" value="返回" />
			</c:if>
			</div>
		</div>
	</form>
	</c:if>
	</div>
</section>
<script type="text/javascript">
	$("#userIDImgFace").fileinput({
		uploadAsync : false,
		'language' : 'zh',
		'showUpload' : false,
		'previewFileType' : 'any'
	});
	$("#userIDImgCon").fileinput({
		uploadAsync : false,
		'language' : 'zh',
		'showUpload' : false,
		'previewFileType' : 'any'
	});
	$("#realForm")
		.bootstrapValidator(
			{
				message : '这个值不能通过验证！！',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					userRealName : {
						validators : {
							notEmpty : {
								message : '真实姓名不能为空'
							},
							stringLength : {
								min : 2,
								max : 10,
								message : '请输入正确姓名'
							},
							regexp : {
								regexp : (/[\u4e00-\u9fa5]/g),
								message : "请输入正确姓名"
							}
						}
					},
					userIDCard : {
						validators : {
							notEmpty : {
								message : '身份证号码不能为空'
							},
							regexp : {
								regexp : (/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/),
								message : "请输入正确的身份证号码"
							}
						}
					},
					fileface : {
						validators : {
							notEmpty : {
								message : '身份证正面图片不能为空'
							}
						}
					},
					filecon : {
						validators : {
							notEmpty : {
								message : '身份证反面图片不能为空'
							}
						}
					},
				}
			});
</script>
</article>