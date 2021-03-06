<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article class="col-sm-12">
	<!--修改文章-->
	<section class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">文章修改</h4>
		</div>
		<div class="panel-body" style="margin-top:20px">
		<form id="update_article" class="form-horizontal" action="common/article/updateArticle" method="post">
			<div class="form-group">
				<label for="articleType" class="col-sm-2 control-label">文章类型:</label>
				<div class="col-sm-4">
				<select class="form-control" name="articleType">
					<c:forEach items="${articleTypes }" var="at">
					<c:if test="${at.articleTypeName==article.articleType }">
					<option value="${at.articleTypeName }" selected="selected">${at.articleTypeName }</option>
					</c:if>
					<c:if test="${at.articleTypeName!=article.articleType }">
					<option value="${at.articleTypeName }">${at.articleTypeName }</option>
					</c:if>
					</c:forEach>
				</select>
			</div>
				<label for="articleTitle" class="col-md-2 control-label">文章标题：</label>
				<div class="col-md-4">
					<input class="form-control" name="articleTitle" value="${article.articleTitle}" />
				</div>
			</div>
			<div class="form-group">
				<label for="articleKey" class="control-label col-sm-2">关键字</label>
				<div class="col-sm-10">
					<input name="articleKey" class="form-control" value="${article.articleKey }" />
				</div>
			</div>
			<input type="hidden" name="id" value="${article.id}" />
			<div class="form-group">
				<label for="articleContent" class="col-md-2 control-label">文章内容：</label>
				<div class="col-md-10">
					<textarea class="form-control ckeditor" name="articleContent">${article.articleContent}</textarea>
					<br />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-2">
					<a href="javascript:ajaxPage('common/article/common_index_article')" class="btn btn-default">返回</a>
				</div>
				<div class="col-md-2">
					<input class="btn btn-success" type="submit" value="提交修改" />
				</div>
			</div>
		</form>
		</div>
	</section>
</article>
<script>
CKEDITOR.replace('articleContent',{
    filebrowserImageUploadUrl: '../../ckeditor/upload?Type=Images'
}); 
</script>
<script>
$('#update_article').bootstrapValidator({
	message : '不能填写这样的值',
	feedbackIcons : { /*输入框不同状态，显示图片的样式*/
		valid : 'glyphicon glyphicon-ok',
		invalid : 'glyphicon glyphicon-remove',
		validating : 'glyphicon glyphicon-refresh'
	},
	fields : {
		articleTitle : {
			validators : {
				notEmpty : {
					message : '文章标题不能为空！'
				}
			}
		},
		articleContent : {
			validators : {
				notEmpty : {
					message : '文章内容不能为空！'
				}
			}
		}
	}
});
</script>
