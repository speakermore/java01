<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page autoFlush="true" buffer="1024kb"%>

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
<div class="row" style="border-right: 2px solid #f8f8f8;">
		<div class="row">
			<div class="col-sm-10">
			<div class="row">
				<div class="col-sm-7">
					<div class="col-sm-3">
						<br />
						<img class="logo" src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${user.companyLoginId }/${user.companyLogo}" />
					</div>
					<h2 class="col-sm-9">${user.companySimpleName }</h2>
				</div>
				<div class="col-sm-5">
					<br /><br />
					<div class="col-sm-12">
						<img src="img/icon_star_2.gif" />
						<img src="img/icon_star_2.gif" />
						<img src="img/icon_star_2.gif" />
						<img src="img/icon_star_2.gif" />
						<img src="img/icon_star_1.gif" />
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				
				<p class="wt-hby-companyInt">
					${companyInt.cmpIntroduction }
				</p>
			</div>
		</div>
		<div class="row">
			<div class="magnifier" id="magnifier1">
				<div class="magnifier-container">
					<div class="images-cover"></div>
					<!--当前图片显示容器-->
					<div class="move-view"></div>
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
										<img src="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/company/img/${company.companyLoginId }/${imgs.companyDetailImg}" />
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!--缩略图-->
				</div>
				<div class="magnifier-view"></div>
				<!--经过放大的图片显示容器-->
			</div>	
		</div>
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
		  		<div class="panel-heading">
		   			<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">收到的简历</a></h4>
		  		</div>
		  		<div id="collapseOne" class="panel-collapse collapse in">
		   			<div class="panel-body">
						<table class="table wt-hby-article">
							<thead>
								<tr>
									<th>每日动态</th>
									<th>发表日期</th>
									<th><i class="glyphicon glyphicon-thumbs-up"></i></th>
									<th><i class="glyphicon glyphicon-user"></i></th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${articles==null }">
	   								<jsp:forward page="/company/artanddis/article/find/1"></jsp:forward>
	   							</c:if>
	   							<c:forEach items="${articles }" var="art">
	   								<tr>
	   									<td><a href="company/artanddis/article/findid?id=${art.id }&toPage=company/artanddis/companyart_detail">${art.articleTitle }</a></td>
	   									<td>
	   									</td>
	   									<td>${art.articleLikeNum }</td>
	   									<td>${art.articleReadNum }</td>
	   									<c:if test="${art.usersId==company.id }">
   											<td><a href="company/artanddis/article/delete/${art.id}" ><i class="glyphicon glyphicon-trash"></i></a></td>
   										</c:if>
	   								</tr>
	   							</c:forEach>
							</tbody>
						</table>
						<ul class="pager">
							<li>
								<c:if test="${curPage2==null }">
	   								<c:set var="curPage2" value="1"></c:set>
	   							</c:if> 
		   						<c:if test="${curPage2>1 }">
		   							<a href="company/artanddis/article/find/${curPage2-1 }">&laquo;</a>
		   						</c:if>
		   						<c:forEach items="${pageNo2 }" var="i">
									<a href="company/artanddis/article/find/${i }">${i }</a>
								</c:forEach>
						   		<c:if test="${curPage2<maxPage2 }">
						   			<a href="company/artanddis/article/find/${curPage2+1 }">&raquo;</a>	
						   		</c:if>	
							</li>
						</ul>
					</div>
		  		</div>
			</div>
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
			  		<div class="panel-heading">
			   			<h4 class="panel-title"><a data-toggle="collapse" href="#collapseTwo">招聘岗位信息</a></h4>
			  		</div>
			  		<div id="collapseTwo" class="panel-collapse collapse in">
			   			<div class="panel-body">
							<table class="table wt-hby-article">
								<thead>
									<tr>
										<th>招聘岗位</th>
										<th>发表日期</th>
										<th>投递简历</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${companyRecruits==null }">
		   								<jsp:forward page="/company/cmprs/companyRecruit/findAllDetil/1"></jsp:forward>
		   							</c:if>
		   							<c:forEach items="${companyRecruits}" var="rec">
		   								<tr>
		   									<td><a href="company/cmprs/find_recruit_detail?id=${rec.id }&toPage=company/cmprs/recruit_detail">${rec.cmpRecTitle}</a></td>
		   									<td><fmt:formatDate value="${rec.cmpRecTime }" pattern="yyyy-MM-dd"/></td>
		   									<td><a href="personal/resume/sendResumeToCompany?companyId=${company.id}&companyrecruitId=${rec.id}">我要应聘</a></td>
		   								</tr>
		   							</c:forEach>
								</tbody>
							</table>
							<ul class="pager">
								<li>
									<c:if test="${page==null }">
		   								<c:set var="page" value="1"></c:set>
		   							</c:if> 
			   						<c:if test="${page>=1 }">
			   							<a href="company/cmprs/companyRecruit/findAllDetil/${page-1 }">&laquo;</a>
			   						</c:if>
							   		<c:if test="${page<=maxPage }">
							   			<a href="company/cmprs/companyRecruit/findAllDetil/${page+1 }">&raquo;</a>	
							   		</c:if>	
								</li>
							</ul>
						</div>
			  		</div>
				</div>
				<div class="panel panel-default">
			  		<div class="panel-heading">
			   			<h4 class="panel-title"><a data-toggle="collapse" href="#collapseThree">企业动态</a></h4>
			  		</div>
			  		<div id="collapseThree" class="panel-collapse collapse in">
			   			<div class="panel-body">
							<table class="table wt-hby-article">
								<thead>
									<tr>
										<th>每日动态</th>
										<th>发表日期</th>
										<th><i class="glyphicon glyphicon-thumbs-up"></i></th>
										<th><i class="glyphicon glyphicon-user"></i></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${articles==null }">
		   								<jsp:forward page="/company/artanddis/article/find/1"></jsp:forward>
		   							</c:if>
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
							<ul class="pager">
								<li>
									<c:if test="${curPage2==null }">
		   								<c:set var="curPage2" value="1"></c:set>
		   							</c:if> 
			   						<c:if test="${curPage2>1 }">
			   							<a href="company/artanddis/article/find/${curPage2-1 }">&laquo;</a>
			   						</c:if>
			   						<c:forEach items="${pageNo2 }" var="i">
										<a href="company/artanddis/article/find/${i }">${i }</a>
									</c:forEach>
							   		<c:if test="${curPage2<maxPage2 }">
							   			<a href="company/artanddis/article/find/${curPage2+1 }">&raquo;</a>	
							   		</c:if>	
								</li>
							</ul>
						</div>
			  		</div>
				</div>
		 		<div class="panel panel-default">
			  		<div class="panel-heading">
			   			<h4 class="panel-title"><a data-toggle="collapse" href="#collapseFour">评价企业内容</a></h4>
			  		</div>
		  			<div id="collapseFour" class="panel-collapse collapse in">
		   				<div class="panel-body">
								<c:if test="${discusses==null }">
	  								<jsp:forward page="/company/artanddis/discuss/finddiscuss"></jsp:forward>
	  							</c:if>
  								<ol>
									<c:forEach items="${discusses}" var="dis">
										<li>
											<div class="col-sm-10">
												${dis.discussContent}
											</div>
											<div class="col-sm-2">
												<c:if test="${dis.discussUsersId==company.id }">
					   								<a href="company/artanddis/discuss/deletecompanydiscuss/${dis.id }"><em class="glyphicon glyphicon-trash"></em></a>
					   							</c:if>
											</div>
										</li>
									</c:forEach>
								</ol>
							</div>
		  				</div>
		 			</div>
				</div>
			</div>
		</div>
		<br />
		<div>
			<c:if test="${disUserId==company.id }">
			<!-- company/artanddis/discuss/add_companydiscuss -->
				<form action="personal/discuss/addDiscuss?companyId=${company.id}" method="post">
					<div class="form-group col-sm-12">
						<input type="hidden" name="discussLevel" id="discussLevel" />
					   	<label class="col-sm-2">评价星级</label>
					   	<div class="col-sm-10 raty" id="star" value="3.5" name="discussLevel"></div>
				   	</div>
				    <div class="form-group col-sm-12">
				    	<label class="col-sm-2">评论内容</label>
				    	<div class="col-sm-10">
				    		<textarea name="discussContent" rows="7" cols="90" 
				    			maxlength="140" placeholder="请输入评论内容，最大不超过140个字！"></textarea>
				    	</div>
				    </div>
				    <div class="col-sm-12">
				    	<input type="submit" value="评论企业" class="btn btn-warning" />
				    	<div class="col-sm-2"></div>
				    	<div id="wordstip" class="col-sm-8 column"></div>
				    </div>
   				</form>
   			</c:if>
		</div>
  			<div>
  				<div class=" col-sm-5"></div>
  				<a href="#" class="cd-top">返回顶部</a>
  			</div>
<br />
<div>
	<c:if test="${disUserId==company.id }">
	<!-- company/artanddis/discuss/add_companydiscuss -->
		<form action="personal/discuss/addDiscuss?companyId=${company.id}" method="post">
			<div class="form-group col-sm-12">
				<input type="hidden" name="discussLevel" id="discussLevel" />
			   	<label class="col-sm-2">评价星级</label>
			   	<div class="col-sm-10 raty" id="star" value="3.5" name="discussLevel"></div>
		   	</div>
		    <div class="form-group col-sm-12">
		    	<label class="col-sm-2">评论内容</label>
		    	<div class="col-sm-10">
		    		<textarea name="discussContent" rows="7" cols="90" 
		    			maxlength="140" placeholder="请输入评论内容，最大不超过140个字！"></textarea>
		    	</div>
		    </div>
		    <div class="col-sm-12">
		    	<input type="submit" value="评论企业" class="btn btn-warning" />
		    	<div class="col-sm-2"></div>
		    	<div id="wordstip" class="col-sm-8 column"></div>
		    </div>
 				</form>
 			</c:if>
</div>
			<div>
				<div class=" col-sm-5 column"></div>
				<a href="#" class="cd-top">返回顶部</a>
			</div>
</div>
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
	
	/*magnifier的内置函数调用*/
	/*
		//设置magnifier函数的index属性
		_magnifier.setIndex(1);

		//重新载入主图,根据magnifier函数的index属性
		_magnifier.eqImg();
	*/
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