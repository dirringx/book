<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/comm/base.jsp"%>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/styles/css/classOrder.css" />
	<title>班级订单</title>
</head>
<body>
	<div class="head">
        <a class="return" href="student.jsp">返回</a>
        <h1 class="title">班级订单列表</h1>
    </div>
    <ul id="list">
		<li><a href="${ctx}/order/o.action?method=classOrder">全部订单</a></li>
		<li><a href="${ctx}/order/o.action?method=classOrder&np=1">待付款</a></li>
		<li><a href="${ctx}/order/o.action?method=classOrder&np=2">已完成</a></li>
	</ul>
    <ul id="orderList">
    	<s:iterator value="#session.class_orders" var="co">
	        <li>
	            <div class="details">
	                <span class="order-number">订单编号：${co.orderNo}</span>
	                <span class="order-date">下单日期：
						<fmt:formatDate value="${co.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" />
					</span>
					<c:if test="${so.pay==true}">
						<span class="order-status">已提交</span>
					</c:if>
					<c:if test="${so.pay==false}">
						<span class="order-status">未提交</span>
					</c:if>
	            </div>
	            <c:forEach items="${co.orderitems}" var="ot">
			       <div class="book-list">
						<img class="book-img" src="${ctx}/styles/${ot.book.bookImage}" /> 
						<span class="book-name">${ot.book.name}</span> 
						<span class="price">¥${ot.book.discount}</span>
						<span class="number">x${ot.quantity}</span>
					</div>
	            </c:forEach>
	            <span id="totalNumber">书籍总数：<span class="book-nember"></span></span>
	            <span id="totalPrice">总价：<span class="money"></span></span>
	            <form action="${ctx}/order/o.action?method=pay&classOrder=1" method="post">
			   		<input type="hidden" name="orderNo" value="${co.orderNo}">
			    	<c:if test="${co.pay==false}">
			    		<button class="submit">提交</button>
			    	</c:if>
			    </form>
	        </li>
        </s:iterator>
    </ul>
    <script type="text/javascript" src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
    <script>
	    var li = $("#orderList li");
	    var allMoney =0;
	    var allNum = 0;
	    for(var i=0;i<li.length;i++){
	        var bookList = $(li.eq(i)).children(".book-list");
	        var money = $(li.eq(i)).find(".money");
	        var bookNum = $(li.eq(i)).find(".book-nember");
	        allMoney =0;
	        allNum=0;
	        for(var j=0;j<bookList.length;j++){
	            var price = $(bookList.eq(j)).children(".price");
	            var number = $(bookList.eq(j)).children(".number");
	            allNum += parseInt(number[0].innerHTML.substring(1,number[0].length))
	            allMoney +=parseFloat(price[0].innerHTML.substring(1,price[0].length))*parseInt(number[0].innerHTML.substring(1,number[0].length));
	            bookNum.html(allNum)
	            money.html("¥"+allMoney.toFixed(2));
	        }
	    }
    </script>
</body>
</html>