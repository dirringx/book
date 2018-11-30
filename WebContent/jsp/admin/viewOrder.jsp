<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>班级订单详情</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/css/viewOrder.css" />
</head>
<body>
    <div class="wrap">
        <jsp:include page="/comm/view/admin/top.jsp"></jsp:include>     
        <c:if test="${not empty m_student.studentName and m_student.studentName ne 'unseted'}">
        <h1 class="title">班级订单详细信息</h1>
        <div class="summary">
            <span class="total-num">总数：<span id="totalNum">${fn:length(v_classOrder.orderitems)}</span></span>
            <span class="total-money">金额：<span id="totalMoney">${v_classOrder.price}</span></span>
            <input id="download" type="button" value="下载班级订单详细信息" />
        </div>
        
        <table id="table" cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <th class="stu-id">学号</th>
                    <th class="stu-name">姓名</th>
                    <c:forEach items="${c_orderItems}" var="ot">
						<th class="book"><span class="name">${ot.book.name}</span></th>
        			</c:forEach>
                    <th class="number">总数</th>
                    <th class="money">金额</th>
                </tr>
            </thead>
            <tbody>
            	<s:iterator value="#session.v_orders" var="vos">
	                <tr>
	                    <td>${vos.student.studentID}</td>
	                    <td>${vos.student.studentName}</td>
	                    <c:forEach items="${vos.orderitems}" var="ots">
	                     	<td><span class="name">${ots.quantity}</span></td>
	        			</c:forEach>
	                    <td>${fn:length(c_orderItems)}</td>
	                    <td>${vos.price}</td>
	                </tr>
                </s:iterator>
            </tbody>
        </table>
    	</c:if>
    </div>
    
    <script type="text/javascript" src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
    <script>
        $("#table tbody tr:odd").addClass('tr-bg');
    </script>
</body>
</html>