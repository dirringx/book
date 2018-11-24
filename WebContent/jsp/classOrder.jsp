<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <li><a href="#">未提交</a></li>
        <li><a href="#">已提交</a></li>
        <li><a href="#">已领取</a></li>
    </ul>
    <ul id="orderList">
        <li>
            <div class="details">
                <span class="order-number">订单编号：1009635620189222323</span>
                <span class="order-date">下单日期：2018-09-21  23:00:00</span>
                <span class="order-status">未提交</span>
            </div>
            <div class="book-list">
                <img class="book-img" src="${ctx}/styles/img/book.jpg" />
                <span class="book-name">概率论与数理统计</span>
                <span class="price">¥32.68</span>
                <span class="number">x1</span>
            </div>
            <div class="book-list">
                <img class="book-img" src="${ctx}/styles/img/book.jpg" />
                <span class="book-name">概率论与数理统计</span>
                <span class="price">¥3</span>
                <span class="number">x4</span>
            </div>
            <span id="totalNumber">书籍总数：<span class="book-nember"></span></span>
            <span id="totalPrice">总价：<span class="money"></span></span>
            <button class="submit">提交</button>
        </li>
        <li>
            <div class="details">
                <span class="order-number">订单编号：1009635620189222323</span>
                <span class="order-date">下单日期：2018-09-21  23:00:00</span>
                <span class="order-status">未提交</span>
            </div>
            <div class="book-list">
                <img class="book-img" src="${ctx}/styles/img/book.jpg" />
                <span class="book-name">概率论与数理统计</span>
                <span class="price">¥32.68</span>
                <span class="number">x5</span>
            </div>
            <div class="book-list">
                <img class="book-img" src="${ctx}/styles/img/book.jpg" />
                <span class="book-name">概率论与数理统计</span>
                <span class="price">¥32.68</span>
                <span class="number">x1</span>
            </div>
            <span id="totalNumber">书籍总数：<span class="book-nember"></span></span>
            <span id="totalPrice">总价：<span class="money"></span></span>
            <button class="submit">提交</button>
        </li>
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