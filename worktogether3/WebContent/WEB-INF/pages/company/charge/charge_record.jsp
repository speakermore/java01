<%@ page language="java" import="ynjh.common.util.CommonStatus" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${CommonStatus.USER_OP_TYPE_FOR_DISPLAY }" var="USER_OP_TYPE_FOR_DISPLAY" ></c:set>
<div class="col-sm-12">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<td>用户操作</td>
				<td>操作类型</td>
				<td>消费金额</td>
				<td>操作时间</td>
				<td>备注</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${companyRecords }" var="companyRecord">
			<tr>
				<td width="18%">${companyRecord.userrOperator }</td>
				<td width="18%">${USER_OP_TYPE_FOR_DISPLAY[companyRecord.userrOpType] }</td>
				<td>${companyRecord.userrMoney }</td>
				<td width="20%"><fmt:formatDate value="${companyRecord.userrTime }" pattern="yyyy年MM月dd日"/></td>
				<td>${companyRecord.userrMem }</td>
			</tr>
			</c:forEach>
		</tbody>	
	</table>
</div>

