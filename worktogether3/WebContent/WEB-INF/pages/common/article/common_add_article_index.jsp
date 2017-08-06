<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#cke_articleContent{
width: 100%;
}
#cke_1_contents{
width: 100%;
}
</style>

<article class="col-sm-12">
	<!--发表新文章 -->
	<section class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">新文章发表</h4>
		</div>
		<div class="panel-body" style="margin-top:20px">
		
		<form id="add_article" role="form" class="form-horizontal" action="common/article/add_article" method="post">
		<div class="form-group">
			<label class="col-sm-2 control-label">文章类型:</label>
			<div class="col-sm-4">
				<select class="form-control" name="articleType">
					<c:forEach items="${articleTypes }" var="at">
					<option value="${at.articleTypeName }">${at.articleTypeName }</option>
					</c:forEach>
				</select>
			</div>
			<label for="articleTitle" class="col-sm-2 control-label">文章标题：</label>
			<div class="col-sm-4">
				<input class="form-control" name="articleTitle"/>
			</div>
		</div>
		<div class="form-group">
			<label for="articleKey" class="col-sm-2 control-label">关键字：</label>
			<div class="col-sm-10">
				<input class="form-control" name="articleKey" />
			</div>
		</div>
		<div class="form-group">
			<label for="articleContent" class="col-sm-2 control-label">文章内容：</label>
			<div class="col-sm-10">
				<textarea class="form-control ckeditor" name="articleContent" ></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-5 col-sm-2">
					<a href="javascript:ajaxPage('common/article/common_index_article')" class="btn btn-default">返回</a>
			</div>
			<div class="col-sm-2">
				<input class="btn btn-success" type="submit" value="发表" />
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
$('#add_article').bootstrapValidator({
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
