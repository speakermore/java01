<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>招聘信息修改</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css"/>
	 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css"/>
     <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.10.2.min.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrapValidator.js"></script>
     <style type="text/css">
    </style>
  <head>
   <base href="<%=basePath %>" />
   <script type="text/javascript" src="<%=request.getContextPath() %>/thirdpart/ckeditor/ckeditor.js"> </script>
  </head>
  <body>
  <%@include file="/WEB-INF/pages/nav.jsp" %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-3 column">
			<%@include file="/WEB-INF/pages/company/menu.jsp" %>
			</div>
			<div class="col-md-9 column">
			 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-sm-12">
                    <div class="page-header">
                        <h2>${cmpr.cmpRecTitle }</h2>
                    </div>
                    <form id="defaultForm" method="post" class="form-horizontal" action="company/cmprs/companyRecruit/updateCmpRecruit">
                    <input type="hidden" name="id" value="${cmpr.id }"/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" >薪资</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="cmpRecWage" value="${cmpRecWage} "/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学历需求</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="cmpRecEducation" value="${cmpRecEducation}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">工作所需技能及水平描述</label>
                            <div class="col-sm-5">
                                <textarea  class="form-control" name="cmpRecExperience" value="${cmpRecExperience}">
                                 </textarea>
                                 <script type="text/javascript">CKEDITOR.replace('cmpRecExperience');</script>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">需求人数</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="cmpRecPeople" value="${cmpRecPeople}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">提交修改</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>
			</div>
		</div>
	</div>
  
  </body>
</html>
