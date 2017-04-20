<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <script type="text/javascript" src="thirdpart/ckeditor/ckeditor.js"> </script>
    <title>企业首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet" />
	<link href="css/lrtk.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
  	<%@include file="/WEB-INF/pages/nav.jsp" %>
	<div class="container">
		<div class="col-sm-9 column wt-hby-left">
			<div class="row clearfix"  style="border-right: 2px solid #f8f8f8;">
				<div class="col-sm-12 column">
					<div class="row clearfix">
						<div class="col-sm-10 column">
							<h2>企业简介</h2>
							<p class="wt-hby-companyInt">
								这里是相关的企业简单的简介,2017年2月23日上午，习近平总书记从中南海出发，驱车100多公里，专程到河北省安新县实地察看规划新区核心区概貌。在大王镇小王营村，总书记走进一片开阔地，极目远眺。这里就是规划中的雄安新区起步区的核心地块。 在展开的一张规划图前，习近平仔细察看区位、规划状况，详细了解人口搬迁安置、区域内的地质水文条件等情况......
							</p>
							<a class="btn" href="company/findById">查看公司简介 »</a>
						</div>
					</div>
					<br />
					<ul class="nav nav-pills">
						<li>
							<a href="#"><span class="badge pull-right">16</span>信息</a>
						</li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void()">其它操作<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									<a href="companyarge">充值</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="company/artanddis/article/add_companyarticle">发表文章</a>
								</li>
							</ul>
						</li>	
					</ul>
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
					  		<div class="panel-heading">
					   			<h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">企业文章内容</a></h4>
					  		</div>
					  		<div id="collapseOne" class="panel-collapse collapse in">
					   			<div class="panel-body">
									<table class="table wt-hby-article">
										<thead>
											<tr>
												<th>文章标题</th>
												<th>发表日期</th>
												<th>点赞数</th>
												<th>阅读数</th>
												<th>编辑</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${articles==null }">
				   								<jsp:forward page="/company/artanddis/article/find/1"></jsp:forward>
				   							</c:if>
				   							<c:forEach items="${articles }" var="art">
				   								<tr>
				   									<td><a href="company/artanddis/article/findid?id=${art.id }&toPage=company/artanddis/companyart_detail">${art.articleTitle }</a></td>
				   									<td>${art.articleTime }</td>
				   									<td>${art.articleLikeNum }</td>
				   									<td>${art.articleReadNum }</td>
				   									<td>
										   				<c:if test="${art.usersId==company.id }">
										   					<a href="company/artanddis/article/findid?id=${art.id }&toPage=company/artanddis/companyart_edit"><i class="glyphicon glyphicon-edit"></i></a>
										   				</c:if>
				   									</td>
				   									<td>
										   				<c:if test="${art.usersId==company.id }">
										   					<a href="company/artanddis/article/delete?id=${art.id }"><i class="glyphicon glyphicon-trash"></i></a>
										   				</c:if>
				   									</td>
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
					   			<h4 class="panel-title"><a data-toggle="collapse" href="#collapseTwo">评论企业内容</a></h4>
					  		</div>
					  		<div id="collapseTwo" class="panel-collapse collapse in">
					   			<div class="panel-body">
					   				<div>
										<c:if test="${discuss==null }">
			  								<jsp:forward page="/company/artanddis/discuss/finddiscuss/1"></jsp:forward>
			  							</c:if>
										<c:forEach items="${discuss}" var="dis">
											<div class="row">
												<div class="col-sm-12" style="border-bottom: 1px solid #f5f5f5">
													<div class="col-sm-10">${dis.discussContent}</div>
													<div class="col-sm-2">
														<c:if test="${dis.discussUsersId==user.id }">
						   									<a href="company/artanddis/discuss/deletecompanydiscuss/${dis.id }"><em class="glyphicon glyphicon-trash"></em></a>
						   								</c:if>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
									<ul class="pager">
										<li>
											<c:if test="${curPage==null }">
					   							<c:set var="curPage" value="1"></c:set>
					   						</c:if>
					   						<c:if test="${curPage>1 }">
						   						<a href="company/artanddis/discuss/finddiscuss/${curPage-1 }">&laquo;</a>
						   					</c:if>
						   					<c:forEach items="${pageNo }" var="i">
												<a href="company/artanddis/discuss/finddiscuss/${i }">${i }</a>
											</c:forEach>
											<c:if test="${curPage<maxPage }">
						   						<a href="company/artanddis/discuss/finddiscuss/${curPage+1 }">&raquo;</a>	
						   					</c:if>
										</li>
									</ul>
								</div>
					  		</div>
					 	</div>
					</div>
				</div>
			</div>
			<br />
			<div>
				<c:if test="${disUserId==user.id }">
					<form action="company/artanddis/discuss/add_companydiscuss" method="post">
						<div class="form-group col-sm-12">
							<input type="hidden" name="discussLevel" id="discussLevel" />
					   		<label class="col-sm-2">评价星级</label>
					   		<div class="col-sm-10 raty" id="star" value="3.5" name="discussLevel"></div>
				   		</div>
				    	<div class="form-group col-sm-12">
				    		<label class="col-sm-2">评论内容</label>
				    		<div class=col-sm-10">
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
		<div class="col-sm-3 column wt-hby-right">
			此处为广告广告广告
			广告未招租
		</div>
	</div>
  	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
  	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.raty.min.js"></script>
	<script src="js/lrtk.js"></script>
	<script type="text/javascript">
		$(function(){
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
		});
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
		s});
    </script>
	
	</body>
</html>
