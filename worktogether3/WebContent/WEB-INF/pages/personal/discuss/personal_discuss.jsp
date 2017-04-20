<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
<script type="text/javascript"  src="thirdpart/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/personal/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/personal/jquery.raty.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#star").raty({
        score:function(){
            return $(this).attr("value");
        },
        starOn:'img/personal/star-on-big.png',
        starOff:'img/personal/star-off-big.png',
        starHalf:'img/personal/star-half-big.png',
        readOnly:false,
        halfShow:true,
        size:34,
        
    })
});
	
</script>
<title>Insert title here</title>
</head>
<body>
	<form action="personal/discuss/addDiscuss" method="post">
		<input type="hidden" name="discussUsersId" value="${user.id }"/>
		<!-- 测试用 -->
		评价星级：<div id="star"  value="3.5" name="discussLevel"></div>
		<textarea rows="5" cols="5" name="discussContent" class="ckeditor"></textarea>
		<input type="submit" value="发表"/>
	</form>
</body>
</html>