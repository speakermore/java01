<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="ynjh.admin.entity.AdminLog"%>
 <%@page import="java.util.List"%>
 
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="${pageContext.request.scheme }://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/" />
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<table class="table table-striped">
	<a style="font-weight:bold; font-size:25px ;">管理员访问操作记录表:</a><br/><br/>
	<thead>
		<tr>
			<th>操作对象id</th>
			<th>操作类型</th>
			<th>操作人id</th>
			<th>操作对象类型</th>
			<th>时间</th>
		</tr>
	</thead>
	<tbody>
		<%
    List<AdminLog> newsList=(List)request.getAttribute("adminLogs");
                	
                	int i=0;
                	for(AdminLog adm:newsList){
                		i++;
                %>
                
                	<tr <% if(i%2==0){%>class="admin-list-td-h2"<%} %>>
                		
                		<td><%=adm.getAdminAid() %></td>
                		<td><%=adm.getAdminDo() %></td>
                		<td><%=adm.getAdminLoginId() %> </td>
                		<td><%=adm.getAdminTargetType() %></td>
                		<td><%=adm.getAdminTime() %></td>
                	
              <%} %>
	</tbody>
</table>

              
              
</body>
</html>