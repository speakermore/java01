<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>管理员简历审核</title>

<!-- Bootstrap -->
<div><%@include file="../header.jsp"%></div>
</head>
<body>
	<div><%@include file="../menu.jsp"%></div>
	
	<from action="findAuditCompany">
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-3 main">
          <h2 class="sub-header">企业资质审核</h2>
          <div class="table-responsive">
            <table class="table table-striped">
                <ul>
					<li>公司编号：${companys.companysTitle}</li>
					<li>公司简介：${companys.cmpIntroduction}</li>
					<li>公司性质：${companys.cmpIntQuality}</li>
					<li>公司规模：${companys.cmpPeopleNum}</li>
					<li>公司福利：${companys.cmpIntComforts}</li>
					<li>公司休息制度：${companys.cmpIntRest}</li>
					<li>公司保险制度：${companys.cmpIntInsurance}</li>
					<li>钱包：${companys.cmpIntWage}</li>
					<li>企业简介发表状态：${companys.cmpIntStatus}</li>
					<div class="">
						<a class="col-sm-offset-2" href="admin/auditCompany?cmpIntStatus=2&id=${companys.id}&toPage=../auditingCompany"></a>
						<input  class="btn btn-warning"  type="submit" value="通过审核" />
						<a  class="col-sm-offset-4" href="admin/auditCompany?cmpIntStatus=3&id=${companys.id}&toPage=../auditingCompany" ></a>
						<input  class="btn btn-warning"  type="submit" value="拒绝审核" />
					</div>
				</ul>
            </table>
          </div>
        </div>
		<!--左侧边栏结束-->


		<!--右侧边栏-->
		<!--<div class="col-sm-4" style="border: 1px solid black;">1列</div><!--右侧边栏结束-->

	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> <script
		src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script> <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/admin/bootstrap.min.js"></script> </from>
	<div><%@include file="../footer.jsp" %></div>
</body>
</html>					