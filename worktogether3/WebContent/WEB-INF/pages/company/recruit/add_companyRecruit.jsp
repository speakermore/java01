<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
 <base href="${pageContext.request.scheme }://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/thirdpart/ckeditor/ckeditor.js"></script>
<title>用户前台-发表招聘信息</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css"/>
	 <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css"/>
     <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.10.2.min.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrapValidator.js"></script>
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>
	<div class="container">
		<div class="row clearfix">
			<div class="col-sm-3 column">
			<%@include file="/WEB-INF/pages/company/menu.jsp" %>
			</div>
				<div class="col-sm-9 column">
					<div class="row">
					            <section>
                <div class="col-sm-8 col-sm-offset-2">
                    <form id="defaultForm" method="post" class="form-horizontal" action="offer/add_offer">
                    <input type="hidden" name="id" value="${cmpr.id }"/>
                    <div class="form-group">
                            <label class="col-sm-3 control-label" >标题</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="cmpRecTitle" value="${cmpr.cmpRecTitle } "/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" >薪资</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="cmpRecWage" value="${cmpr.cmpRecWage} "/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">学历需求</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="cmpRecEducation" value="${cmpr.cmpRecEducation}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">需求人数</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="cmpRecPeople" value="${cmpr.cmpRecPeople}"/>
                            </div>
                        </div>
                     <div class="form-group">
                       <label class="col-sm-3 control-label">工作所需技能及水平描述</label>
                       <div class="col-sm-12">
                           <textarea  class="form-control" name="cmpRecExperience" value="${cmpRecExperience}">
                            </textarea>
                            <script type="text/javascript">CKEDITOR.replace('cmpRecExperience');</script>
                       </div>   
                        	</div>
                        	
                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button type="submit" class="btn btn-primary">提交添加</button>
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



</body>
</html>