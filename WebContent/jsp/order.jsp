<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/comm/base.jsp"%>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/css/order.css" />
<title>Order</title>

</head>
<body>
	<h1 class="title">订单列表</h1>
	<ul id="list">
		<li class="select"><a href="${ctx}/order/o.action?method=show">全部订单</a></li>
		<li><a href="${ctx}/order/o.action?method=show&np=1">待付款</a></li>
		<li><a href="${ctx}/order/o.action?method=show&np=2">已完成</a></li>
	</ul>
	<ul id="orderList">
		<li>
			<s:iterator value="#session.stu_orders" var="so">
				<div class="details">
					<span class="order-number">订单编号：${so.orderNo}</span> 
					<span class="order-date">下单日期：
						<fmt:formatDate value="${so.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</span> 
					<c:if test="${so.pay==true}">
						<span class="order-status">已付款</span>
					</c:if>
					<c:if test="${so.pay==false}">
						<span class="order-status">未付款</span>
					</c:if>
				</div>
			    <c:forEach items="${so.orderitems}" var="ot">
			       <div class="book-list">
						<img class="book-img" src="${ctx}/styles/${ot.book.bookImage}" /> 
						<span class="book-name">${ot.book.name}</span> 
						<span class="price">${ot.book.discount}</span>
						<span class="number">x${ot.quantity}</span>
					</div>
			    </c:forEach>
			</s:iterator>
		</li>
	</ul>
	<jsp:include page="/comm/view/NavBar.jsp"></jsp:include>
	<script type="text/javascript">
		var list = document.getElementById("list");
		var li = list.getElementsByTagName("li");
		for (var i = 0; i < li.length; i++) {
			li[i].onclick = function() {
				for (var j = 0; j < li.length; j++) {
					li[j].className = "";
				}
				this.className = "select";
			}
		}
	</script>
</body>
</html>