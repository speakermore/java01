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
	<!-- 牟勇：企业logo及简介 -->
<div class="row">
	<div class="col-sm-3">
		<br />
		<img width="100" height="100" class="thumbnail" src="company/img/${user.companyLoginId }/${user.companyLogo}" />
	</div>
	<h2 class="col-sm-9">${user.companyName}<small>(${user.companySimpleName })</small></h2>
</div>
<div class="row">
	<p class="col-sm-12 wt-hby-companyInt">
		${companyInt.cmpIntroduction }
	</p>
</div>
<!-- 牟勇：企业logo及简介结束 -->
<!-- 牟勇：环境图片 -->
<div class="row">
	<div class="magnifier" id="magnifier1">
		<div class="magnifier-container">
			<div class="images-cover"></div>
			<!--当前图片显示容器-->
			<!-- <div class="move-view"></div> -->
			<!--跟随鼠标移动的盒子-->
		</div>
		<div class="magnifier-assembly">
			<div class="magnifier-btn">
				<span class="magnifier-btn-left">&lt;</span>
				<span class="magnifier-btn-right">&gt;</span>
			</div>
			<!--按钮组-->
			<div class="magnifier-line">
				<ul class="clearfix animation03">
					 <c:forEach items="${detailImgs }" var="imgs">
						<li>
							<div class="small-img">
								<img src="company/img/${user.companyLoginId }/${imgs.companyDetailImg}" />
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!--缩略图-->
		</div>
		<!-- <div class="magnifier-view"></div> -->
		<!--经过放大的图片显示容器-->
	</div>	
</div>
<!-- 牟勇：环境图片结束 -->
<div class="row">
<div class="panel-group" id="accordion">
	<div class="panel panel-default">
  		<div class="panel-heading">
   			<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">最新投递的简历</a></h4>
  		</div>
  		<div id="collapseOne" class="panel-collapse collapse in">
   			<div class="panel-body">
				<table class="table wt-hby-article">
					<thead>
						<tr>
							<th>投递人</th>
							<th>投递日期</th>
							<th>投递职位</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
  							<c:forEach items="${newlyApplys }" var="apply">
  								<tr>
  									<td><a href="javascript:ajaxPage('redirect:/common/apply/check_resume/${apply.resumeId }/${apply.userLoginId }/${apply.applyId}')">${apply.resumeName }</a></td>
  									<td>${apply.cmprTime }</td>
  									<td>${apply.cmpRecTitle }</td>
  								</tr>
  							</c:forEach>
					</tbody>
				</table>
				
			</div>
  		</div>
	</div>
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
	  		<div class="panel-heading">
	   			<h4 class="panel-title"><a data-toggle="collapse" href="#collapseThree">企业文章</a></h4>
	  		</div>
	  		<div id="collapseThree" class="panel-collapse collapse in">
	   			<div class="panel-body">
					<table class="table wt-hby-article">
						<thead>
							<tr>
								<th>企业文章</th>
								<th>发表日期</th>
								<th><i class="glyphicon glyphicon-thumbs-up"></i></th>
								<th><i class="glyphicon glyphicon-eye-open"></i></th>
							</tr>
						</thead>
						<tbody>
   							<c:forEach items="${articles }" var="art">
   								<tr>
   									<td><a href="company/artanddis/article/findid?id=${art.id }&toPage=company/artanddis/companyart_detail">${art.articleTitle }</a></td>
   									<td>
   										<fmt:formatDate value="${art.articleTime }" pattern="yyyy-MM-dd"/>
   									</td>
   									<td>${art.articleLikeNum }</td>
   									<td>${art.articleReadNum }</td>
   								</tr>
   							</c:forEach>
						</tbody>
					</table>
				</div>
	  		</div>
	  	</div>
		</div>
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