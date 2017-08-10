 <%@ page language="java" contentType="text/html; charset=UTF-8" import="ynjh.common.util.*" pageEncoding="UTF-8"%>
 <%@ page autoFlush="true" buffer="1024kb"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/pages/company/header.jsp"%>
<title>企业用户-企业信息</title>
<%@include file="/WEB-INF/pages/company/footer.jsp" %>

<style type="text/css">
	td>img{
		max-height: 200px;
		max-width: 160px;
	}				
	.wt-hby-edit{
		text-align: right;
	}
</style>
<style>
		/* 企业环境的样式 */
		
		/* Carousel base class */
		.carousel {
		  height: 400px;
		  margin-bottom: 60px;
		}
		/* Since positioning the image, we need to help out the caption */
		.carousel-caption {
		  z-index: 10;
		}
		
		/* Declare heights because of positioning of img element */
		.carousel .item {
		  height: 400px;
		  background-color: #fff;
		}
		.carousel-inner > .item > img {
		  position: absolute;
		  top: 0;
		  left: 0;
		  min-width: 100%;
		  height: 400px;
		}
		</style>
</head>
<body>
<%@include file="/WEB-INF/pages/nav.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-sm-3">
		<%@include file="/WEB-INF/pages/company/menu.jsp" %>
		</div>
		<div class="col-sm-9 wt-hby-top" id="my-content">
			<%@include file="/WEB-INF/pages/company/company/company_data_index.jsp" %>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/pages/copyright.jsp" %>
</body>

</html>