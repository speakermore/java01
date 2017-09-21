<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page autoFlush="true" buffer="1024kb"%>
<!-- 牟勇：企业首页的重要信息提醒 -->
 <style type="text/css">
  	textarea {
	resize:none;
	padding:5px; 
	border-radius:3px;
	box-shadow: inset 0 2px 3px rgba(0,0,0,0.2);
	border: solid 1px #ccc;
	box-sizing: border-box; 
}
.thumbnail>img{
	 height: 100px;
	 width: 100%;
}
.logo{
	height: 40px;
	width: auto;
}
#magnifier1{
	margin-left:110px; 
}
p{
	font-size: 15px;
	padding: 7px 0px;
}
h2{
	padding-top:7px;
}
</style>

<div class="row">
<div class="panel-group" id="accordion">
	<!-- 招聘匹配 -->
	<div class="panel panel-default">
  		<div class="panel-heading">
   			<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#yourNeed">您需要的人</a></h4>
  		</div>
  		<div id="yourNeed" class="panel-collapse collapse in">
   			<div class="panel-body">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>向您推荐</th>
							<th>简历日期</th>
							<th>匹配职位</th>
							<th>邀请</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${postMatchs }" var="postMatch">
						<tr><!-- 0表示从企业首页跳转 -->
							<td><a target="_blank" title="查看简历，发送offer" href="javascript:ajaxPage('redirect:/common/apply/check_resume/${postMatch.resumeId}/${postMatch.userLoginId }/${postMatch.applyId}/0')">${postMatch.resumeName }${postMatch.applyId!=-1?"(简历已投)":"（向您推荐）"}</a></td>
							<td><fmt:formatDate value="${postMatch.resumeCreateDate }" pattern="yyyy年MM月dd日" /></td>
							<td>${postMatch.resumeTitle }</td>
							<td><a target="_blank" title="查看简历，发送offer" href="javascript:ajaxPage('redirect:/common/apply/check_resume/${postMatch.resumeId}/${postMatch.userLoginId }/${postMatch.applyId}/0')">${postMatch.isOffered }</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
  		</div>
	</div>
	<!-- 招聘匹配结束 -->
	<!-- 最新简历 -->
	<div class="panel panel-default">
  		<div class="panel-heading">
   			<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#newlyResume">最新投递的简历</a></h4>
  		</div>
  		<div id="newlyResume" class="panel-collapse collapse in">
   			<div class="panel-body">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>投递人</th>
							<th>投递日期</th>
							<th>投递职位</th>
							<th>邀请</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${newlyApplys }" var="apply">
						<tr><!-- 0表示从企业首页跳转 -->
							<td><a target="_blank" title="查看简历，发送offer" href="javascript:ajaxPage('redirect:/common/apply/check_resume/${apply.resumeId}/${apply.userLoginId }/${apply.applyId}/0')">${apply.resumeName }</a></td>
							<td><fmt:formatDate value="${apply.cmprTime }" pattern="yyyy年MM月dd日" /></td>
							<td>${apply.cmpRecTitle }</td>
							<td><a target="_blank" title="查看简历，发送offer" href="javascript:ajaxPage('redirect:/common/apply/check_resume/${apply.resumeId}/${apply.userLoginId }/${apply.applyId}/0')">${apply.isOffered }</a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
  		</div>
	</div>
	<!-- 最新简历结束 -->
	<!-- Offer状态 -->
	<div class="panel panel-default">
  		<div class="panel-heading">
   			<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#newlyOffer">最新Offer状态</a></h4>
  		</div>
  		<div id="newlyOffer" class="panel-collapse collapse in">
   			<div class="panel-body">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Offer接收人</th>
							<th>Offer发出日期</th>
							<th>Offer对应岗位</th>
							<th>Offer状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${Offers }" var="offer">
						<tr><!-- 0表示从企业首页跳转 -->
							<td><a href="javascript:ajaxPage('redirect:/common/apply/check_resume/${apply.resumeId}/${apply.userLoginId }/${apply.applyId}/0')">${apply.resumeName }</a></td>
							<td><fmt:formatDate value="${apply.cmprTime }" pattern="yyyy年MM月dd日" /></td>
							<td>${apply.cmpRecTitle }</td>
							<td>${apply.isOffered }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
  		</div>
	</div>
	<!-- Offer状态结束 -->
	</div>
</div>
<div>
	<div class=" col-sm-5"></div>
	<a href="#" class="cd-top">返回顶部</a>
</div>
<script type="text/javascript" src="js/magnifier.js"></script>
<script type="text/javascript">
	var hby_magnifier=function() {
		
		var magnifierConfig = {
			magnifier : "#magnifier1",//最外层的大容器
			width : 500,//承载容器宽
			height : 370,//承载容器高
			moveWidth : null,//如果设置了移动盒子的宽度，则不计算缩放比例
			zoom : 5//缩放比例
		};
	
		var _magnifier = magnifier(magnifierConfig);
};
</script>
<script type="text/javascript">
	var hby_star=function(){
	    $("#star").raty({
	        score:function(){
	            return $(this).attr("value");
	        },
	        starOn:'img/star-on-big.png',
	        starOff:'img/star-off-big.png',
	        starHalf:'img/star-half-big.png',
	        readOnly:false,
	        halfShow:true,
	        size:34,
	        click: function(score) {
   				/* $.ajax({
   					url:"company/artanddis/discuss/add_companydiscuss",
   					data:{discussLevel:score}
   				}); */
   				$("#discussLevel").val(score);
 				} 
	    });
	};
</script>
<script type="text/javascript">
   	$(document).ready(function(){
			$("textarea").keyup(function(){
				var textarea=$("textarea");
				var wordstip=$("#wordstip");
				wordstip.html("你还可以输入<span style=\"color:red\">"+(140-$.trim(textarea.val()).length)+"</span>字");
      			if( $.trim(textarea.val()) == "" ){
 					$("input[type='submit']").attr("disabled","disabled");
			}else{
 					$("input[type='submit']").removeAttr("disabled");
			}
		});
	});
   </script>
<script type="text/javascript">
	$(document).ready(function(){
		var name = $(".wt-hby-companyInt");
		if(name.html().length > 150){
			name.html(name.html().substring(0,150)+"......");
		}
		
		hby_star();
		hby_magnifier();	
	});
</script>